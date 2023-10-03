-- listando a quantidade de feedback em teaching method agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, 
	u.username, 
	count(f.id) as quantidade
from teaching_method_feedback f, 
	teaching_method c, users u
where f.teaching_method_id = c.id
and f.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username
order by 1, quantidade desc


-- listando a quantidade de feedback de teaching method com comentario "ja usaram"
-- agrupados por usuario e "ja usuram"
-- considerando apenas os usuarios participantes do estudo de caso
select f.user_id, min(u.username), f.used_already,
	count(distinct f.id) as quantidade_teaching_method_comment
from teaching_method_feedback f, users u
where length(f.used_already_comment) > 0 
and f.user_id not in (1,3,23,25,25,26)
and f.user_id = u.id
group by f.user_id, f.used_already
order by 2;


-- listando a quantidade de feedback de teaching method com comentario "pretende usar"
-- agrupados por usuario e "pretende usar"
-- considerando apenas os usuarios participantes do estudo de caso
select f.user_id, min(u.username), f.will_use,
	count(distinct f.id) as quantidade_teaching_method_comment
from teaching_method_feedback f, users u
where length(f.will_use_comment) > 0 
and f.user_id not in (1,3,23,25,25,26)
and f.user_id = u.id
group by f.user_id, f.will_use
order by 2;


-- listando as teaching method mais comentados que FORAM utilizadas
-- limitando a quantidade de feedback em 3
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.definition)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = true
group by rf.teaching_method_id
having count(rf.id) >= 3
order by quantidade desc


-- listando as teaching method mais comentados que NÃO FORAM utilizadas e PRETENDE utilizar
-- limitando a quantidade de feedback em 3
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.definition)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = false
and rf.will_use = true
group by rf.teaching_method_id
having count(rf.id) >= 3
order by quantidade desc


-- listando as teaching method mais comentados que NÃO FORAM utilizadas e NÃO PRETENDE utilizar
-- limitando a quantidade de feedback em 1
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.definition)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = false
and rf.will_use = false
group by rf.teaching_method_id
having count(rf.id) >= 1
order by quantidade desc



-- listando as teaching method que ao mesmo tempo FORAM E NÃO FORAM UTILIZADAS
-- limitando a quantidade de feedback em 2
-- PODE INDICAR MÁ ESCRITA DA TEACHING METHOD? OU SERIA ALGO MAIS?
select teaching_method_id, min(quantidade), max(quantidade), min(definition)
from (
	select rf.teaching_method_id as teaching_method_id, 
		rf.used_already as used_already,
		count(rf.id) as quantidade,
		max(r.definition) as definition
	from teaching_method_feedback rf, teaching_method r
	where rf.teaching_method_id = r.id
            and rf.user_id not in (1,3,23,25,25,26)
	group by rf.teaching_method_id, rf.used_already
	having count(rf.id) >= 2
)
group by teaching_method_id
having count(teaching_method_id) = 2
order by 1 



-- listando as teaching method que não foram utilizadas e ao mesmo tempo SERÃO E NÃO SERÃO UTILIZADAS
-- limitando a quantidade de feedback em 1
-- PODE INDICAR MÁ ESCRITA DA RECOMENDAÇÃO? OU SERIA ALGO MAIS?
select teaching_method_id, min(quantidade), max(quantidade), min(definition)
from (
	select rf.teaching_method_id as teaching_method_id, 
		rf.will_use as will_use,
		count(rf.id) as quantidade,
		max(r.definition) as definition
	from teaching_method_feedback rf, teaching_method r
	where rf.teaching_method_id = r.id
            and rf.user_id not in (1,3,23,25,25,26)
            and rf.used_already = true
	group by rf.teaching_method_id, rf.will_use
	having count(rf.id) >= 1
)
group by teaching_method_id
having count(teaching_method_id) = 2
order by 1 