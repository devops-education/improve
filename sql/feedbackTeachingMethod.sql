-- listando a quantidade de feedback em teaching method agrupadas por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, 
	u.username, 
	count(f.id) as quantidade
from teaching_method_feedback f, 
	teaching_method c, users u
where f.teaching_method_id = c.id
and f.user_id = u.id
and f.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by u.username
order by 1, quantidade desc



-- listando as teaching method mais comentados que FORAM utilizadas
-- limitando a quantidade de feedback em 3
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.name)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.used_already = true
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.teaching_method_id
having count(rf.id) >= 3
order by quantidade desc


-- listando as teaching method mais comentados que NÃO FORAM utilizadas e PRETENDE utilizar
-- limitando a quantidade de feedback em 3
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.name)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.used_already = false
and rf.will_use = true
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.teaching_method_id
having count(rf.id) >= 2
order by quantidade desc


-- listando as teaching method mais comentados que NÃO FORAM utilizadas e NÃO PRETENDE utilizar
-- limitando a quantidade de feedback em 1
select rf.teaching_method_id, count(rf.id) as quantidade, max(r.name)
from teaching_method_feedback rf, teaching_method r
where rf.teaching_method_id = r.id
and rf.used_already = false
and rf.will_use = false
and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by rf.teaching_method_id
having count(rf.id) >= 1
order by quantidade desc



-- listando as teaching methods que ao mesmo tempo FORAM + SERÃO COM NÃO SERÃO UTILIZADAS
-- limitando a quantidade de feedback em 1
-- PODE INDICAR MÁ ESCRITA DA RECOMENDAÇÃO? OU SERIA ALGO MAIS?
SELECT WONT_USE.teaching_method_id, WONT_USE.wont_use_amount, USED_ALREADY_WILL_USE.used_already_will_use_amount, WONT_USE.name
FROM 
(
    -- selecionando a quantidade de nao uso das recomendacoes
    -- filtrando por 1
	select rf.teaching_method_id as teaching_method_id, 
		count(rf.id) as wont_use_amount,
		max(r.name) as name
	from teaching_method_feedback rf, teaching_method r
	where rf.teaching_method_id = r.id
			and rf.used_already = false
			and rf.will_use = false
            and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
	group by rf.teaching_method_id
	having count(rf.id) >= 1
) WONT_USE

JOIN 
(
    -- selecionando a quantidade de recomendacoes ja usadas adicionadas com as que serao usadas
    -- filtrando por 1
    select coalesce(USED_ALREADY.teaching_method_id, WILL_USE.teaching_method_id) as teaching_method_id, 
           coalesce(USED_ALREADY.used_already_amount,0) + coalesce(WILL_USE.will_use_amount, 0) as used_already_will_use_amount
    from (
        -- selecionando a quantidade de recomendacoes ja usadas
        (select rf.teaching_method_id as teaching_method_id, 
            count(rf.id) as used_already_amount
        from teaching_method_feedback rf, teaching_method r
        where rf.teaching_method_id = r.id
                and rf.used_already = true
                and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by rf.teaching_method_id) USED_ALREADY
        
        full join
        
        -- selecionando a quantidade de recomendacoes a serem usadas usadas
        (select rf.teaching_method_id as teaching_method_id, 
            count(rf.id) as will_use_amount
        from teaching_method_feedback rf, teaching_method r
        where rf.teaching_method_id = r.id
                and rf.used_already = false
                and rf.will_use = true
                and rf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by rf.teaching_method_id) WILL_USE
        
        on USED_ALREADY.teaching_method_id = WILL_USE.teaching_method_id
    )
    where coalesce(USED_ALREADY.used_already_amount,0) + coalesce(WILL_USE.will_use_amount, 0) >= 1
) USED_ALREADY_WILL_USE

ON WONT_USE.teaching_method_id= USED_ALREADY_WILL_USE.teaching_method_id

ORDER BY 2 DESC, 3 DESC
