-- calculando as quantidades de feedback de desafio agrupados por usuario e por tema
-- considerando apenas os usuarios participantes do estudo de caso
select cf.user_id, max(u.username), max(c.theme), count(cf.id) as quantidade
from challenge_feedback cf, challenge c, users u
where cf.challenge_id = c.id
and cf.user_id = u.id
and cf.user_id not in (1,3,23,25,25,26)
group by cf.user_id, c.theme
order by 1, quantidade desc