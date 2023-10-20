-- listando a quantidade de feedback em recomendacoes agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from recommendation_feedback f, recommendation c, users u
where f.recommendation_id = c.id
and f.user_id = u.id
and f.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by u.username, c.theme
order by 1, quantidade desc


-- listando as recomendações que FORAM utilizadas
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, count(rf.id) as quantidade, max(r.main_idea), max(r.theme)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.used_already = true
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações que NÃO FORAM utilizadas e PRETENDE utilizar
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, count(rf.id) as quantidade, max(r.main_idea), max(r.theme)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.used_already = false
and rf.will_use = true
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações que NÃO FORAM utilizadas e NÃO PRETENDE utilizar
-- limitando a quantidade de feedback em 4
select rf.recommendation_id, count(rf.id) as quantidade, max(r.main_idea), max(r.theme)
from recommendation_feedback rf, recommendation r
where rf.recommendation_id = r.id
and rf.used_already = false
and rf.will_use = false
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.recommendation_id
having count(rf.id) >= 4
order by quantidade desc


-- listando as recomendações que ao mesmo tempo FORAM + SERÃO COM NÃO SERÃO UTILIZADAS
-- limitando a quantidade de feedback em 3
-- PODE INDICAR MÁ ESCRITA DA RECOMENDAÇÃO? OU SERIA ALGO MAIS?
SELECT WONT_USE.recommendation_id, WONT_USE.wont_use_amount, USED_ALREADY_WILL_USE.used_already_will_use_amount, WONT_USE.main_idea, WONT_USE.theme
FROM 
(
    -- selecionando a quantidade de nao uso das recomendacoes
    -- filtrando por 3
	select rf.recommendation_id as recommendation_id, 
		max(r.theme) as theme, 
		count(rf.id) as wont_use_amount,
		max(r.main_idea) as main_idea
	from recommendation_feedback rf, recommendation r
	where rf.recommendation_id = r.id
			and rf.used_already = false
			and rf.will_use = false
            and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
	group by rf.recommendation_id
	having count(rf.id) >= 3
) WONT_USE

JOIN 
(
    -- selecionando a quantidade de recomendacoes ja usadas adicionadas com as que serao usadas
    -- filtrando por 3
    select coalesce(USED_ALREADY.recommendation_id, WILL_USE.recommendation_id) as recommendation_id, 
           coalesce(USED_ALREADY.used_already_amount,0) + coalesce(WILL_USE.will_use_amount, 0) as used_already_will_use_amount
    from (
        -- selecionando a quantidade de recomendacoes ja usadas
        (select rf.recommendation_id as recommendation_id, 
            count(rf.id) as used_already_amount
        from recommendation_feedback rf, recommendation r
        where rf.recommendation_id = r.id
                and rf.used_already = true
                and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by rf.recommendation_id) USED_ALREADY
        
        full join
        
        -- selecionando a quantidade de recomendacoes a serem usadas usadas
        (select rf.recommendation_id as recommendation_id, 
            count(rf.id) as will_use_amount
        from recommendation_feedback rf, recommendation r
        where rf.recommendation_id = r.id
                and rf.used_already = false
                and rf.will_use = true
                and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by rf.recommendation_id) WILL_USE
        
        on USED_ALREADY.recommendation_id = WILL_USE.recommendation_id
    )
    where coalesce(USED_ALREADY.used_already_amount,0) + coalesce(WILL_USE.will_use_amount, 0) >= 3
) USED_ALREADY_WILL_USE

ON WONT_USE.recommendation_id= USED_ALREADY_WILL_USE.recommendation_id

ORDER BY 2 DESC, 3 DESC
