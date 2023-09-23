-- calculando o tempo de sessao do usuario a duracao entre o tempo maximo e o tempo mínimo
-- de um log dos tipos 'CHALLENGE', 'CHALLENGE_DETAIL', 'RECOMMENDATION', 'RECOMMENDATION_DETAIL'
-- considerando apenas os usuarios participantes do estudo de caso
select u.username, max(u.id) as id, to_char(l.time, 'dd/mm/yyyy') as data, 
    max(l.time) - min(l.time) as duration, 
    min(l.time) as start, 
    max(l.time) as end
from view_log l, users u
where l.user_id = u.id
and l.type in ('CHALLENGE', 'CHALLENGE_DETAIL', 'RECOMMENDATION', 'RECOMMENDATION_DETAIL')
and l.user_id not in (1,3,23,25,25,26)
group by u.username, to_char(l.time, 'dd/mm/yyyy')
order by 1, 3;
