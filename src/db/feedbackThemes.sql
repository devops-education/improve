select distinct(c.theme), cf.user_id, u.username
from challenge_feedback cf, challenge c, users u
where cf.challenge_id = c.id
and cf.user_id = u.id
order by u.username