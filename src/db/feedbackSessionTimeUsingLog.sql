select u.username, max(u.id) as id, max(l.time) - min(l.time) as duration, min(l.time), max(l.time)
from view_log l, users u
where l.user_id = u.id
and l.type in ('CHALLENGE', 'CHALLENGE_DETAIL', 'RECOMMENDATION', 'RECOMMENDATION_DETAIL')
group by u.username;
