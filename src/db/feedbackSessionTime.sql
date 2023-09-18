select u.username, max(u.id) as id, max(rf.update_time) - min(f.update_time) as duration, min(f.update_time), max(rf.update_time)
from challenge_feedback f, recommendation_feedback rf, users u
where f.user_id = u.id and rf.user_id = u.id
group by u.username;
