-- listando a quantidade de feedback em desafios agrupados por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from challenge_feedback f, challenge c, users u
where f.challenge_id = c.id
and f.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username, c.theme
order by 1, quantidade desc


-- listando a quantidade de feedback de desafios com comentario 
-- agrupados por usuario e "serão mitigados"
-- considerando apenas os usuarios participantes do estudo de caso
select f.user_id, max(u.username), f.will_mitigate, count(distinct f.id) as quantidade_challenge_comment
from challenge_feedback f, users u
where length(f.will_mitigate_comment) > 0 is not null
and f.user_id not in (1,3,23,25,25,26)
and f.user_id = u.id
group by f.user_id, f.will_mitigate
order by 2;

