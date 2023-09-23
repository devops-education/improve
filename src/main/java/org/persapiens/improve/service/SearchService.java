package org.persapiens.improve.service;

import jakarta.annotation.PostConstruct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.lucene.analysis.en.EnglishAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StoredField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.ByteBuffersDirectory;
import org.persapiens.improve.domain.IdBean;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public abstract class SearchService<T extends IdBean<Long>> {

	private static final String ID = "id";

	private static final String DESCRIPTION = "description";

	private IndexSearcher dirSearcher;

	private long max;

	protected abstract long count();

	protected abstract Collection<T> findAll();

	protected abstract String description(T t);

	@PostConstruct
	public void initialize() throws IOException {
		// Index that is using stopwords and stems for better search functionality
		ByteBuffersDirectory directory = new ByteBuffersDirectory();

		max = count();

		try (IndexWriter directoryWriter = new IndexWriter(directory, new IndexWriterConfig(new EnglishAnalyzer()));) {
			for (T line : findAll()) {
				Document doc = new Document();
				doc.add(new StoredField(ID, line.getId()));
				doc.add(new TextField(DESCRIPTION, description(line), Field.Store.YES));
				directoryWriter.addDocument(doc);
			}
		}

		DirectoryReader indexReader = DirectoryReader.open(directory);
		dirSearcher = new IndexSearcher(indexReader);
	}

	private Query query(String keyword) throws ParseException {
		QueryParser parser = new QueryParser(DESCRIPTION, new EnglishAnalyzer());
		return parser.parse(keyword);
	}

	public boolean search(String keyword, Long id) throws ParseException, IOException {
		Query query = query(keyword);
		TopDocs topDocs = dirSearcher.search(query, (int) max);
		List<Long> icdEntities = new ArrayList<>();
		for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
			Document document = dirSearcher.doc(scoreDoc.doc);
			icdEntities.add(Long.valueOf(document.get(ID)));
		}

		return icdEntities.contains(id);
	}

	public String validate(String keyword) {
		try {
			if (StringUtils.hasText(keyword)) {
				query(keyword);
			}
			return "";
		}
		catch (ParseException ex) {
			return ex.getMessage();
		}
	}

}
