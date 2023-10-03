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


-- listando os desafios mais comentados que SERÃO mitigados
-- limitando a quantidade de feedback em 4
select cf.challenge_id, max(c.theme), count(cf.id) as quantidade, max(c.main_idea)
from challenge_feedback cf, challenge c
where cf.challenge_id = c.id
and cf.user_id not in (1,3,23,25,25,26)
and cf.will_mitigate = true
group by cf.challenge_id
having count(cf.id) >= 4
order by quantidade desc


-- listando os desafios mais comentados que NÃO vao ser mitigados
-- limitando a quantidade de feedback em 3
select cf.challenge_id, max(c.theme), count(cf.id) as quantidade, max(c.main_idea)
from challenge_feedback cf, challenge c
where cf.challenge_id = c.id
and cf.user_id not in (1,3,23,25,25,26)
and cf.will_mitigate = false
group by cf.challenge_id
having count(cf.id) >= 3
order by quantidade desc


-- listando as desafios que serao ao mesmo tempo mitigados e nao mitigados
-- limitando a quantidade de feedback em 3
-- PODE INDICAR MÁ ESCRITA DO DESAFIO? OU ALGO MAIS A INVESTIGAR?
select challenge_id, min(quantidade), max(quantidade), min(main_idea)
from (
	select cf.challenge_id as challenge_id, 
		max(c.theme) as theme, 
		cf.will_mitigate as will_mitigate,
		count(cf.id) as quantidade,
		max(c.main_idea) as main_idea
	from challenge_feedback cf, challenge c
	where cf.challenge_id = c.id
            and cf.user_id not in (1,3,23,25,25,26)
	group by cf.challenge_id, cf.will_mitigate
	having count(cf.id) >= 3
)
group by challenge_id
having count(challenge_id) = 2
order by 1 


-- top 10 e total de challenges com mais respostas "vai mitigar", e "tem link com recomendação"

-- top 10 e total de challenges com mais respostas "vai mitigar", e "NÂO tem link com recomendação"
