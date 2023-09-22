select distinct(c.theme), cf.user_id, u.username
from challenge_feedback cf, challenge c, users u
where cf.challenge_id = c.id
and cf.user_id = u.id
and cf.user_id not in (1,3,23,25,25,26)
order by u.username