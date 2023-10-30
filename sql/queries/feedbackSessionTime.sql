-- calculando o tempo de sessao do usuario a duracao entre o tempo maximo
-- de uma feedback de recomendacao e o tempo minimo de feedback de um desafio
-- considerando apenas os usuarios participantes do estudo de caso
select u.username, max(u.id) as id, to_char(rf.update_time, 'dd/mm/yyyy'),
    max(rf.update_time) - min(f.update_time) as duration,
    min(f.update_time) as start, 
    max(rf.update_time) as end
from challenge_feedback f, recommendation_feedback rf, users u
where f.user_id = u.id and rf.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username, to_char(rf.update_time, 'dd/mm/yyyy')
order by 1,3;

