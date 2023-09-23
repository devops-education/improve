-- listando a quantidade de feedback em recomendacoes agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from recommendation_feedback f, recommendation c, users u
where f.recommendation_id = c.id
and f.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username, c.theme
order by 1, quantidade desc


-- listando a quantidade de feedback de desafios com comentario "ja usaram"
-- agrupados por usuario e "ja usuram"
-- considerando apenas os usuarios participantes do estudo de caso
select f.user_id, min(u.username), f.used_already,
	count(distinct f.id) as quantidade_recommendation_comment
from recommendation_feedback f, users u
where length(f.used_already_comment) > 0 
and f.user_id not in (1,3,23,25,25,26)
and f.user_id = u.id
group by f.user_id, f.used_already
order by 2;


-- listando a quantidade de feedback de desafios com comentario "pretende usar"
-- agrupados por usuario e "pretende usar"
-- considerando apenas os usuarios participantes do estudo de caso
select f.user_id, min(u.username), f.will_use,
	count(distinct f.id) as quantidade_recommendation_comment
from recommendation_feedback f, users u
where length(f.will_use_comment) > 0 
and f.user_id not in (1,3,23,25,25,26)
and f.user_id = u.id
group by f.user_id, f.will_use
order by 2;
