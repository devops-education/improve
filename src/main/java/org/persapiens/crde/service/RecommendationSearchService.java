package org.persapiens.crde.service;

import jakarta.annotation.PostConstruct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.lucene.analysis.br.BrazilianAnalyzer;
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
import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationInterview;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationSearchService {

    private static final String ID = "id";
    private static final String DESCRIPTION = "description";

    private IndexSearcher dirSearcher;
    
    @Autowired
    private RecommendationRepository recommendationRepository;
    
    private long max;

    @PostConstruct
    public void initialize() throws IOException {
        // Index that is using stopwords and stems for better search functionality
        ByteBuffersDirectory directory = new ByteBuffersDirectory();

        max = recommendationRepository.count();
        
        try (IndexWriter directoryWriter = new IndexWriter(directory, new IndexWriterConfig(new BrazilianAnalyzer())); ) {
            for (Recommendation line : recommendationRepository.findByLeftJoinLinksOrderByRecommendationInterviewsSizeDesc()) {
                Document doc = new Document();
                doc.add(new StoredField(ID, line.getId()));
                String riquotes = "";
                String riresumes = "";
                for (RecommendationInterview ri : line.getRecommendationInterviews()) {
                    riquotes += " " + ri.getQuote();
                    riresumes += " " + ri.getResume();
                }
                String body = line.getMainIdea()
                    + " " + line.getTheme().toString()
                    + " " + line.getCode()
                    + " " + line.getTags()
                    + " " + riquotes
                    + " " + riresumes;
                doc.add(new TextField(DESCRIPTION, body, Field.Store.YES));
                directoryWriter.addDocument(doc);
            }
        }

        DirectoryReader indexReader = DirectoryReader.open(directory);
        dirSearcher = new IndexSearcher(indexReader);
    }

    public boolean search(String keyword, Long id) throws ParseException, IOException {
        QueryParser parser = new QueryParser(DESCRIPTION, new BrazilianAnalyzer());
        Query query = parser.parse(keyword);
        TopDocs topDocs = dirSearcher.search(query, (int) max);
        List<Long> icdEntities = new ArrayList<>();
        for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
            Document document = dirSearcher.doc(scoreDoc.doc);
            icdEntities.add(Long.parseLong(document.get(ID)));
        }

        return icdEntities.contains(id);
    }
}
