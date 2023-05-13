select count(ct.challenge), t.descricao
from challenge_tag ct, tag t
where ct.tag = t.id
group by t.descricao
order by 1 desc;

select count(rt.recommendation), t.descricao
from recommendation_tag rt, tag t
where rt.tag = t.id
group by t.descricao
order by 1 desc;

