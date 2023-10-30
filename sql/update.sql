update challenge 
set theme = 'CURRICULUM'
where theme = 'curriculum';

update challenge 
set theme = 'DEVOPS_CONCEPTS'
where theme = 'devops concepts';

update challenge 
set theme = 'ASSESSMENT'
where theme = 'assessment';

update challenge 
set theme = 'ENVIRONMENT_SETUP'
where theme = 'environment setup';

update challenge 
set theme = 'TOOL_TECHNOLOGY'
where theme = 'tool / technology';

update challenge 
set theme = 'CLASS_PREPARATION'
where theme = 'class preparation';

update challenge 
set theme = 'STRATEGIES_IN_COURSE_EXECUTION'
where theme = 'strategies in course execution';


update recommendation 
set theme = 'CURRICULUM'
where theme = 'curriculum';

update recommendation
set theme = 'DEVOPS_CONCEPTS'
where theme = 'devops concepts';

update recommendation
set theme = 'ASSESSMENT'
where theme = 'assessment';

update recommendation
set theme = 'ENVIRONMENT_SETUP'
where theme = 'environment setup';

update recommendation
set theme = 'TOOL_TECHNOLOGY'
where theme = 'tool / technology';

update recommendation
set theme = 'CLASS_PREPARATION'
where theme = 'class preparation';

update recommendation
set theme = 'STRATEGIES_IN_COURSE_EXECUTION'
where theme = 'strategies in course execution';

update challenge
set main_idea = abstracts
where main_idea is null;

update recommendation
set main_idea = abstracts
where main_idea is null;

