-- listando a quantidade de feedback em desafios agrupados por usuarios e tema
-- considerando apenas os usuarios participantes do estudo de caso
select max(f.user_id) as user_id, u.username, c.theme, count(f.id) as quantidade
from challenge_feedback f, challenge c, users u
where f.challenge_id = c.id
and f.user_id = u.id
and f.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by u.username, c.theme
order by 1, quantidade desc


-- listando os desafios mais comentados que SERÃO mitigados
-- limitando a quantidade de feedback em 4
select cf.challenge_id, count(cf.id) as quantidade, max(c.main_idea), max(c.theme)
from challenge_feedback cf, challenge c
where cf.challenge_id = c.id
and cf.will_mitigate = true
and cf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by cf.challenge_id
having count(cf.id) >= 4
order by quantidade desc


-- listando os desafios mais comentados que NÃO vao ser mitigados
-- limitando a quantidade de feedback em 3
select cf.challenge_id, count(cf.id) as quantidade, max(c.main_idea), max(c.theme)
from challenge_feedback cf, challenge c
where cf.challenge_id = c.id
and cf.will_mitigate = false
and cf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
group by cf.challenge_id
having count(cf.id) >= 3
order by quantidade desc


-- listando as desafios que serao ao mesmo tempo mitigados e nao mitigados
-- limitando a quantidade de feedback em 3
-- PODE INDICAR MÁ ESCRITA DO DESAFIO? OU ALGO MAIS A INVESTIGAR?
select WONT.challenge_id, WONT.wont_amount, WILL.will_amount, WONT.main_idea, WONT.theme
from (
	select cf.challenge_id as challenge_id, 
		max(c.theme) as theme, 
		count(cf.id) as wont_amount,
		max(c.main_idea) as main_idea
	from challenge_feedback cf, challenge c
	where cf.challenge_id = c.id
            and cf.will_mitigate = false
            and cf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by cf.challenge_id
	having count(cf.id) >= 3
) WONT
JOIN (
	select cf.challenge_id as challenge_id, 
		max(c.theme) as theme, 
		count(cf.id) as will_amount,
		max(c.main_idea) as main_idea
	from challenge_feedback cf, challenge c
	where cf.challenge_id = c.id
            and cf.will_mitigate = true
            and cf.user_id in (27,28,29,30,31,32,35,36,37,40,41)
        group by cf.challenge_id
	having count(cf.id) >= 3
) WILL

ON WONT.challenge_id= WILL.challenge_id

ORDER BY 2 DESC, 3 DESC


-- top 10 e total de challenges com mais respostas "vai mitigar", e "tem link com recomendação"

-- top 10 e total de challenges com mais respostas "vai mitigar", e "NÂO tem link com recomendação"
