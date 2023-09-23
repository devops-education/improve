-- listando a quantidade de feedback em recomendacoes agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from recommendation_feedback f, recommendation c, users u
where f.recommendation_id = c.id
and f.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username, c.theme
order by 1, quantidade desc


-- ADICIONAR COMENTARIO
select f.user_id, count(distinct f.id) as quantidade_recommendation_comment
from recommendation_feedback f
where length(f.will_use_comment) > 0 and will_use_comment is not null
and f.user_id not in (1,3,23,25,25,26)
group by f.user_id;

