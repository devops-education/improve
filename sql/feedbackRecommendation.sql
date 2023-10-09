-- listando a quantidade de feedback em recomendacoes agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from recommendation_feedback f, recommendation c, users u
where f.recommendation_id = c.id
and f.user_id = u.id
and f.user_id not in (1,3,23,25,25,26)
group by u.username, c.theme
order by 1, quantidade desc


-- listando a quantidade de feedback de recommendacao com comentario "ja usaram"
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


-- listando a quantidade de feedback de recommendacao com comentario "pretende usar"
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


-- listando as recomendações mais comentados que FORAM utilizadas
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, max(r.theme), count(rf.id) as quantidade, max(r.main_idea)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = true
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações mais comentados que NÃO FORAM utilizadas e PRETENDE utilizar
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, max(r.theme), count(rf.id) as quantidade, max(r.main_idea)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = false
and rf.will_use = true
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações mais comentados que NÃO FORAM utilizadas e NÃO PRETENDE utilizar
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, max(r.theme), count(rf.id) as quantidade, max(r.main_idea)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.user_id not in (1,3,23,25,25,26)
and rf.used_already = false
and rf.will_use = false
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações que ao mesmo tempo FORAM E NÃO FORAM UTILIZADAS
-- limitando a quantidade de feedback em 4
-- PODE INDICAR MÁ ESCRITA DA RECOMENDAÇÃO? OU SERIA ALGO MAIS?
select recommendation_id, min(quantidade), max(quantidade), min(main_idea), max(theme)
from (
	select rf.recommendation_id as recommendation_id, 
		max(r.theme) as theme, 
		rf.used_already as used_already,
		count(rf.id) as quantidade,
		max(r.main_idea) as main_idea
	from recommendation_feedback rf, recommendation r
	where rf.recommendation_id = r.id
        and rf.user_id not in (1,3,23,25,25,26)
	group by rf.recommendation_id, rf.used_already
	having count(rf.id) >= 4
)
group by recommendation_id
having count(recommendation_id) = 2
order by 1 



-- listando as recomendações que não foram utilizadas e ao mesmo tempo SERÃO E NÃO SERÃO UTILIZADAS
-- limitando a quantidade de feedback em 2
-- PODE INDICAR MÁ ESCRITA DA RECOMENDAÇÃO? OU SERIA ALGO MAIS?
select recommendation_id, min(quantidade), max(quantidade), min(main_idea), max(theme)
from (
	select rf.recommendation_id as recommendation_id, 
		max(r.theme) as theme, 
		rf.will_use as will_use,
		count(rf.id) as quantidade,
		max(r.main_idea) as main_idea
	from recommendation_feedback rf, recommendation r
	where rf.recommendation_id = r.id
        and rf.user_id not in (1,3,23,25,25,26)
		and rf.used_already = false
	group by rf.recommendation_id, rf.will_use
	having count(rf.id) >= 3
)
group by recommendation_id
having count(recommendation_id) >= 2
order by 1 