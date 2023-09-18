select f.user_id, count(distinct f.id) as quantidade_challenge
from challenge_feedback f
group by f.user_id;

select f.user_id, count(distinct f.id) as quantidade_challenge_comment
from challenge_feedback f
where length(f.will_mitigate_comment) > 0 and will_mitigate_comment is not null
group by f.user_id;

select f.user_id, count(distinct f.id) as quantidade_recommendation
from recommendation_feedback f
group by f.user_id;

select f.user_id, count(distinct f.id) as quantidade_recommendation_comment
from recommendation_feedback f
where length(f.will_use_comment) > 0 and will_use_comment is not null
group by f.user_id;

