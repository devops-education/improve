--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-01 00:31:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3345 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3339 (class 0 OID 16581)
-- Dependencies: 218
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (51, 'Rapid and constant changes in DevOps make it difficult to create a teaching plan.', 'This teaching plan is not and should not be completed, right? He doesn''t have it, he''s never ready. ... Things change too fast, the focus changes too fast. Rapid and constant changes in DevOps make it difficult to create a teaching plan.  teaching; planning; change; training; update; advance; organization; change; improvement; evolution; curriculum; syllabus; schedule; progress', 1, 'Challenge during the creation of the teaching plan related to rapid and constant changes in DevOps  ', 'This teaching plan is not and should not be completed, right? He doesn''t have it, he''s never ready. ... Things change too fast, the focus changes too fast.', 'Rapid and constant changes in DevOps make it difficult to create a teaching plan.', true, 'teaching; planning; change; training; update; advance; organization; change; improvement; evolution; curriculum; syllabus; schedule; progress', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (81, 'There is a lack between what the industry wants from students about DevOps and what the university teaches.', 'We hear from our industrial partners and from industry in general is there''s this HUGE gap right? Between what the industry needs and what university provides. There is a lack between what the industry wants from students about DevOps and what the university teaches.  industry; university; concept; curriculum; academy; syllabus', 1, 'difference between industry desire about student knowledge of DevOps and DevOps academic teaching', 'We hear from our industrial partners and from industry in general is there''s this HUGE gap right? Between what the industry needs and what university provides.', 'There is a lack between what the industry wants from students about DevOps and what the university teaches.', true, 'industry; university; concept; curriculum; academy; syllabus', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (90, 'There is no consensus if DevOps course should be mandatory or optional.', 'Like, do you have to go through this course to if you''re doing a master or a bachelor in software engineering, is it mandatory to go through DevOps or is it like an option that an optional path that you''re following is this kind of, uh, there is no consensus on, on those kinds of, um, uh, things. There is no consensus if DevOps course should be mandatory or optional.  mandatory; optional; course; curriculum; syllabus; prerequisite; requisite', 1, 'no consensual about DevOps discipline mandatory', 'Like, do you have to go through this course to if you''re doing a master or a bachelor in software engineering, is it mandatory to go through DevOps or is it like an option that an optional path that you''re following is this kind of, uh, there is no consensus on, on those kinds of, um, uh, things.', 'There is no consensus if DevOps course should be mandatory or optional.', true, 'mandatory; optional; course; curriculum; syllabus; prerequisite; requisite', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (47, 'The DevOps concepts collaboration, communication and organization are difficult to assess due to the high degree of subjectivity.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate. The DevOps concepts collaboration, communication and organization are difficult to assess due to the high degree of subjectivity.  collaboration; communication; organization; assessment; subjectivity; participation; partnership; conversation; concept; theory; management; evaluation; interaction; discussion', 1, 'Difficulty in subjective DevOps concepts during assessment.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.', 'The DevOps concepts collaboration, communication and organization are difficult to assess due to the high degree of subjectivity.', true, 'collaboration; communication; organization; assessment; subjectivity; participation; partnership; conversation; concept; theory; management; evaluation; interaction; discussion', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (6, 'There is no taxonomy about what are the main DevOps concepts.

There''s a lack of reference on operations concepts.

It is difficult to express and formalize DevOps concepts. There is not bulletproof in devops.', 'There is no accepted taxonomy of what the concepts of DevOps are.

There''s a lack of frame of reference on even what operations is. Most people get into operations, at least in my experience sort of accidentally.

 How to express concept, formalize them. But at the same time also focus on those issues that are getting in the way, the non-industrial way of, you know, writing scripts that if you want to industrialize them and they become Bulletproof, it''s a mess, right? It''s difficult. There is no taxonomy about what are the main DevOps concepts.

There''s a lack of reference on operations concepts.

It is difficult to express and formalize DevOps concepts. There is not bulletproof in devops. There is no convention about DevOps concepts. taxonomy; concept; theory', 3, 'Lack of taxonomy of DevOps concepts', 'There is no accepted taxonomy of what the concepts of DevOps are.

There''s a lack of frame of reference on even what operations is. Most people get into operations, at least in my experience sort of accidentally.

 How to express concept, formalize them. But at the same time also focus on those issues that are getting in the way, the non-industrial way of, you know, writing scripts that if you want to industrialize them and they become Bulletproof, it''s a mess, right? It''s difficult.', 'There is no convention about DevOps concepts.', true, 'taxonomy; concept; theory', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (57, 'It is challeging to verify if the students learn the devops process of working.', 'Are they following the process? Not, did they get the work done in the end? That''s not the important part is did they learn the process and follow it? And did they learn from it? So that''s, it''s kind of challenging. It is challeging to verify if the students learn the devops process of working.  assessment; process; technique; evaluation', 1, 'difficulty in the evaluation of students learn level', 'Are they following the process? Not, did they get the work done in the end? That''s not the important part is did they learn the process and follow it? And did they learn from it? So that''s, it''s kind of challenging.', 'It is challeging to verify if the students learn the devops process of working.', true, 'assessment; process; technique; evaluation', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (10, 'There was no automated environment setup tool to support the student.', '
There wasn''t a tool to configure the environment [...] or to automate these environments then [..] since it became manual. There was no automated environment setup tool to support the student.  automation; environment; technology; setup', 1, 'No automated environment configuration tool.', '
There wasn''t a tool to configure the environment [...] or to automate these environments then [..] since it became manual.', 'There was no automated environment setup tool to support the student.', true, 'automation; environment; technology; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (7, 'Unknown specific devops educational supportive environment.', 'I don''t know any specific teaching devops tool. Unknown specific devops educational supportive environment.  tool; environment; technology', 1, 'Lack of specific tool for DevOps teaching', 'I don''t know any specific teaching devops tool.', 'Unknown specific devops educational supportive environment.', true, 'tool; environment; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (52, 'Difficulty in linking DevOps classes with other subjects of interest to students.', 'DevOps ends up forcing you to tap into a lot of other universes, right? Especially if you go into project as an evaluation method. So, that''s another big challenge, you keep an eye out for what''s going on, which can be correlated and which you can bring as an open scope to be worked also in the discipline, with this type of direction. Which in my case, comes AI student, Bank student, Software Engineering student, pay for the post, and that then you can''t just stay in the context of developing software, delivering software on DevOps, right? There''s a whole other context of things related, for example, to operation, infrastructure analysis, learning, prediction, and so on. Difficulty in linking DevOps classes with other subjects of interest to students.  linking; subject; class', 1, 'Difficulty related to linking DevOps with other disciplines', 'DevOps ends up forcing you to tap into a lot of other universes, right? Especially if you go into project as an evaluation method. So, that''s another big challenge, you keep an eye out for what''s going on, which can be correlated and which you can bring as an open scope to be worked also in the discipline, with this type of direction. Which in my case, comes AI student, Bank student, Software Engineering student, pay for the post, and that then you can''t just stay in the context of developing software, delivering software on DevOps, right? There''s a whole other context of things related, for example, to operation, infrastructure analysis, learning, prediction, and so on.', 'Difficulty in linking DevOps classes with other subjects of interest to students.', true, 'linking; subject; class', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (60, 'Many devops concepts need to be taught.', 'That is a lot of the devops principles that come into play.  Many devops concepts need to be taught.  concept; theory', 1, 'many devops concepts', 'That is a lot of the devops principles that come into play. ', 'Many devops concepts need to be taught.', true, 'concept; theory', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (62, 'Students are not at a level in the their companies where they can introduce DevOps mindset.', 'A lot of the folks who are attending the course are not at a level in the organization where they can actually affect culture [...] they are usually technologists and so they can very easily understand how they can affect things like technology decisions and the application of technology. But many of them are not, let''s say at manager or director or senior director VP levels or things like that will, they can actually affect more senior levels of challenge there. Students are not at a level in the their companies where they can introduce DevOps mindset.  industry; mindset; knowledge; level; hierarchy', 1, 'DevOps students without sufficient level at their companies', 'A lot of the folks who are attending the course are not at a level in the organization where they can actually affect culture [...] they are usually technologists and so they can very easily understand how they can affect things like technology decisions and the application of technology. But many of them are not, let''s say at manager or director or senior director VP levels or things like that will, they can actually affect more senior levels of challenge there.', 'Students are not at a level in the their companies where they can introduce DevOps mindset.', true, 'industry; mindset; knowledge; level; hierarchy', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (65, 'It is difficult for students to understand the importance the software running in production, not just compiling.', 'The challenge of course, is newer students obviously have more than enough to worry about just getting code wrong and compile. Uh, but that''s, that''s the reality, unfortunately, is the code just doesn''t run a compile on a laptop, right? It runs out in production and it''s serving real people. And in this day and age, there is, there is stuff that goes with that. And the more folks understand, at least some of the sooner, the better I hope the software will be. It is difficult for students to understand the importance the software running in production, not just compiling.  production; running; software; understanding', 1, 'difficulty for understand the importance of a correct software over just compiling', 'The challenge of course, is newer students obviously have more than enough to worry about just getting code wrong and compile. Uh, but that''s, that''s the reality, unfortunately, is the code just doesn''t run a compile on a laptop, right? It runs out in production and it''s serving real people. And in this day and age, there is, there is stuff that goes with that. And the more folks understand, at least some of the sooner, the better I hope the software will be.', 'It is difficult for students to understand the importance the software running in production, not just compiling.', false, 'production; running; software; understanding', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (69, 'It''s hard for students to see the values of deployment side and they don''t want to do operational activities.', 'It''s hard for them to see all the values, layers of source side, real shoes, deployment side. They have a tendency because the students write code clicky works done, right? And it''s hard to teach them that no wanting code somewhere. It''s hard for students to see the values of deployment side and they don''t want to do operational activities.  deployment; understanding; operation', 1, 'difficulty in students understanding about deployment side without the knowledge of operational activities', 'It''s hard for them to see all the values, layers of source side, real shoes, deployment side. They have a tendency because the students write code clicky works done, right? And it''s hard to teach them that no wanting code somewhere.', 'It''s hard for students to see the values of deployment side and they don''t want to do operational activities.', true, 'deployment; understanding; operation', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (15, 'Difficulty in assessing students'' understanding of Continuous Delivery.', 'How can we see if the student is aware of the concept of continuous delivery, which is one of the concepts we address? Difficulty in assessing students'' understanding of Continuous Delivery.  continuous delivery; assessment; cd; evaluation; gradual; technique; continuous deployment', 1, 'Difficulty in evaluating the understanding of Continuous Delivery', 'How can we see if the student is aware of the concept of continuous delivery, which is one of the concepts we address?', 'Difficulty in assessing students'' understanding of Continuous Delivery.', true, 'continuous delivery; assessment; cd; evaluation; gradual; technique; continuous deployment', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (64, 'Task done by students do not means that students learned correctly.', 'I have tended to get much more forgiving on how I, for example, grade this particular course, I used to be one of those folks. You know, you, you do the assignment and then you get a grade for the assignment. And at the end of the day, and this is not just devops it''s it''s for other courses as well. At the end of the day, I''m way more concerned. They''re able to get stuff working and that you understand why we''re doing it. Task done by students do not means that students learned correctly.  task; learning; assessment; mission; evaluation', 1, 'Without correlation between task done and learned correctly', 'I have tended to get much more forgiving on how I, for example, grade this particular course, I used to be one of those folks. You know, you, you do the assignment and then you get a grade for the assignment. And at the end of the day, and this is not just devops it''s it''s for other courses as well. At the end of the day, I''m way more concerned. They''re able to get stuff working and that you understand why we''re doing it.', 'Task done by students do not means that students learned correctly.', false, 'task; learning; assessment; mission; evaluation', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (73, 'It is arduous to analyse the code and run scripts for each project.', 'I check out the code of every group. And I look at the commits who has done what I look at. How has it been coded, easy to blatant copy paste of somebody else''s code? Is it innovative? I run all the scripts. I ask them to provide me with scripts that are portable, that will run on my computer. Um, and there has to be a bill script or run script, uh, scenario, script, et cetera. And I run them on my computer. It takes four it''s very long. Uh, but it''s an effective way of checking what they''ve done. It is arduous to analyse the code and run scripts for each project.  coding; script; project; analyse; assessment; activity; task; evaluation; exercise', 1, 'arduous analysis for each project', 'I check out the code of every group. And I look at the commits who has done what I look at. How has it been coded, easy to blatant copy paste of somebody else''s code? Is it innovative? I run all the scripts. I ask them to provide me with scripts that are portable, that will run on my computer. Um, and there has to be a bill script or run script, uh, scenario, script, et cetera. And I run them on my computer. It takes four it''s very long. Uh, but it''s an effective way of checking what they''ve done.', 'It is arduous to analyse the code and run scripts for each project.', false, 'coding; script; project; analyse; assessment; activity; task; evaluation; exercise', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (84, 'The students wouldn''t get the score if they had contributed to some open source project that the developers didn''t merge on github.', 'It was a bit risk because if they had contributed to something that, uh, that the developers didn''t merge they wouldn''t get, uh, get the score. The students wouldn''t get the score if they had contributed to some open source project that the developers didn''t merge on github.  score; open source; project; merge; github; assessment; activity; task; mission; evaluation; exercise; grade', 1, 'student scores based on Github commit approval', 'It was a bit risk because if they had contributed to something that, uh, that the developers didn''t merge they wouldn''t get, uh, get the score.', 'The students wouldn''t get the score if they had contributed to some open source project that the developers didn''t merge on github.', false, 'score; open source; project; merge; github; assessment; activity; task; mission; evaluation; exercise; grade', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (88, 'It is really difficult to quantitative grade scale on the description and the justification of case studies.', 'He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way. It''s, it''s, it''s really difficult to be quantitative and to have this, uh, uh, grade scale that is by the, uh, by the point. It is really difficult to quantitative grade scale on the description and the justification of case studies.  grade; scale; quantitative; case study; justification; assessment; answer; solution; evaluation; score; description; demonstration', 1, 'quantitative grade scale on description and case study', 'He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way. It''s, it''s, it''s really difficult to be quantitative and to have this, uh, uh, grade scale that is by the, uh, by the point.', 'It is really difficult to quantitative grade scale on the description and the justification of case studies.', false, 'grade; scale; quantitative; case study; justification; assessment; answer; solution; evaluation; score; description; demonstration', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (75, 'There is a limitation of what is appropriate to ask the students because they are doing a lot of other activities.', 'And as I said, we, students are doing other things. So this means we are limited in what we can ask them. There is a limitation of what is appropriate to ask the students because they are doing a lot of other activities.  activity; limitation; time; exercise; task; restriction; mission; strategy; execution', 1, 'limitation of about professor´s asks due many activities', 'And as I said, we, students are doing other things. So this means we are limited in what we can ask them.', 'There is a limitation of what is appropriate to ask the students because they are doing a lot of other activities.', false, 'activity; limitation; time; exercise; task; restriction; mission; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (11, 'There was no script for the student on how to install the tools used during the course.', 'There wasn''t a set of [...] scripts that the student should configure this environment himself, install the tool himself [...] whatever the servers he needed. There was no script for the student on how to install the tools used during the course.  script; tutorial; installation; configuration; environment; setup', 1, 'Lack of tools installation script.', 'There wasn''t a set of [...] scripts that the student should configure this environment himself, install the tool himself [...] whatever the servers he needed.', 'There was no script for the student on how to install the tools used during the course.', true, 'script; tutorial; installation; configuration; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (19, 'The student has difficulty realizing the importance of setting the environment.', 'A challenge that is to convince students to give importance to this... they have this other view, this aspect of the configuration of the environment. The student has difficulty realizing the importance of setting the environment.  environment; setup', 1, 'Difficulty in understanding the importance of setting the environment', 'A challenge that is to convince students to give importance to this... they have this other view, this aspect of the configuration of the environment.', 'The student has difficulty realizing the importance of setting the environment.', true, 'environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (37, 'Difficulty in understanding environment, tools and network configuration.', 'There''s still this challenge of understanding these tools, environment, network, configuration, you know? So, I think one challenge brings the other, right? I would say this is a challenge, too.
 Difficulty in understanding environment, tools and network configuration.  environment; network; configuration; setup', 1, 'Difficulty in an understanding environment, tools and network configuration.', 'There''s still this challenge of understanding these tools, environment, network, configuration, you know? So, I think one challenge brings the other, right? I would say this is a challenge, too.
', 'Difficulty in understanding environment, tools and network configuration.', true, 'environment; network; configuration; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (80, 'It''s hard to find something students can relate to, from a environment point of view.', 'So one of the challenge from an environment point of view is to get something that students can relate to. It''s hard to find something students can relate to, from a environment point of view.  environment; relation; strategy; execution', 1, 'difficulty students in relationship with an environment point of view', 'So one of the challenge from an environment point of view is to get something that students can relate to.', 'It''s hard to find something students can relate to, from a environment point of view.', false, 'environment; relation; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (26, 'Students have a prior concept that DevOps is restricted to the use of tools, not being interested in the cultural part of DevOps.

Difficulty explaining to students that DevOps is not just about tools.

Difficulty in explaining to students that DevOps is not just tooling, it encompasses the cultural part.

Difficulty adjusting students'' expectations, as most of them just want to use new tools.

Difficulty in being able to explain to the student that DevOps does not involve only the tooling part.

Difficulty breaking the student perspective that DevOps is just tools and automation.

Students came to course focused in the tools.

So many people only focus on the tools side from DevOps.

DevOps is not only CI/CD and automation.

Convince people that DevOps is not purely technical and it must be part of an academy curriculum.', 'The student hopes to [...] learn that killer tool, which will help in the practical context of his life, whether in the process of development, security or operations. [...] wants to know the tools much more than understand the DevOps culture.

The first challenge is to decouple the idea that about DevOps [...] to deliver a formula.

The students arrive with the idea that they have a set of X tools to deliver in their daily lives and tools only a piece and a small piece within the delivery process, which is more cultural and more personal than tooling, huh? Organizational even, I would say.

It is to set expectations when he signs up that the entire course is not tooling and that no, we will not use the best stacks in the market.

Give this view that DevOps is not just a tool [...] It is very much in line with agile movement.

Trying to show that DevOps is not just tools, trying to make people understand this and trying to change it during the class, so trying as best as possible to make people understand, right? That they will end up having to change the culture of the environment, right? The processes, the way they organize themselves.

 People coming through the programs want to play with technology. ... But what that tends to foster is a technology centric attitude about what devops is all about. ... That''s half the reason we got into this field in the first place, and it''s a really fun thing to be able to do, but it''s not sufficient.

There''s a big focus on tools.

DevOps doesn''t equal CI/CD and DevOps doesn''t equal automate the testing.

Let''s say political challenge that you have to convince in a way that DevOps is not purely technical and that it''s must be part of an academy curriculum. Students have a prior concept that DevOps is restricted to the use of tools, not being interested in the cultural part of DevOps.

Difficulty explaining to students that DevOps is not just about tools.

Difficulty in explaining to students that DevOps is not just tooling, it encompasses the cultural part.

Difficulty adjusting students'' expectations, as most of them just want to use new tools.

Difficulty in being able to explain to the student that DevOps does not involve only the tooling part.

Difficulty breaking the student perspective that DevOps is just tools and automation.

Students came to course focused in the tools.

So many people only focus on the tools side from DevOps.

DevOps is not only CI/CD and automation.

Convince people that DevOps is not purely technical and it must be part of an academy curriculum. It''s hard to show to students that DevOps is not all about tooling. tool; focus', 7, 'Student disinterest in cultural aspects of DevOps.', 'The student hopes to [...] learn that killer tool, which will help in the practical context of his life, whether in the process of development, security or operations. [...] wants to know the tools much more than understand the DevOps culture.

The first challenge is to decouple the idea that about DevOps [...] to deliver a formula.

The students arrive with the idea that they have a set of X tools to deliver in their daily lives and tools only a piece and a small piece within the delivery process, which is more cultural and more personal than tooling, huh? Organizational even, I would say.

It is to set expectations when he signs up that the entire course is not tooling and that no, we will not use the best stacks in the market.

Give this view that DevOps is not just a tool [...] It is very much in line with agile movement.

Trying to show that DevOps is not just tools, trying to make people understand this and trying to change it during the class, so trying as best as possible to make people understand, right? That they will end up having to change the culture of the environment, right? The processes, the way they organize themselves.

 People coming through the programs want to play with technology. ... But what that tends to foster is a technology centric attitude about what devops is all about. ... That''s half the reason we got into this field in the first place, and it''s a really fun thing to be able to do, but it''s not sufficient.

There''s a big focus on tools.

DevOps doesn''t equal CI/CD and DevOps doesn''t equal automate the testing.

Let''s say political challenge that you have to convince in a way that DevOps is not purely technical and that it''s must be part of an academy curriculum.', 'It''s hard to show to students that DevOps is not all about tooling.', true, 'tool; focus', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (67, 'You need a lot of interconnected machines running different services with visibility on each other to do continous deployment.', 'When you do continuous integration, you need to have a logical base. You need to have a lot of people committing in the code changes often. Um, you need to have a lot of machines. You have the machines where people are coding. You have the machines that are building, you have the machines that are the way you run your database. You have the machines where you deploy to. ... you need a lot of machines interconnected, um, with visibility on each other that they can get to. You need a lot of interconnected machines running different services with visibility on each other to do continous deployment.  continuous deployment; service; integration; interconnection; cd; environment; setup; gradual; combination; continuous deployment', 1, 'Continous deployment require a lot of interconnected machines running different services with visibility to each other', 'When you do continuous integration, you need to have a logical base. You need to have a lot of people committing in the code changes often. Um, you need to have a lot of machines. You have the machines where people are coding. You have the machines that are building, you have the machines that are the way you run your database. You have the machines where you deploy to. ... you need a lot of machines interconnected, um, with visibility on each other that they can get to.', 'You need a lot of interconnected machines running different services with visibility on each other to do continous deployment.', true, 'continuous deployment; service; integration; interconnection; cd; environment; setup; gradual; combination; continuous deployment', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (17, 'Initial difficulty using the Docker container tool.', 'the docker, [...] to use, they usually have a greater difficulty in this theme, in the beginning. Initial difficulty using the Docker container tool.  docker; container; tool; technology', 1, 'Difficulty with Docker', 'the docker, [...] to use, they usually have a greater difficulty in this theme, in the beginning.', 'Initial difficulty using the Docker container tool.', true, 'docker; container; tool; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (33, 'Students find it difficult to configure the tools on their own machines in remote teaching mode.', 'Another challenge too, that [...] we changed our model from in-person to online, live. And then, we had this problem, right, that in the course there is a project, with certain technologies, but, in our case, we already have a laboratory that has everything installed and configured. So, in this case, man, now, it''s the student who''s going to do his homework, right, how is he going to configure the infrastructure with that specific project and without having a headache, it won''t interfere in class. Students find it difficult to configure the tools on their own machines in remote teaching mode.  remote; tool; configuration; technology', 1, 'difficult tools configuration on remote teaching', 'Another challenge too, that [...] we changed our model from in-person to online, live. And then, we had this problem, right, that in the course there is a project, with certain technologies, but, in our case, we already have a laboratory that has everything installed and configured. So, in this case, man, now, it''s the student who''s going to do his homework, right, how is he going to configure the infrastructure with that specific project and without having a headache, it won''t interfere in class.', 'Students find it difficult to configure the tools on their own machines in remote teaching mode.', false, 'remote; tool; configuration; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (38, 'There is difficulty for students to carry out the automation of the construction of systems used during the course.', 'When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe you understand all the automations and such, but at the same time I see that the guys have a lot of difficulty in doing it. There is difficulty for students to carry out the automation of the construction of systems used during the course.  build; automation; technology; tool', 1, 'Students with difficulty in automating systems.', 'When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe you understand all the automations and such, but at the same time I see that the guys have a lot of difficulty in doing it.', 'There is difficulty for students to carry out the automation of the construction of systems used during the course.', false, 'build; automation; technology; tool', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (54, 'VirtualBox has limitation in MacOS.', ' However, last semester eight of my students showed up with apple, M one Silicon Macs and they don''t run VirtualBox because VirtualBox only runs on Intel. It''s not an emulator. It is a virtualizing layer, right? It needs an Intel CPU in order to virtualize. Um, and so I had to change the class for them to use Docker and VirtualBox.  VirtualBox has limitation in MacOS.  virtualbox; virtualization; tool; technology', 1, 'limitation of VirtualBox', ' However, last semester eight of my students showed up with apple, M one Silicon Macs and they don''t run VirtualBox because VirtualBox only runs on Intel. It''s not an emulator. It is a virtualizing layer, right? It needs an Intel CPU in order to virtualize. Um, and so I had to change the class for them to use Docker and VirtualBox. ', 'VirtualBox has limitation in MacOS.', false, 'virtualbox; virtualization; tool; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (61, 'It is very dangerous to teach too many tools because it conveys that DevOps is a very technology centric approach.', 'It is very dangerous to teach too many tools because it''s simply conveys that it is a very technology centric approach. It is very dangerous to teach too many tools because it conveys that DevOps is a very technology centric approach.  tool; technology; automation', 1, 'Dangerous of teaching too many tools', 'It is very dangerous to teach too many tools because it''s simply conveys that it is a very technology centric approach.', 'It is very dangerous to teach too many tools because it conveys that DevOps is a very technology centric approach.', true, 'tool; technology; automation', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (70, 'It is hard to prepare a robust and simple technology stack.', 'What is hard is to be prepared with, um, a technology stack that is robust and simple or very simple so that you know exactly what you look when you help them debug. It is hard to prepare a robust and simple technology stack.  technology; stack; automation; tool', 1, 'Hard preparation of simple and robust technologies', 'What is hard is to be prepared with, um, a technology stack that is robust and simple or very simple so that you know exactly what you look when you help them debug.', 'It is hard to prepare a robust and simple technology stack.', false, 'technology; stack; automation; tool', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (79, 'It''s difficult to use Jira lifecycle management tool because of its licence model.', 'JIRA is quite difficult to use in industry context, um, just because of the license model then. So it''s, it''s too complex. It''s difficult to use Jira lifecycle management tool because of its licence model.  jira; licence; management; tool; technology; automation; organization', 1, 'arduous manage of Jira lifecycles licence', 'JIRA is quite difficult to use in industry context, um, just because of the license model then. So it''s, it''s too complex.', 'It''s difficult to use Jira lifecycle management tool because of its licence model.', false, 'jira; licence; management; tool; technology; automation; organization', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (87, 'Bamboo continuous integration does not work with 120 students running pipeline at the same time.', 'Your Bamboo continuous to, uh, integration will just collapse because there''s way too much students. My cohorts were 120 students a year. So when you have 120 students who all try to start their pipeline at the very same time, uh, in the last two days, and it''s just a catastrophe and I mean, this thing will always happen. Bamboo continuous integration does not work with 120 students running pipeline at the same time.  bamboo; continuous integration; pipeline; tool; technology; automation; gradual; ci', 1, 'problems with a lot of pipelines in Bambo', 'Your Bamboo continuous to, uh, integration will just collapse because there''s way too much students. My cohorts were 120 students a year. So when you have 120 students who all try to start their pipeline at the very same time, uh, in the last two days, and it''s just a catastrophe and I mean, this thing will always happen.', 'Bamboo continuous integration does not work with 120 students running pipeline at the same time.', true, 'bamboo; continuous integration; pipeline; tool; technology; automation; gradual; ci', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (63, 'It is hard to find strategies from industry unless if it written in a paper.', 'It can be a little harder garner garnering some of that same thing from, from industry, you know, unless you happen to find reasonably wit reasonably written, uh, white papers or, or things along those lines. It is hard to find strategies from industry unless if it written in a paper.  industry; strategy; material; paper; report; preparation; approach; scenario; story', 1, 'few industry strategies unless papers', 'It can be a little harder garner garnering some of that same thing from, from industry, you know, unless you happen to find reasonably wit reasonably written, uh, white papers or, or things along those lines.', 'It is hard to find strategies from industry unless if it written in a paper.', false, 'industry; strategy; material; paper; report; preparation; approach; scenario; story', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (72, 'Teach DevOps requires much knowledge from the professor who could not be familiar with it.', 'Um, but then the preparation for the class itself was a concept class. That''s, I''ve done that. Um, and then adjust, but it''s no more difficult than any other class. It depends what you know, and what you do as a job. Right? And that''s part of my job to do it. So I feel comfortable Teach DevOps requires much knowledge from the professor who could not be familiar with it.  knowledge; level; teaching; training; preparation; learning', 1, 'requirement of teaching a lot of DevOps knowledge from the professor perspective', 'Um, but then the preparation for the class itself was a concept class. That''s, I''ve done that. Um, and then adjust, but it''s no more difficult than any other class. It depends what you know, and what you do as a job. Right? And that''s part of my job to do it. So I feel comfortable', 'Teach DevOps requires much knowledge from the professor who could not be familiar with it.', true, 'knowledge; level; teaching; training; preparation; learning', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (68, 'It''s hard to supervise students'' work when you use a lot of virtual machines.', 'Uh, so that''s a practical challenge that when you want to put it in place, and as a teacher, you want to be able to log into all of those machines to see what they''re doing. It''s hard to supervise students'' work when you use a lot of virtual machines.  virtual machine; vm; supervision; monitoring; strategy; execution', 1, 'difficulty in the supervision of students work with a lot of virtual machines', 'Uh, so that''s a practical challenge that when you want to put it in place, and as a teacher, you want to be able to log into all of those machines to see what they''re doing.', 'It''s hard to supervise students'' work when you use a lot of virtual machines.', false, 'virtual machine; vm; supervision; monitoring; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (27, 'Difficulties in remote work with students: privacy, availability, infrastructure differences, environment configuration.', 'As people are remote, basically for training, there are several factors that influence the didactics. The home environment, even, that the person, sometimes, does not live alone, or has sons, daughters. This is not a problem for people, for me, a teacher, as a teacher, but for a person, sometimes, you can''t open a camera. You can''t do one, so dealing with these differences within the pandemic is important. It''s not a problem, but it''s a point of e also the differences from the infrastructure that the person has to take the course. A machine a little newer, older, pre-configured for work, there are companies that already have the machine ready for day to day and the course uses other configurations which are challenges that we have with the students to talk, look, I need version X, and the person does not have the installation permission.
 Difficulties in remote work with students: privacy, availability, infrastructure differences, environment configuration.  remote; strategy; execution', 1, 'Difficulty in remote work with students: privacy, availability, infrastructure difference, environment configuration.', 'As people are remote, basically for training, there are several factors that influence the didactics. The home environment, even, that the person, sometimes, does not live alone, or has sons, daughters. This is not a problem for people, for me, a teacher, as a teacher, but for a person, sometimes, you can''t open a camera. You can''t do one, so dealing with these differences within the pandemic is important. It''s not a problem, but it''s a point of e also the differences from the infrastructure that the person has to take the course. A machine a little newer, older, pre-configured for work, there are companies that already have the machine ready for day to day and the course uses other configurations which are challenges that we have with the students to talk, look, I need version X, and the person does not have the installation permission.
', 'Difficulties in remote work with students: privacy, availability, infrastructure differences, environment configuration.', true, 'remote; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (58, 'Doing a hands-on class with that many (45) students is just physically challenging.', 'Doing a hands-on class with that many (45) students is just physically challenging. Doing a hands-on class with that many (45) students is just physically challenging.  hands-on; lab; strategy; execution', 1, 'Difficulty in hands-on classes with 45 or more students', 'Doing a hands-on class with that many (45) students is just physically challenging.', 'Doing a hands-on class with that many (45) students is just physically challenging.', false, 'hands-on; lab; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (49, 'Large class assessment requires great effort.', 'team of monitors [...] If you don''t have it, it gets heavier, it''s more difficult, you alone evaluate. Take a class with forty students, even if you divide it into teams, it''s a lot for you to evaluate. Large class assessment requires great effort.  class; assessment; evaluation', 1, 'Requirement of great effort during assessment of large classes', 'team of monitors [...] If you don''t have it, it gets heavier, it''s more difficult, you alone evaluate. Take a class with forty students, even if you divide it into teams, it''s a lot for you to evaluate.', 'Large class assessment requires great effort.', false, 'class; assessment; evaluation', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (53, 'Environment set up in a cloud service cost money.', 'There are several environments in the cloud, but they all cost money. Environment set up in a cloud service cost money.  cloud; environment; setup', 1, 'Environment set up in a cloud service cost money.', 'There are several environments in the cloud, but they all cost money.', 'Environment set up in a cloud service cost money.', false, 'cloud; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (8, 'Insufficient time to address extensive DevOps knowledge in a limited-hour curriculum.

Insufficient time to address extensive DevOps knowledge in a limited-hour curriculum.

Limitation of the development of laboratory practices in class due to the short time.

There is a limited amount of time to teach the devops content.

Lots of DevOps content to teach with little time available (40 hours).

DevOps has too much contents and it''s hard to fit it in a semester.

No time to teach operations side.

Realistic time constraints prejudice around what devops actually is.

In devops course with dev and ops together, ops part are not touched because dev parts take a lot of time.

One semester is insufficient time to teach DevOps.

Labs of continuous integration and continous delivery are challeging because there is not enough time in three months.', 'We sometimes want to teach everything and we don''t have infinite time[...] to fit the knowledge of DevOps, which is very broad knowledge and involves at least two distinct areas[...]

Making it fit was more difficult because sometimes the content is too long and time is limited.

The challenge in this aspect refers to [..] the issue of laboratories [...], but you always end up as a matter of time versus class development.

When I taught the DevOps course in my master''s, it was DevOps from beginning to end, right? So I had to decide everything that was going to go into the content. There is a lot that was left out.

This area of ​​DevOps is gigantic too. So training is limited there. It is a forty-hour training, right?

My biggest challenge is that my course should be two semesters because it''s just too much stuff to fit in one semester. [...] the challenge there is I had to put together a curriculum that had, um, a little bit about everything. [...] So it''s challenging fitting all that stuff into one semester.

   There''s lots and lots of information, which is why I give them lots of support during the week on slack. Um, but there''s lots of information to cover. And because it''s so challenging, I don''t get to cover a lot of once you deploy it, how do you monitor it? Uh, right. And, and, and how do you, how do you, you know, go through the logs? And I mean, we do a little bit of looking at the logs when we deploy it to figure out if it''s working, but I don''t do a lot of the ops side of DevOps.

And in terms of operation, a lot of the stuff that we tend to do at university tends to be fairly small because there''s just realistic time constraints for how much people can get done in a week or two, or even in a term or a semester. ...  that I''ve found is a little bit of misconception or at least prejudice around what devops actually is.

Because in though in the ops part, and this is the stuff I typically don''t have as much time for simply because I know most of the students are coming from the software development side of the house.

That''s exactly. That''s a lot for one semester.

I introduced the concept of them speaking about continuous integration, continuous, and delivery and continuous deployment. But, uh, in, in practice doing the remaining stage in the lab is very challenging because we don''t have enough time because it''s three months. Insufficient time to address extensive DevOps knowledge in a limited-hour curriculum.

Insufficient time to address extensive DevOps knowledge in a limited-hour curriculum.

Limitation of the development of laboratory practices in class due to the short time.

There is a limited amount of time to teach the devops content.

Lots of DevOps content to teach with little time available (40 hours).

DevOps has too much contents and it''s hard to fit it in a semester.

No time to teach operations side.

Realistic time constraints prejudice around what devops actually is.

In devops course with dev and ops together, ops part are not touched because dev parts take a lot of time.

One semester is insufficient time to teach DevOps.

Labs of continuous integration and continous delivery are challeging because there is not enough time in three months. Insufficient time in the course to teach DevOps. time; content; curriculum; syllabus; schedule', 8, 'Limited time on teaching DevOps', 'We sometimes want to teach everything and we don''t have infinite time[...] to fit the knowledge of DevOps, which is very broad knowledge and involves at least two distinct areas[...]

Making it fit was more difficult because sometimes the content is too long and time is limited.

The challenge in this aspect refers to [..] the issue of laboratories [...], but you always end up as a matter of time versus class development.

When I taught the DevOps course in my master''s, it was DevOps from beginning to end, right? So I had to decide everything that was going to go into the content. There is a lot that was left out.

This area of ​​DevOps is gigantic too. So training is limited there. It is a forty-hour training, right?

My biggest challenge is that my course should be two semesters because it''s just too much stuff to fit in one semester. [...] the challenge there is I had to put together a curriculum that had, um, a little bit about everything. [...] So it''s challenging fitting all that stuff into one semester.

   There''s lots and lots of information, which is why I give them lots of support during the week on slack. Um, but there''s lots of information to cover. And because it''s so challenging, I don''t get to cover a lot of once you deploy it, how do you monitor it? Uh, right. And, and, and how do you, how do you, you know, go through the logs? And I mean, we do a little bit of looking at the logs when we deploy it to figure out if it''s working, but I don''t do a lot of the ops side of DevOps.

And in terms of operation, a lot of the stuff that we tend to do at university tends to be fairly small because there''s just realistic time constraints for how much people can get done in a week or two, or even in a term or a semester. ...  that I''ve found is a little bit of misconception or at least prejudice around what devops actually is.

Because in though in the ops part, and this is the stuff I typically don''t have as much time for simply because I know most of the students are coming from the software development side of the house.

That''s exactly. That''s a lot for one semester.

I introduced the concept of them speaking about continuous integration, continuous, and delivery and continuous deployment. But, uh, in, in practice doing the remaining stage in the lab is very challenging because we don''t have enough time because it''s three months.', 'Insufficient time in the course to teach DevOps.', true, 'time; content; curriculum; syllabus; schedule', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (74, 'They don''t have time to practice on Kubernetes because it is lot of work.', 'We show them Kubernetes, um, but they don''t really have time to practice on Kubernetes. They don''t have time to practice on Kubernetes because it is lot of work.  time; practice; kubernetes; curriculum; syllabus; schedule', 1, 'without time to practice Kubernetes', 'We show them Kubernetes, um, but they don''t really have time to practice on Kubernetes.', 'They don''t have time to practice on Kubernetes because it is lot of work.', true, 'time; practice; kubernetes; curriculum; syllabus; schedule', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (28, 'Difficulty dealing with assessments based on a traditional test model.', '[...] in many cases the assessment is still based on the traditional test model or on some fixed assessment process, with an X list of questions or something similar. Difficulty dealing with assessments based on a traditional test model.  traditional; assessment; test; exam; quiz; popular; evaluation; standard; model', 1, 'Difficulty in using assessments with traditional tests', '[...] in many cases the assessment is still based on the traditional test model or on some fixed assessment process, with an X list of questions or something similar.', 'Difficulty dealing with assessments based on a traditional test model.', true, 'traditional; assessment; test; exam; quiz; popular; evaluation; standard; model', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (78, 'It''s hard to make clear to students and make them understand the fact that technologies will change with time, but the fundamentals will remain.', 'The, the overall context will change the process they use will have to change, to adapt, to become better, to, to stay at the top too, you know, they have to, so they have to recognize first that technologies will change, but the foundation, the fundamentals will remain, It''s hard to make clear to students and make them understand the fact that technologies will change with time, but the fundamentals will remain.  concept; mindset; tool; technology; understanding; theory', 1, 'Students'' understanding of the importance of DevOps concepts over the tools', 'The, the overall context will change the process they use will have to change, to adapt, to become better, to, to stay at the top too, you know, they have to, so they have to recognize first that technologies will change, but the foundation, the fundamentals will remain,', 'It''s hard to make clear to students and make them understand the fact that technologies will change with time, but the fundamentals will remain.', false, 'concept; mindset; tool; technology; understanding; theory', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (83, 'It was hard to have the same criteria and metric for scoring different students because they were free to use any technology and present it.', 'Since the students were free to use any technology and present it ...  it was hard to stay as objective as possible and to have, uh, have the same criteria and metric for, uh, scoring different students, because someone was working on this project, someone was working on that project. It was hard to have the same criteria and metric for scoring different students because they were free to use any technology and present it.  criteria; metric; score; assessment; freedom; technology; stack; flexibility; tool; automation; evaluation; standard; grade', 1, 'challenging evaluation with the same criteria a classroom with different technologies', 'Since the students were free to use any technology and present it ...  it was hard to stay as objective as possible and to have, uh, have the same criteria and metric for, uh, scoring different students, because someone was working on this project, someone was working on that project.', 'It was hard to have the same criteria and metric for scoring different students because they were free to use any technology and present it.', false, 'criteria; metric; score; assessment; freedom; technology; stack; flexibility; tool; automation; evaluation; standard; grade', 'ASSESSMENT', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (82, 'Katacoda does not work for some specific tools.', 'It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website. Katacoda does not work for some specific tools.  katacoda; tool; technology; automation', 1, 'spacific tools do not woth with katacoda', 'It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website.', 'Katacoda does not work for some specific tools.', false, 'katacoda; tool; technology; automation', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (85, 'It is difficult to students understand how the pipeline deployment works and not just running it.', 'How this practitioner really works, because if you''re not doing this, then you will stay at a very technical level. Like you deploy a pipeline and you''re doing DevOps, which is absolutely not the case. And that''s absolutely not the, uh, understanding of what DevOps is. It is difficult to students understand how the pipeline deployment works and not just running it.  pipeline; deployment; understanding; running', 1, 'how pipeline deployment works', 'How this practitioner really works, because if you''re not doing this, then you will stay at a very technical level. Like you deploy a pipeline and you''re doing DevOps, which is absolutely not the case. And that''s absolutely not the, uh, understanding of what DevOps is.', 'It is difficult to students understand how the pipeline deployment works and not just running it.', true, 'pipeline; deployment; understanding; running', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (1, 'Insufficient knowledge level of students to start the course.

Students'' previous lack of knowledge makes learning difficult.

It is challenging for students with an operating background to carry out software development activities, such as generating a build with the maven tool.

Students who came from the area of ​​software engineering lack experience in operational activities.

Some students don''t know network concepts.', 'A recurrent problem is the level of students knowledge that they come when they start the discipline.

The lack of proficiency of some students in some criteria of this ends up making this practice difficult.

For those who are from infrastructure and are only used to accessing the server, building it with a tool like Maven, for example, can be a challenge for them.

Some people take a network course they know when IP addresses. Some people don''t know what an IP address is.

Many students, even master''s students who are going through this kind of a program are probably, are we missing one or two frames of reference? A lot of students come through approaching this from the software engineering side of the house. They''re learning how to build applications and that sort of thing. They have no real experience on operations and simply standing up infrastructure in the cloud is not operations, right? It''s an aspect of operations. It''s important piece of operations, but it''s not everything you don''t necessarily have people with the expertise in network design capacity plan, security, identity management Insufficient knowledge level of students to start the course.

Students'' previous lack of knowledge makes learning difficult.

It is challenging for students with an operating background to carry out software development activities, such as generating a build with the maven tool.

Students who came from the area of ​​software engineering lack experience in operational activities.

Some students don''t know network concepts. Insufficient knowledge level of students to start the course. knowledge; level; background; experience; history; skill; technique; curriculum; syllabus', 5, 'insufficient knowledge of students', 'A recurrent problem is the level of students knowledge that they come when they start the discipline.

The lack of proficiency of some students in some criteria of this ends up making this practice difficult.

For those who are from infrastructure and are only used to accessing the server, building it with a tool like Maven, for example, can be a challenge for them.

Some people take a network course they know when IP addresses. Some people don''t know what an IP address is.

Many students, even master''s students who are going through this kind of a program are probably, are we missing one or two frames of reference? A lot of students come through approaching this from the software engineering side of the house. They''re learning how to build applications and that sort of thing. They have no real experience on operations and simply standing up infrastructure in the cloud is not operations, right? It''s an aspect of operations. It''s important piece of operations, but it''s not everything you don''t necessarily have people with the expertise in network design capacity plan, security, identity management', 'Insufficient knowledge level of students to start the course.', false, 'knowledge; level; background; experience; history; skill; technique; curriculum; syllabus', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (29, 'The teaching of devops is multidisciplinary, covering different areas such as development, safety and operation.

There is a very diverse and multidisciplinary knowledge in teaching DevOps.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

You cannot teach DevOps without experiencing DevOps, right? You cannot read in a book and want to teach DevOps because DevOps is a very practical discipline. There is a lot that happens in practice. So, there is a lot of doubt, from concepts, about Kubernetes configuration error, for example. So, these are things that we have to deal with [...] So, venturing out to teach DevOps, parachuting, that is a big challenge because the level of knowledge you will have to collect for this is quite diverse and multidisciplinary. The teaching of devops is multidisciplinary, covering different areas such as development, safety and operation.

There is a very diverse and multidisciplinary knowledge in teaching DevOps. The multidiscuplinary of DevOps is hard to deal with. multidisciplinary; curriculum; syllabus', 2, 'Wide coverage of diverse areas by DevOps teaching.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

You cannot teach DevOps without experiencing DevOps, right? You cannot read in a book and want to teach DevOps because DevOps is a very practical discipline. There is a lot that happens in practice. So, there is a lot of doubt, from concepts, about Kubernetes configuration error, for example. So, these are things that we have to deal with [...] So, venturing out to teach DevOps, parachuting, that is a big challenge because the level of knowledge you will have to collect for this is quite diverse and multidisciplinary.', 'The multidiscuplinary of DevOps is hard to deal with.', true, 'multidisciplinary; curriculum; syllabus', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (77, 'There is no convention as to what are the main DevOps concepts that should be taught.

It''s difficult to decide what will be taught in a DevOps course.

Hard to decide whether to teach telemetry or not.', 'The biggest challenge is this, like, what goes in, you know? People do lots of things in the DevOps Pipeline these days, which doesn''t necessarily go into a DevOps course, right?

I would say at the end of the fall, or maybe at the beginning of 2019, we started to plan this course. And for the longest time I was really questioning myself. Like, what do you teach in a DevOps course?

Now we''re questioning ourselves. What else did we bring in? We may add some things about a bit of telemetry. So they have a bit of telemetry because they have lives, but we put some emphasis on it. There is no convention as to what are the main DevOps concepts that should be taught.

It''s difficult to decide what will be taught in a DevOps course.

Hard to decide whether to teach telemetry or not. There is no convention as to what are the main DevOps concepts that should be taught. convention; curriculum; concept; telemetry; theory; principle; criteria; standard; syllabus; model', 2, 'no convention about DevOps course curriculum', 'The biggest challenge is this, like, what goes in, you know? People do lots of things in the DevOps Pipeline these days, which doesn''t necessarily go into a DevOps course, right?

I would say at the end of the fall, or maybe at the beginning of 2019, we started to plan this course. And for the longest time I was really questioning myself. Like, what do you teach in a DevOps course?

Now we''re questioning ourselves. What else did we bring in? We may add some things about a bit of telemetry. So they have a bit of telemetry because they have lives, but we put some emphasis on it.', 'There is no convention as to what are the main DevOps concepts that should be taught.', true, 'convention; curriculum; concept; telemetry; theory; principle; criteria; standard; syllabus; model', 'CURRICULUM', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (14, 'Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.

Difficulty for students to practice the concept of Continuous Delivery when it is necessary to add new features to the system without the build breaking.', 'The challenge of making students see this approach to operationalization, putting the system on the air, maintaining this system, adding new features and not breaking the system.

The concept of continuous delivery [...] The difficult thing is to put it into practice [...] when they, as a team, need to release a certain functionality and ensure that it doesn''t break the system. Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.

Difficulty for students to practice the concept of Continuous Delivery when it is necessary to add new features to the system without the build breaking. Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system. feature; break; system; build; continuous delivery; concept; theory; cd; application; pause; gradual; technique; approach; continuous deployment', 1, 'Difficulty in teaching about operationalization and addition of new system features', 'The challenge of making students see this approach to operationalization, putting the system on the air, maintaining this system, adding new features and not breaking the system.

The concept of continuous delivery [...] The difficult thing is to put it into practice [...] when they, as a team, need to release a certain functionality and ensure that it doesn''t break the system.', 'Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.', true, 'feature; break; system; build; continuous delivery; concept; theory; cd; application; pause; gradual; technique; approach; continuous deployment', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (25, 'Difficulty to teach the DevOps culture.

There is no ready-made recipe to teach the DevOps mindset (culture).

Difficulty breaking through resistance to the DevOps culture and its principles.

Difficulty contextualizing the DevOps culture.

Culture is difficult to teach.', 'The main challenge is to correctly convey to students the idea that DevOps is about a culture.

It is the cultural challenge of I am not going to deliver a ready-made recipe.

How to apply these things from Devops in companies [...] there is a great difficulty that is cultural. Companies have always organized themselves in this way, separating movement from infrastructure, not having collaboration, not having communication, and this ends up generating friction, especially when problems arise [...] go on changing a little the company''s culture, the process, the way people organize themselves, meet, and such, trying to remove the barriers there until it is natural and both teams work together [...] with a single goal, which is to develop, deliver software that works and solve problems as quickly as possible.

Trying to contextualize this too is very difficult.

Culture is difficult to teach. Difficulty to teach the DevOps culture.

There is no ready-made recipe to teach the DevOps mindset (culture).

Difficulty breaking through resistance to the DevOps culture and its principles.

Difficulty contextualizing the DevOps culture.

Culture is difficult to teach. DevOps culture is hard to teach.  culture; mindset; principle; skill; convention; rule; technique; criteria', 4, 'Lack of step-by-step instructions about cultural part teaching', 'The main challenge is to correctly convey to students the idea that DevOps is about a culture.

It is the cultural challenge of I am not going to deliver a ready-made recipe.

How to apply these things from Devops in companies [...] there is a great difficulty that is cultural. Companies have always organized themselves in this way, separating movement from infrastructure, not having collaboration, not having communication, and this ends up generating friction, especially when problems arise [...] go on changing a little the company''s culture, the process, the way people organize themselves, meet, and such, trying to remove the barriers there until it is natural and both teams work together [...] with a single goal, which is to develop, deliver software that works and solve problems as quickly as possible.

Trying to contextualize this too is very difficult.

Culture is difficult to teach.', 'DevOps culture is hard to teach. ', true, 'culture; mindset; principle; skill; convention; rule; technique; criteria', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (30, 'There is a greater difficulty in understanding devops by students whose background is more academic, who have no experience in software development or direct operation.

It is difficult to teach students with more academic training that have no experience in software development or operation directly.

It is difficult to teach DevOps concepts without industry experience.

It is difficult to teach students with no industrial experience.

The students don''t have the proper background to listen the lecture of people from the industry.

The students without industry experience can have difficulty to understand that DevOps is much more than using tools.

It is difficult to explain the importance of DevOps mindset to students that have a superficial idea of what is happening to industry.', 'If the student is in a context where he has always been in the academic area or he has never had practical contact with any of these features of software development, it is likely that it will be much more challenging for him.

If the student is in a context where he has always been in the academic area, or he has never had practical contact with any of these features of software development, [...] for the teacher, it becomes much more challenging to teach the DevOps concept this student profile.

The main challenge remain the able to, to, to teach the fundamentals. I think that this type, of course almost requires some type of industrial experience, because if you''ve not been in contact with the industry, there are so many things that are, um, more difficult to, to, to eally understand.

Teaching this course, it''s possible to teach it with students with no experience, but it makes the thing like this. I''ve been trying to have interactions with the students about, I know certain topics become quite difficult because they cannot relate it to anything concrete.

It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website.

I mean, there are students, so they are, they are not in the industry yet. And so that''s, that would be the main part to make the student understand that it''s, it''s not about configuring Jenkins or having Docker running on their computer.

When you''re talking to freshmen and they have no idea what''s happening. Like they have a superficial idea of what''s happening. Then it''s like finding a way to explain them why the mindset is important. There is a greater difficulty in understanding devops by students whose background is more academic, who have no experience in software development or direct operation.

It is difficult to teach students with more academic training that have no experience in software development or operation directly.

It is difficult to teach DevOps concepts without industry experience.

It is difficult to teach students with no industrial experience.

The students don''t have the proper background to listen the lecture of people from the industry.

The students without industry experience can have difficulty to understand that DevOps is much more than using tools.

It is difficult to explain the importance of DevOps mindset to students that have a superficial idea of what is happening to industry. Teach DevOps concepts to students no industrial experience is hard. industry; concept; theory', 4, 'Greater difficulty in understanding by students with little experience in Dev and Ops', 'If the student is in a context where he has always been in the academic area or he has never had practical contact with any of these features of software development, it is likely that it will be much more challenging for him.

If the student is in a context where he has always been in the academic area, or he has never had practical contact with any of these features of software development, [...] for the teacher, it becomes much more challenging to teach the DevOps concept this student profile.

The main challenge remain the able to, to, to teach the fundamentals. I think that this type, of course almost requires some type of industrial experience, because if you''ve not been in contact with the industry, there are so many things that are, um, more difficult to, to, to eally understand.

Teaching this course, it''s possible to teach it with students with no experience, but it makes the thing like this. I''ve been trying to have interactions with the students about, I know certain topics become quite difficult because they cannot relate it to anything concrete.

It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website.

I mean, there are students, so they are, they are not in the industry yet. And so that''s, that would be the main part to make the student understand that it''s, it''s not about configuring Jenkins or having Docker running on their computer.

When you''re talking to freshmen and they have no idea what''s happening. Like they have a superficial idea of what''s happening. Then it''s like finding a way to explain them why the mindset is important.', 'Teach DevOps concepts to students no industrial experience is hard.', true, 'industry; concept; theory', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (35, 'Difficulty in making the association between theory and practice.

Difficulty balancing theory foundations and make them interesting in the practice.

Difficulty in balancing the teaching of theory (culture) and practice (tools).

Challenge to balance theory and practice.

It''s challenging to teach DevOps concepts that have theoretical foundations and make them interesting from the industry perspective.

It is difficult to balance the concreteness (technologies) and the philosophy (concepts) of DevOps.

It is difficult to balance the usage of tools and making the DevOps process effective and efficient.

There is a gap about how to connect the lectures with the labs.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

The expectation of students to deliver something, by hand, because they are technical people, is to be able to balance what is concept and what is practical and show the importance, the value of what you are explaining.

This part of culture and such, which is, let us say, more boring, right? That people go there wanting to see tools, right? So, how to balance, right? Talk a little non-technical things with technical things.

The challenge is this: having the non-technical part with the technical part, pondering both, and addressing these main topics, right?

The point is how do we adapt DevOps in concept in a way where we, we are still take keeping in mind the theoretical foundation, but where make it making it interesting from an industry or practical perspective.

The challenge is, in my opinion, is, is to, to strike this balance between, between, um, concreteness, like work with technologies, because essentially, uh, DevOps is yes, a philosophy. 

To strike a balance. The students are of course, very keen about the products and telemetry about the product and, and, and, and building Docker containers. And, but what I want them to reflect, I mean, the whole goal of DevOps is to make the process effective, very, very efficient.

There''s a gap between what we can experiment during the course, what can be presented during the invited lecture from the industry, for example, those kinds of things and how, how whole, the things are connected together. Difficulty in making the association between theory and practice.

Difficulty balancing theory foundations and make them interesting in the practice.

Difficulty in balancing the teaching of theory (culture) and practice (tools).

Challenge to balance theory and practice.

It''s challenging to teach DevOps concepts that have theoretical foundations and make them interesting from the industry perspective.

It is difficult to balance the concreteness (technologies) and the philosophy (concepts) of DevOps.

It is difficult to balance the usage of tools and making the DevOps process effective and efficient.

There is a gap about how to connect the lectures with the labs. It''s challeging to balance DevOps theory and practice. theory; practice; culture; tool; concept', 6, 'It''s challeging to balance DevOps theory and practice.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

The expectation of students to deliver something, by hand, because they are technical people, is to be able to balance what is concept and what is practical and show the importance, the value of what you are explaining.

This part of culture and such, which is, let us say, more boring, right? That people go there wanting to see tools, right? So, how to balance, right? Talk a little non-technical things with technical things.

The challenge is this: having the non-technical part with the technical part, pondering both, and addressing these main topics, right?

The point is how do we adapt DevOps in concept in a way where we, we are still take keeping in mind the theoretical foundation, but where make it making it interesting from an industry or practical perspective.

The challenge is, in my opinion, is, is to, to strike this balance between, between, um, concreteness, like work with technologies, because essentially, uh, DevOps is yes, a philosophy. 

To strike a balance. The students are of course, very keen about the products and telemetry about the product and, and, and, and building Docker containers. And, but what I want them to reflect, I mean, the whole goal of DevOps is to make the process effective, very, very efficient.

There''s a gap between what we can experiment during the course, what can be presented during the invited lecture from the industry, for example, those kinds of things and how, how whole, the things are connected together.', 'It''s challeging to balance DevOps theory and practice.', false, 'theory; practice; culture; tool; concept', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (56, 'It is difficult to students learning agile techniques like pair programming.

A lot of agile concepts are hard to teach in a classroom setting.

It''s challenging the students to be and to think agile into mininum viable product.

It is difficult how to organize each sprint.', 'A big challenge is students learning to be, um, to be agile working as a team pair programming. 

Lot of those concepts are hard to teach in a classroom setting.

That''s kind of challenging getting them to be agile, getting them to think agile, get into think minimum viable product, right.

How do you work in sprints?  It is difficult to students learning agile techniques like pair programming.

A lot of agile concepts are hard to teach in a classroom setting.

It''s challenging the students to be and to think agile into mininum viable product.

It is difficult how to organize each sprint. It is difficult to teach agile techniques. agile; pair programming; spring; minimum viable product; mvp', 2, 'difficulty in agile techniques', 'A big challenge is students learning to be, um, to be agile working as a team pair programming. 

Lot of those concepts are hard to teach in a classroom setting.

That''s kind of challenging getting them to be agile, getting them to think agile, get into think minimum viable product, right.

How do you work in sprints? ', 'It is difficult to teach agile techniques.', false, 'agile; pair programming; spring; minimum viable product; mvp', 'DEVOPS_CONCEPTS', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (2, 'Difficulty configuring and setting up the infrastructure needed to run DevOps experiments.

Difficulty in setting up the infrastructure.

Be concerned about the infrastructure used in the student''s environment.

If you let the students deal with the environment setup on their computers, it will become not reproducible and complicated to make it work even with the teacher assistant.', 'To configure a environment needed to start.

I had difficulty setting up the infrastructure.

If you want a kind of hybrid discipline, in which you have the theory and applied practice, then the challenge will be different, then it ranges from having an environment for it to structuring the environment, or thinking about something like that, to making a virtual machine available.

We''ve tried to let the students, uh, deal with the setup and, uh, install everything on their computer with Dockerizing stuff and scan things. And that was yet another disaster because then it''s not reproducible and it works on their computer, but then it''s really complicated to make it work on the TA. Difficulty configuring and setting up the infrastructure needed to run DevOps experiments.

Difficulty in setting up the infrastructure.

Be concerned about the infrastructure used in the student''s environment.

If you let the students deal with the environment setup on their computers, it will become not reproducible and complicated to make it work even with the teacher assistant. Setting up the infrastructure is difficulty. configuration; environment; setup; infrastructure', 3, 'Difficulty in setting up the environment', 'To configure a environment needed to start.

I had difficulty setting up the infrastructure.

If you want a kind of hybrid discipline, in which you have the theory and applied practice, then the challenge will be different, then it ranges from having an environment for it to structuring the environment, or thinking about something like that, to making a virtual machine available.

We''ve tried to let the students, uh, deal with the setup and, uh, install everything on their computer with Dockerizing stuff and scan things. And that was yet another disaster because then it''s not reproducible and it works on their computer, but then it''s really complicated to make it work on the TA.', 'Setting up the infrastructure is difficulty.', true, 'configuration; environment; setup; infrastructure', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (3, 'Few computational resources for setting up scenarios close to real ones.

Lack of computer resources for teaching the class.

Students may have learning difficulties due to their machine''s capacity constraints.

Students may have limited internet access. It difficults activities such as downloading OS images to virtual machines.

Local environment set up is hard because it needs lots of hardware.', 'In many times, a professor would need computational resources to teach specific concepts [...] to configure real scenarios as much as possible.

Many times, you do not have access to computer resources to set up scenarios that you can actually teach labs or do, there, labs for students to learn.

Student machine capacity restriction.

We depend on the internet, I will give you a straightforward example, you will use the virtual machine, no matter how much you use Vagrant, for example, it needs to download a base image. And depending on the student''s location, it takes two minutes and up to two hours.

If you''re the things and they''ve launch, you know, Docker and Jenkins, that''s it or JDK, that''s it. There''s no memory left. Um, so is the environment set up is hard.  Few computational resources for setting up scenarios close to real ones.

Lack of computer resources for teaching the class.

Students may have learning difficulties due to their machine''s capacity constraints.

Students may have limited internet access. It difficults activities such as downloading OS images to virtual machines.

Local environment set up is hard because it needs lots of hardware. Limited computional resources. hardware; resource; environment; setup', 3, 'lack of computing resources', 'In many times, a professor would need computational resources to teach specific concepts [...] to configure real scenarios as much as possible.

Many times, you do not have access to computer resources to set up scenarios that you can actually teach labs or do, there, labs for students to learn.

Student machine capacity restriction.

We depend on the internet, I will give you a straightforward example, you will use the virtual machine, no matter how much you use Vagrant, for example, it needs to download a base image. And depending on the student''s location, it takes two minutes and up to two hours.

If you''re the things and they''ve launch, you know, Docker and Jenkins, that''s it or JDK, that''s it. There''s no memory left. Um, so is the environment set up is hard. ', 'Limited computional resources.', false, 'hardware; resource; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (4, 'Even through educational partnerships, using private cloud providers by students could be limited.

In public clouds, teacher use of student resource management is not widely available.

Using cloud services more professionally requires payment at a commercial level.

Cloud providers can have aggressive policies in the agreements for academic purposes.', 'Some datasets as Azure from Microsoft, which the federal institute has a partnership has limited trial time to test, and it is necessary to have a credit card and other related things which sometimes the students do not have.

There is no account, like, the teacher that he can make available, and there are resources for what students learn to set up these scenarios, right? Neither a local datacenter nor one of these commercials, many times it is not, it does not have all the possibilities you could use, at least not, without being linked to an agreement or something like that.

If you are going to make this CI in the cloud commercially, you will have to pay. It is not free. Free here just for us to play, right? However, if you want to put your company''s system to do, I don''t know how many integrations per week, you will have to pay for it.

Mean, captive of their platform and you also have to sign with your blood and agreements that you''re doing it for academic purposes and those kind of things, because IBM can be quite aggressive with their partnership, um, policies. So except that I had to sign something that was a little bit too much from my perspective, this kind of tooling was good. Even through educational partnerships, using private cloud providers by students could be limited.

In public clouds, teacher use of student resource management is not widely available.

Using cloud services more professionally requires payment at a commercial level.

Cloud providers can have aggressive policies in the agreements for academic purposes. Cloud providers usage has limits. cloud; environment; setup', 3, 'Difficulty in using internet Cloud services', 'Some datasets as Azure from Microsoft, which the federal institute has a partnership has limited trial time to test, and it is necessary to have a credit card and other related things which sometimes the students do not have.

There is no account, like, the teacher that he can make available, and there are resources for what students learn to set up these scenarios, right? Neither a local datacenter nor one of these commercials, many times it is not, it does not have all the possibilities you could use, at least not, without being linked to an agreement or something like that.

If you are going to make this CI in the cloud commercially, you will have to pay. It is not free. Free here just for us to play, right? However, if you want to put your company''s system to do, I don''t know how many integrations per week, you will have to pay for it.

Mean, captive of their platform and you also have to sign with your blood and agreements that you''re doing it for academic purposes and those kind of things, because IBM can be quite aggressive with their partnership, um, policies. So except that I had to sign something that was a little bit too much from my perspective, this kind of tooling was good.', 'Cloud providers usage has limits.', false, 'cloud; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (9, 'Difficulty in getting authorization and lab resources from the institution to install tools in order to setup a DevOps environment.

University labs have restrictions on installing tools.

The academy has network limitations to create near-real infrastructure.

It is difficult to build an enterprise environment into a university environment that is much more restrictive and doesn''t have enough machines for them.', '[...] I couldn''t set up a DevOps environment due to restrictions even with administrative authorization.

 That simply wasn''t a possibility and computer labs are not equipped for that sort of a thing because of necessity. Universities have to lock down their software and hardware to keep really bad things from happening.

You have the machines where you deploy to. Um, and quite often the students are in the same classroom on the wifi of the universities or the under the sub network, but the ports are not open [...] you need a lot of machines interconnected, um, with visibility on each other that they can get to. And that''s hard in a, in a, in a classroom environment this year I had 78 students.

All of those challenges are basically how do you rebuild an enterprise environment into a university environment that is much more restrictive and doesn''t have enough machines for them. Usually that''s a real challenge. Difficulty in getting authorization and lab resources from the institution to install tools in order to setup a DevOps environment.

University labs have restrictions on installing tools.

The academy has network limitations to create near-real infrastructure.

It is difficult to build an enterprise environment into a university environment that is much more restrictive and doesn''t have enough machines for them. Institutions'' resources have limits. university; academy; institution; restriction; limitation; environment; setup', 3, 'Difficulty during institution''s resources authorization.', '[...] I couldn''t set up a DevOps environment due to restrictions even with administrative authorization.

 That simply wasn''t a possibility and computer labs are not equipped for that sort of a thing because of necessity. Universities have to lock down their software and hardware to keep really bad things from happening.

You have the machines where you deploy to. Um, and quite often the students are in the same classroom on the wifi of the universities or the under the sub network, but the ports are not open [...] you need a lot of machines interconnected, um, with visibility on each other that they can get to. And that''s hard in a, in a, in a classroom environment this year I had 78 students.

All of those challenges are basically how do you rebuild an enterprise environment into a university environment that is much more restrictive and doesn''t have enough machines for them. Usually that''s a real challenge.', 'Institutions'' resources have limits.', true, 'university; academy; institution; restriction; limitation; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (16, 'The environment adopted by instructors can frighten students by making them migrate to other tools.

Students'' initial difficult at having to switch from tools in which their applications were already working to the one adopted by the instructor.', 'It''s more this initial contact that seems to scare them a little more, it makes them go to others, when they arrive.

The part of actually putting an initial part has this shock of this reality there for the students in which they have to leave a tool that they are already there with the system running and bring it to our tool. The environment adopted by instructors can frighten students by making them migrate to other tools.

Students'' initial difficult at having to switch from tools in which their applications were already working to the one adopted by the instructor. The process of making students migrate to other tools it''s hard. migration; tool; environment; setup', 1, 'Difficulty in tool change', 'It''s more this initial contact that seems to scare them a little more, it makes them go to others, when they arrive.

The part of actually putting an initial part has this shock of this reality there for the students in which they have to leave a tool that they are already there with the system running and bring it to our tool.', 'The process of making students migrate to other tools it''s hard.', true, 'migration; tool; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (43, 'A lot of time preparing the initial environment setup of students.

Lots of work to setup the labs even if you have teacher assistants.

On premises systems for deployment everything is complicated because it requires a lot of maintenance and time.', 'Then the boy will go in a week, he will only have his entire environment set up, right? But, this creates challenges too, right? That it will be difficult to do this and such.

We had to work to do on the labs. ...  the assistant I had two for the labs was too busy with too many things.

That''s really complicated as, um, like as a teacher, uh, then we decided to move for on premises, uh, version with our own, uh, systems for deployment building and everything, uh, another disaster, because then it requires a lot of maintenance and a lot of them, of course, or the students are going to work like in the two days before the room, the, um, the delivery of the project. A lot of time preparing the initial environment setup of students.

Lots of work to setup the labs even if you have teacher assistants.

On premises systems for deployment everything is complicated because it requires a lot of maintenance and time. Prepare the labs environment requires a lot of time. time; lab; environment; setup', 3, 'No time for initial setup of student environment', 'Then the boy will go in a week, he will only have his entire environment set up, right? But, this creates challenges too, right? That it will be difficult to do this and such.

We had to work to do on the labs. ...  the assistant I had two for the labs was too busy with too many things.

That''s really complicated as, um, like as a teacher, uh, then we decided to move for on premises, uh, version with our own, uh, systems for deployment building and everything, uh, another disaster, because then it requires a lot of maintenance and a lot of them, of course, or the students are going to work like in the two days before the room, the, um, the delivery of the project.', 'Prepare the labs environment requires a lot of time.', true, 'time; lab; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (86, 'Using remote services is really complicated to debug because you don''t have the access on the what''s happening.

Debugging lab sessions are frustating.', 'We try to use, um, like remote services to relieve the burden of setup saying that, okay, you''re going to use Jenkins on the cloud. Then you''re going to use, we have this partnership with IBM. So we''re using to use the bluemix platform from, uh, IBM that was supporting this kind of thing, um, disaster, because in the end it was really complicated to debug what was happening because you don''t have the access go on the what''s happening.

I think that that''s one of the course that costed me the most in terms of, uh, frustrating time I''ve spent, uh, debugging lab sessions,  Using remote services is really complicated to debug because you don''t have the access on the what''s happening.

Debugging lab sessions are frustating. Debugging lab sessions are very difficult. debug; lab; remote; service; environment; setup', 1, 'difficulty in debugging of lab sessions', 'We try to use, um, like remote services to relieve the burden of setup saying that, okay, you''re going to use Jenkins on the cloud. Then you''re going to use, we have this partnership with IBM. So we''re using to use the bluemix platform from, uh, IBM that was supporting this kind of thing, um, disaster, because in the end it was really complicated to debug what was happening because you don''t have the access go on the what''s happening.

I think that that''s one of the course that costed me the most in terms of, uh, frustrating time I''ve spent, uh, debugging lab sessions, ', 'Debugging lab sessions are very difficult.', true, 'debug; lab; remote; service; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (59, 'Teach operational activities is ignored because it is hard.', 'You have a clean compile, you''ve tested your code and it meets the functional requirements. And that''s the end of the story. But as we know, you know, even from software development,[...] it doesn''t end once the software is built and once it''s passed testing, then it goes into this entire operational stage. We tend to ignore it. And I don''t think we ignore it deliberately. We ignore it because it''s hard Teach operational activities is ignored because it is hard.  operation; activity; environment; setup', 1, 'operational activities ignored', 'You have a clean compile, you''ve tested your code and it meets the functional requirements. And that''s the end of the story. But as we know, you know, even from software development,[...] it doesn''t end once the software is built and once it''s passed testing, then it goes into this entire operational stage. We tend to ignore it. And I don''t think we ignore it deliberately. We ignore it because it''s hard', 'Teach operational activities is ignored because it is hard.', true, 'operation; activity; environment; setup', 'ENVIRONMENT_SETUP', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (22, 'There are a large number of DevOps tools available.

Many DevOps tools are cloud based.

Many DevOps tools and usability available.

Difficulty in deciding which technologies to teach, given the wide variety available on the market.

There are many DevOps tools.

There are many DevOps tools to choose from.

It''s hard to deal with many options of tools.

The lab instructor should handle many tools.', 'The challenges I can mention is precisely this part of you being able to demonstrate, right, to demonstrate to them all this tooling of ours.

The main challenge is that, in general, DevOps related tools are cloud-based systems.

In general, you have a wide range of solutions. You have a very large ecosystem of possibilities on how to test or demonstrate a concept.

A difficulty of technologies is about recognizing what is relevant to be addressed in the classroom, is not it? So, for example, there is much technology on the market.

Because the DevOps universe has millions of tools, technologies, and [...] It has an infinity of tools, they all meet the objectives. They are good and such.

This is a problem because of what happens: there are several tools, and we always have to close on some for the didactic nature of experimentation.

The other big challenge is: technology. People come with Macs, people come with windows, people come with Linux. [...] So that''s the other challenge is people coming in with different technology and then how do you teach them the same thing without saying: oh, the command in windows is this and the command on a Mac is that.

It can be also challenging for the, if you have the lab instructor with handling all tools. There are a large number of DevOps tools available.

Many DevOps tools are cloud based.

Many DevOps tools and usability available.

Difficulty in deciding which technologies to teach, given the wide variety available on the market.

There are many DevOps tools.

There are many DevOps tools to choose from.

It''s hard to deal with many options of tools.

The lab instructor should handle many tools. There is a large number of DevOps tools. tool; technology; automation', 7, 'Abundance of tools for DevOps practices', 'The challenges I can mention is precisely this part of you being able to demonstrate, right, to demonstrate to them all this tooling of ours.

The main challenge is that, in general, DevOps related tools are cloud-based systems.

In general, you have a wide range of solutions. You have a very large ecosystem of possibilities on how to test or demonstrate a concept.

A difficulty of technologies is about recognizing what is relevant to be addressed in the classroom, is not it? So, for example, there is much technology on the market.

Because the DevOps universe has millions of tools, technologies, and [...] It has an infinity of tools, they all meet the objectives. They are good and such.

This is a problem because of what happens: there are several tools, and we always have to close on some for the didactic nature of experimentation.

The other big challenge is: technology. People come with Macs, people come with windows, people come with Linux. [...] So that''s the other challenge is people coming in with different technology and then how do you teach them the same thing without saying: oh, the command in windows is this and the command on a Mac is that.

It can be also challenging for the, if you have the lab instructor with handling all tools.', 'There is a large number of DevOps tools.', true, 'tool; technology; automation', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (39, 'Difficulty selecting an example system realistic enough for students to use during the course.

It is hard to do a business case to demonstrate the importance of running devops.

It is difficult to find the right sized open source project to use. It is should be not too small and not too bit.

It is difficult to find an interesting sample application that students use.

Students can''t work on large projects in 13 to 15 weeks three hours a week course.', 'This part of the system, which I ask them to do to monitor the discipline, [...] ok, I''ll give you a system, will it be an open source system? Me too, you know? Since I can give you a system, let''s use a real system that isn''t a joke. So, like, I think of a great open souce system there, that has testing, has a shitload of stuff, has continuous integration and has I don''t know what, and you can select the test battery that will be used in each corner, You know?

You have to make a business case. It''s a lot harder to do.

The challenge sometimes is finding a good open source application, which is not too big also because you don''t want the project to be too big. You don''t want it to be too small, but you don''t want too big. So, so finding something in between, which can be used. And, and, uh, so.

The challenge for us is getting an application, which is interesting [...] you know, like they can use.

The fact that DevOps is not just purely technical, it would be related to the fact that it''s really complicated teach on a given semester because you have, let''s say 13 to 15 weeks, three hours a week, and then you have to go through you can''t address like large, large project because it doesn''t fit in the semester. Difficulty selecting an example system realistic enough for students to use during the course.

It is hard to do a business case to demonstrate the importance of running devops.

It is difficult to find the right sized open source project to use. It is should be not too small and not too bit.

It is difficult to find an interesting sample application that students use.

Students can''t work on large projects in 13 to 15 weeks three hours a week course. It''s challeging to find the right sized examples to teach DevOps. example; sample; project; activity; task; mission; tool; technology', 4, 'Difficulty at select of a realistic example system for students', 'This part of the system, which I ask them to do to monitor the discipline, [...] ok, I''ll give you a system, will it be an open source system? Me too, you know? Since I can give you a system, let''s use a real system that isn''t a joke. So, like, I think of a great open souce system there, that has testing, has a shitload of stuff, has continuous integration and has I don''t know what, and you can select the test battery that will be used in each corner, You know?

You have to make a business case. It''s a lot harder to do.

The challenge sometimes is finding a good open source application, which is not too big also because you don''t want the project to be too big. You don''t want it to be too small, but you don''t want too big. So, so finding something in between, which can be used. And, and, uh, so.

The challenge for us is getting an application, which is interesting [...] you know, like they can use.

The fact that DevOps is not just purely technical, it would be related to the fact that it''s really complicated teach on a given semester because you have, let''s say 13 to 15 weeks, three hours a week, and then you have to go through you can''t address like large, large project because it doesn''t fit in the semester.', 'It''s challeging to find the right sized examples to teach DevOps.', true, 'example; sample; project; activity; task; mission; tool; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (34, 'Devops concepts like configuration management and contaizerization need examples with mininum scale and complexity.

The students can have difficulty understanding the DevOps culture working on a small example.

Small project wasn''t really satisfactory.', 'Doing infrastructure as code or forms of configuration management or containerization, or even the simpler things like treating build scripts as first-class citizens alongside your code, start to not be meaningful until you have code at some minimum scale where there''s a certain minimum complexity, both in terms of construction.

If you give artificial example or small toy example, then it''s just going about configuring small things. So naturally naturally what DevOps is, uh, it''s really complicated to make the students experience a cultural change and those kinds of things, because there''s, well, there''s no culture of, uh, industrial project in a school because it''s academic project or it''s teaching how to behave in a industrial project.

So it was lectures and labs and like a small project, but it was wasn''t really satisfactory. Devops concepts like configuration management and contaizerization need examples with mininum scale and complexity.

The students can have difficulty understanding the DevOps culture working on a small example.

Small project wasn''t really satisfactory. Small examples weren''t really satisfactory. example; sample; project; activity; task; mission; tool; technology', 2, 'small examples not satisfactory.', 'Doing infrastructure as code or forms of configuration management or containerization, or even the simpler things like treating build scripts as first-class citizens alongside your code, start to not be meaningful until you have code at some minimum scale where there''s a certain minimum complexity, both in terms of construction.

If you give artificial example or small toy example, then it''s just going about configuring small things. So naturally naturally what DevOps is, uh, it''s really complicated to make the students experience a cultural change and those kinds of things, because there''s, well, there''s no culture of, uh, industrial project in a school because it''s academic project or it''s teaching how to behave in a industrial project.

So it was lectures and labs and like a small project, but it was wasn''t really satisfactory.', 'Small examples weren''t really satisfactory.', true, 'example; sample; project; activity; task; mission; tool; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (36, 'Difficulty in monitoring and keeping in touch with all students effectively during remote learning classes.

It''s hard to do hands-on on remote learning because the teacher can''t see the students face.

It is very difficult to interact with students in lecture remote teaching.', 'For you to be able to look at all the students is very difficult, I understand why some cannot open the camera. It does not have the capacity or technology or structure to open, talk to you. Communication is broken, no matter how much we open it all the time, even if Zoom allows it. It is different from everyday life in the classroom because you cannot look at the student and see how he is reacting to that content. Not that you only adapt to one student, but you do not have the personal perception of doubt. Sometimes you can look at the student and say, oh, I think that was not clear to him. It is a challenge.

Because of the remote learning [...] I''ve been teaching my classes on zoom. And so, uh, that makes it very hard to do hands-on because I can''t see the students right. While I''m doing the hands-on. So I can''t see the puzzled look on their face and say, okay, I just lost them.

To make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. And of course, uh, zoom teaching, uh, makes it a challenge. Difficulty in monitoring and keeping in touch with all students effectively during remote learning classes.

It''s hard to do hands-on on remote learning because the teacher can''t see the students face.

It is very difficult to interact with students in lecture remote teaching. Comunications with students is hard when classes are remote. remote; communication; conversation; interaction; discussion; strategy; execution', 3, 'students'' difficulty in remote learning: in monitoring and keeping in contact ', 'For you to be able to look at all the students is very difficult, I understand why some cannot open the camera. It does not have the capacity or technology or structure to open, talk to you. Communication is broken, no matter how much we open it all the time, even if Zoom allows it. It is different from everyday life in the classroom because you cannot look at the student and see how he is reacting to that content. Not that you only adapt to one student, but you do not have the personal perception of doubt. Sometimes you can look at the student and say, oh, I think that was not clear to him. It is a challenge.

Because of the remote learning [...] I''ve been teaching my classes on zoom. And so, uh, that makes it very hard to do hands-on because I can''t see the students right. While I''m doing the hands-on. So I can''t see the puzzled look on their face and say, okay, I just lost them.

To make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. And of course, uh, zoom teaching, uh, makes it a challenge.', 'Comunications with students is hard when classes are remote.', false, 'remote; communication; conversation; interaction; discussion; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (42, 'Difficulty supporting the use of several different tools and environments at the same time.

Differences in people''s environments and their hardware configuration cause problems.

Different types of OSs can difficult the flow of environment setup.', '[...] it turned out that a lot of people did it in [...] different environments [...] for us, teacher, often we are not proficient in all of these.

Yeah, so challenges, um, differences in people''s environments, their hardware, for example, every term, you know, if I want people to do something locally with, let''s say, setting up virtual machines or containers or, or whatever, there''s always some buddy who has some strange hardware configuration that causes problems.

We have some students on Mac, some on Linux, some on windows, some have, um, computers that are led by the university. They came up to class with computers, with family version of windows that cannot run Docker because there is no hypervisor in it. Difficulty supporting the use of several different tools and environments at the same time.

Differences in people''s environments and their hardware configuration cause problems.

Different types of OSs can difficult the flow of environment setup. It''s difficult to deal with different hardware and software. tool; environment; hardware; tool; technology', 3, 'Difficulty supporting multiple tools and environments', '[...] it turned out that a lot of people did it in [...] different environments [...] for us, teacher, often we are not proficient in all of these.

Yeah, so challenges, um, differences in people''s environments, their hardware, for example, every term, you know, if I want people to do something locally with, let''s say, setting up virtual machines or containers or, or whatever, there''s always some buddy who has some strange hardware configuration that causes problems.

We have some students on Mac, some on Linux, some on windows, some have, um, computers that are led by the university. They came up to class with computers, with family version of windows that cannot run Docker because there is no hypervisor in it.', 'It''s difficult to deal with different hardware and software.', false, 'tool; environment; hardware; tool; technology', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (55, 'You have to find a set of tools that work together.

For many people, getting all technologies to work together can be particularly challenging.', 'You have to find a set of tools that work together.

 For many people, getting them all to work together can be particularly challenging. You have to find a set of tools that work together.

For many people, getting all technologies to work together can be particularly challenging. Getting all DevOps tools to work together is challenging. tool; technology; integration; tool; technology; automation; combination', 2, 'Challenge of integration of all DevOps tools together ', 'You have to find a set of tools that work together.

 For many people, getting them all to work together can be particularly challenging.', 'Getting all DevOps tools to work together is challenging.', true, 'tool; technology; integration; tool; technology; automation; combination', 'TOOL_TECHNOLOGY', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (12, 'Difficulty finding book on corporate systems related to DevOps.

Literature in the area of ​​enterprise systems related to DevOps is insufficient.

Difficulty in structuring classes due to lack of reference material.

There is no fully agreed community base text.

There are not so many scientific articles on which to base course preparation.

The books are more industry oriented. There is no textbook about with discussion about DevOps concepts.

There''s limited material to teach.

Books are designed to company professionals and not about to students who are learning.', 'There is no such literature in the area of ​​enterprise systems.

A partner editor, including the board, who brought a catalog of books for us to take a look at, and I went after it, including a book on the subject, right? From corporate systems, right, from this part of DevOps, and simply, I didn''t find it in the catalog.

The even greater difficulty, which I can point out, is precisely the structuring, really, perhaps of the sequence of classes, because we do not have this material that guides.

It is a discipline with no definition, so there is no introductory textbook. There is not something totally agreed upon between the community of what it is, when it is applied, and such.

The course preparation is very difficult [...] there will not be that much paper, article because it is very new.

 And then the books are more industry oriented. Like, uh, we don''t look at the, uh, uh, more with teaching parts, like, um, so there is no textbook, actually it is more industry document, eh, discussion about DevOps.

 what we sit and do, but, uh, so from the lab perspective, that''s interesting, but on the teaching side, as I said, like, uh, having limited material, make the teaching a little bit more difficult.

your books are written mostly with the different projects in mind. Like they are thinking about people working in the company, but not thinking about students who are learning. And this makes it very difficult to design a DevOps curriculum where you cover a hundred percent DevOps in one course. Difficulty finding book on corporate systems related to DevOps.

Literature in the area of ​​enterprise systems related to DevOps is insufficient.

Difficulty in structuring classes due to lack of reference material.

There is no fully agreed community base text.

There are not so many scientific articles on which to base course preparation.

The books are more industry oriented. There is no textbook about with discussion about DevOps concepts.

There''s limited material to teach.

Books are designed to company professionals and not about to students who are learning. Insufficient literature related to teach DevOps. literature; material; book; publication; preparation; research', 3, 'Insufficient literature.', 'There is no such literature in the area of ​​enterprise systems.

A partner editor, including the board, who brought a catalog of books for us to take a look at, and I went after it, including a book on the subject, right? From corporate systems, right, from this part of DevOps, and simply, I didn''t find it in the catalog.

The even greater difficulty, which I can point out, is precisely the structuring, really, perhaps of the sequence of classes, because we do not have this material that guides.

It is a discipline with no definition, so there is no introductory textbook. There is not something totally agreed upon between the community of what it is, when it is applied, and such.

The course preparation is very difficult [...] there will not be that much paper, article because it is very new.

 And then the books are more industry oriented. Like, uh, we don''t look at the, uh, uh, more with teaching parts, like, um, so there is no textbook, actually it is more industry document, eh, discussion about DevOps.

 what we sit and do, but, uh, so from the lab perspective, that''s interesting, but on the teaching side, as I said, like, uh, having limited material, make the teaching a little bit more difficult.

your books are written mostly with the different projects in mind. Like they are thinking about people working in the company, but not thinking about students who are learning. And this makes it very difficult to design a DevOps curriculum where you cover a hundred percent DevOps in one course.', 'Insufficient literature related to teach DevOps.', true, 'literature; material; book; publication; preparation; research', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (31, 'The teacher needs good technical knowledge in the areas of security (especially vulnerability management) and systems development to teach DevSecOps.

Skills to teach DevOps are challeging.', 'DevSecOps [...] is the type of discipline that requires strong knowledge in two areas, both distinct, in the security area, but at the same time in the development area to be able to find the link between the two and then yes, get to what the student.

The second point that the second challenge would be [...] skills.  I''m working on software engineering and I''m working on how to build software since the gate. The teacher needs good technical knowledge in the areas of security (especially vulnerability management) and systems development to teach DevSecOps.

Skills to teach DevOps are challeging. Skills to teach DevOps are challeging. technology; knowledge; skill; teaching; technique; training; preparation', 2, 'Teacher background necessary in DevSecOps teaching: security and development', 'DevSecOps [...] is the type of discipline that requires strong knowledge in two areas, both distinct, in the security area, but at the same time in the development area to be able to find the link between the two and then yes, get to what the student.

The second point that the second challenge would be [...] skills.  I''m working on software engineering and I''m working on how to build software since the gate.', 'Skills to teach DevOps are challeging.', false, 'technology; knowledge; skill; teaching; technique; training; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (40, 'Lack of time for teachers to develop a ready-made and well-crafted example system.

Lack of time to structure more complex environments with students.', 'So, because then, if I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such, but then we also know that there are challenges, right? Wow, this is not that simple, will I have time to do it, right?

There is no time for, for example, structuring complex environments [...] I know it is not the reality in the market, very few companies I had contact that set up their environment from scratch on the nail, in a set of internal servers. Lack of time for teachers to develop a ready-made and well-crafted example system.

Lack of time to structure more complex environments with students. Lack of time to prepare classes to teach DevOps. time; example; sample; preparation', 2, 'Little time during preparation of a well-designed example system by the teacher with little time ', 'So, because then, if I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such, but then we also know that there are challenges, right? Wow, this is not that simple, will I have time to do it, right?

There is no time for, for example, structuring complex environments [...] I know it is not the reality in the market, very few companies I had contact that set up their environment from scratch on the nail, in a set of internal servers.', 'Lack of time to prepare classes to teach DevOps.', false, 'time; example; sample; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (41, 'Difficulty for teachers to keep up with the state of the art in the industry.

It is important to be up-to-date on industry tools every six months.

Every semester is necessary to update tools used on course.

The cloud are constantly evolving and it breaks labs every semester.

Lots of preparation to keep tools and environment working, secure and updated.

Keep up with new technologies is challenging.

Tool versions upgrades require updating the labs during the classes.

It is difficult to keep up the current state of art of devops industry practices.

Devops tools and APIs change fast and it may break your labs.

Exercises can be outdated in few months.

Many tools and some are not mature and not commonly used yet.

DevOps is always evolving fast in the last five years.

Lab session works one day and then doesn''t work because there are changes like update in Docker API.

Keeping things up to date and making things working the labs is really stressful and time costing.', 'If I make this system [...] We, professors, sometimes are not the most proficient programmers there are, so maybe what we write is not in accordance with what is happening in the market today.

So it is in line with what is happening in the community as a whole, right? Always trying to bring it, because this area, specifically, it runs very fast. So, every semester I run this discipline once a year, there are very strong updates on what is happening.

You have to change the tools almost every semester or every two years. You''ve got to look at what are the popular tools right now.

So the challenge for me is that the cloud is constantly evolving. And so every semester what I try to do in my class, in my labs, I have snapshots of screenshots and circles and arrows and, you know, click on this and move there. Um, and that changes constantly.

So there''s a lot of preparation in making sure that the tools still work the way they should, that the cloud still works the way they should, um, that the code doesn''t have vulnerabilities in it. And that you''ve got all the right versions of stuff. So that''s a lot of, uh, preparation then of course, as I said, you know, new technologies, like when Kubernetes came around, you know, you have to add Kubernetes to the class, constantly adding new technologies to the class move.

The big challenge for me right, is, uh, is keeping up with the technology [...] so it''s just challenging to keep up with all the new technology that''s out there in DevOps.

And so every so often I''ll get folks who have taken one class and then they start using the wrong version of the tool for the second class, because they have an upgraded or something along those lines. 

We move through some technology on the application side, we''ll move through a little bit of technology on the operation side. What does change is trying to keep up to speed and keep the class adjusted for, uh, what the current state of the art and the current understanding of best practices.

There''s always double checking the technology, making sure that if you''ve got any automation in your class, it still works after all of the API changes may have gone into effect on say your cloud provider or, or whatever, making sure you''re on the latest and greatest versions of whatever tooling that you''re going to use and make sure that the hat that hasn''t broken things and always missing something and suddenly be scrambling before class going, oh no, no, no. They''ve changed something. I need to figure this out.

Um, we got bit by that quite a few times where we built the stack plus G unit plus, uh, we use, um, uh, some additional libraries for front-end, uh, some scripts for building Docker images, some version of Maven, and you need an Artifactory, et cetera. You can get everything set up, everything works fine up to June. Then you go on summer break and then the next session comes up in September and you use what you''ve built well, too bad. In the middle of the summer, Jay, you need to release a new version that requires where some acts of Maven that requires this version of the stack of the student install from scratch on their machine.

The main, uh, challenge that we had was that DevOps is, there are many too many tools and, uh, many of these tools are not solid and are not commonly used yet.

 I mean devops is always evolving and we are not what we consider DevOps here is different for, from what was considered DevOps, let''s say five years ago.

The lab session, they have to be like really precise. You have to, it would work one day. And then the second day it doesn''t work because there''s an upgrade in the Docker API that makes things totally different. Or you you''re, you''re using it in the Dockerfile, you''re using keywords. And then suddenly the new version of Docker decide that those keywords are deprecated and that you should not, uh, declared the authors this way.

So keeping things up to date and making things work like really working in, in, in being able to run the labs, not in panic mode, that everything was fragile and everything was able to collapse at any point was really stressful. And of course, a lot of things, I think it costs me like twice or three times the cost of preparing a regular course. Difficulty for teachers to keep up with the state of the art in the industry.

It is important to be up-to-date on industry tools every six months.

Every semester is necessary to update tools used on course.

The cloud are constantly evolving and it breaks labs every semester.

Lots of preparation to keep tools and environment working, secure and updated.

Keep up with new technologies is challenging.

Tool versions upgrades require updating the labs during the classes.

It is difficult to keep up the current state of art of devops industry practices.

Devops tools and APIs change fast and it may break your labs.

Exercises can be outdated in few months.

Many tools and some are not mature and not commonly used yet.

DevOps is always evolving fast in the last five years.

Lab session works one day and then doesn''t work because there are changes like update in Docker API.

Keeping things up to date and making things working the labs is really stressful and time costing. It''s challeging to be up-to-date with industrial DevOps tools. state of the art; tool; up-to-date; update; break; change; advance; improvement; pause; evolution; development; progress; preparation', 7, 'teacher constantly updated with the industry', 'If I make this system [...] We, professors, sometimes are not the most proficient programmers there are, so maybe what we write is not in accordance with what is happening in the market today.

So it is in line with what is happening in the community as a whole, right? Always trying to bring it, because this area, specifically, it runs very fast. So, every semester I run this discipline once a year, there are very strong updates on what is happening.

You have to change the tools almost every semester or every two years. You''ve got to look at what are the popular tools right now.

So the challenge for me is that the cloud is constantly evolving. And so every semester what I try to do in my class, in my labs, I have snapshots of screenshots and circles and arrows and, you know, click on this and move there. Um, and that changes constantly.

So there''s a lot of preparation in making sure that the tools still work the way they should, that the cloud still works the way they should, um, that the code doesn''t have vulnerabilities in it. And that you''ve got all the right versions of stuff. So that''s a lot of, uh, preparation then of course, as I said, you know, new technologies, like when Kubernetes came around, you know, you have to add Kubernetes to the class, constantly adding new technologies to the class move.

The big challenge for me right, is, uh, is keeping up with the technology [...] so it''s just challenging to keep up with all the new technology that''s out there in DevOps.

And so every so often I''ll get folks who have taken one class and then they start using the wrong version of the tool for the second class, because they have an upgraded or something along those lines. 

We move through some technology on the application side, we''ll move through a little bit of technology on the operation side. What does change is trying to keep up to speed and keep the class adjusted for, uh, what the current state of the art and the current understanding of best practices.

There''s always double checking the technology, making sure that if you''ve got any automation in your class, it still works after all of the API changes may have gone into effect on say your cloud provider or, or whatever, making sure you''re on the latest and greatest versions of whatever tooling that you''re going to use and make sure that the hat that hasn''t broken things and always missing something and suddenly be scrambling before class going, oh no, no, no. They''ve changed something. I need to figure this out.

Um, we got bit by that quite a few times where we built the stack plus G unit plus, uh, we use, um, uh, some additional libraries for front-end, uh, some scripts for building Docker images, some version of Maven, and you need an Artifactory, et cetera. You can get everything set up, everything works fine up to June. Then you go on summer break and then the next session comes up in September and you use what you''ve built well, too bad. In the middle of the summer, Jay, you need to release a new version that requires where some acts of Maven that requires this version of the stack of the student install from scratch on their machine.

The main, uh, challenge that we had was that DevOps is, there are many too many tools and, uh, many of these tools are not solid and are not commonly used yet.

 I mean devops is always evolving and we are not what we consider DevOps here is different for, from what was considered DevOps, let''s say five years ago.

The lab session, they have to be like really precise. You have to, it would work one day. And then the second day it doesn''t work because there''s an upgrade in the Docker API that makes things totally different. Or you you''re, you''re using it in the Dockerfile, you''re using keywords. And then suddenly the new version of Docker decide that those keywords are deprecated and that you should not, uh, declared the authors this way.

So keeping things up to date and making things work like really working in, in, in being able to run the labs, not in panic mode, that everything was fragile and everything was able to collapse at any point was really stressful. And of course, a lot of things, I think it costs me like twice or three times the cost of preparing a regular course.', 'It''s challeging to be up-to-date with industrial DevOps tools.', false, 'state of the art; tool; up-to-date; update; break; change; advance; improvement; pause; evolution; development; progress; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (44, 'There is no unified material for teaching DevOps.

There is no complete material to teach DevOps.', 'Material heterogeneity is the biggest challenge. You have to set up a class sewing the fonts, right?

When I started preparing, there was not a buy the book, a kit a suggestion for a course, there for you to start, it is a good start, right? There is no unified material for teaching DevOps.

There is no complete material to teach DevOps. Unknown unified material for teaching DevOps. material; preparation', 2, 'There is no unified material for DevOps teaching.', 'Material heterogeneity is the biggest challenge. You have to set up a class sewing the fonts, right?

When I started preparing, there was not a buy the book, a kit a suggestion for a course, there for you to start, it is a good start, right?', 'Unknown unified material for teaching DevOps.', true, 'material; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (45, 'Difficulty in resuming sufficient and suitable material for class lessons.

It is necessary to use multiple books because they do not cover all concepts.', 'Because you take so many different things that I feel a bit sorry, in quotes, to pass everything on to the students. ... So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such. It would be that, the condensation of everything, let''s say, the centralization of the material in what you produced, right?

I use a couple of books, um, and, uh, as I said, to to be able to own, um, they cover many different topics. And so I tried to use one over, two picks in it. [...] I still think that, uh, the idea scenario would have been able, will have been, to be able to do a situation where I can take several topics in the book and then cover them from the beginning to them. But, uh, I haven''t been able to find that possible yet. Difficulty in resuming sufficient and suitable material for class lessons.

It is necessary to use multiple books because they do not cover all concepts. Difficulty in using multiple materials to create the classes. material; preparation', 2, 'Difficulty in condensing suitable material for classes', 'Because you take so many different things that I feel a bit sorry, in quotes, to pass everything on to the students. ... So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such. It would be that, the condensation of everything, let''s say, the centralization of the material in what you produced, right?

I use a couple of books, um, and, uh, as I said, to to be able to own, um, they cover many different topics. And so I tried to use one over, two picks in it. [...] I still think that, uh, the idea scenario would have been able, will have been, to be able to do a situation where I can take several topics in the book and then cover them from the beginning to them. But, uh, I haven''t been able to find that possible yet.', 'Difficulty in using multiple materials to create the classes.', false, 'material; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (48, 'Difficulty in structuring the learning journey.

Difficulty to create a teaching plan, especially connecting the covered subjects.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.

The teaching plan, where I am going to start, where I am going to go, what is next. So, structuring this sequence of subjects to be covered, of how you are going to connect the subjects, which is the hardest part. Difficulty in structuring the learning journey.

Difficulty to create a teaching plan, especially connecting the covered subjects. Difficulty in structuring the learning journey. teaching; planning; concept; syllabus; theory; training; learning; preparation; curriculum', 1, 'Difficulty in structuring the learning journey', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.

The teaching plan, where I am going to start, where I am going to go, what is next. So, structuring this sequence of subjects to be covered, of how you are going to connect the subjects, which is the hardest part.', 'Difficulty in structuring the learning journey.', false, 'teaching; planning; concept; syllabus; theory; training; learning; preparation; curriculum', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (50, 'Difficulty in setting up classes without a prior reference ones.

It isn''t easy to create a DevOps course without having another course as a reference.

Few universities have a DevOps course.

It''s really difficult to find supports if you want to teach DevOps.', 'the real challenge was when I started doing it, which I didn''t have any. Then, building from scratch is more difficult, there is no baseline. [...] [...] these types of challenges, they are more related to the nature of the subject, not the object, that is: what type of content, how will you conduct this course, how will you want to conduct the discipline.

I didn''t find any course, really I was looking for courses in devops, like yes, there were courses that talk about kubernetes that these, yes. There are courses that talk about, uh, integrated testing. Yes. There are courses. We talk about AWS and cloud, but I didn''t find any course on devops that I can two years ago that I''m almost like three years ago now when I started to work on it, um, use as a basis. Right. So the first semester was a nightmare. 

In 2018, 2019, and yet no universities have a program in DevOps, no universities, essentially very few universities have a course in DevOps.

If you want to teach devops, it''s really difficult to find, uh, supports, like finding a way to understand how it''s towards elsewhere. It''s really complicated because there''s not a lot, of course that grant themselves as DevOps, basically because it''s often hidden because it''s something technical you''re not supposed to teach. Difficulty in setting up classes without a prior reference ones.

It isn''t easy to create a DevOps course without having another course as a reference.

Few universities have a DevOps course.

It''s really difficult to find supports if you want to teach DevOps. It is difficult to create a DevOps course without a previous reference ones. reference; support; class; resource; preparation', 3, 'Difficult during the creation of the classes without reference to a previous discipline.', 'the real challenge was when I started doing it, which I didn''t have any. Then, building from scratch is more difficult, there is no baseline. [...] [...] these types of challenges, they are more related to the nature of the subject, not the object, that is: what type of content, how will you conduct this course, how will you want to conduct the discipline.

I didn''t find any course, really I was looking for courses in devops, like yes, there were courses that talk about kubernetes that these, yes. There are courses that talk about, uh, integrated testing. Yes. There are courses. We talk about AWS and cloud, but I didn''t find any course on devops that I can two years ago that I''m almost like three years ago now when I started to work on it, um, use as a basis. Right. So the first semester was a nightmare. 

In 2018, 2019, and yet no universities have a program in DevOps, no universities, essentially very few universities have a course in DevOps.

If you want to teach devops, it''s really difficult to find, uh, supports, like finding a way to understand how it''s towards elsewhere. It''s really complicated because there''s not a lot, of course that grant themselves as DevOps, basically because it''s often hidden because it''s something technical you''re not supposed to teach.', 'It is difficult to create a DevOps course without a previous reference ones.', false, 'reference; support; class; resource; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (71, 'The preparation of the exercise is demanding.

It is laborious to prepare the exercise that the students will work.', 'It''s mostly the preparation of the exercise that is demanding.

That''s one of the challenge that I find in preparing proper courses, finding and implementing an application, creating some issues in it, some bugs in it. The preparation of the exercise is demanding.

It is laborious to prepare the exercise that the students will work. The preparation of the exercise is demanding. exercise; preparation', 2, 'laborious exercise preparation', 'It''s mostly the preparation of the exercise that is demanding.

That''s one of the challenge that I find in preparing proper courses, finding and implementing an application, creating some issues in it, some bugs in it.', 'The preparation of the exercise is demanding.', true, 'exercise; preparation', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (76, 'Make a DevOps course attractive to the students is challenging.

Make the lectures attractive is difficult.', 'For us as educators, we need to find a way where we can make it interesting.

You can make the lectures more interactive, but to make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. Make a DevOps course attractive to the students is challenging.

Make the lectures attractive is difficult. Make a DevOps course attractive to the students is challenging. lecture; motivation; course', 2, 'Challenge of creation of an attractive DevOps course', 'For us as educators, we need to find a way where we can make it interesting.

You can make the lectures more interactive, but to make the lecture attractive students have to willing to interact. Right. Which is very difficult to do.', 'Make a DevOps course attractive to the students is challenging.', true, 'lecture; motivation; course', 'CLASS_PREPARATION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (13, 'It is difficult to make the student face teaching scenarios with a more professional perspective, with production-level monitoring.

Difficulty in making clear to students the importance of having a more realistic perspective of production, using other environments and leaving aside the comfort zone in which they may be inserted.', 'Once it''s deployed, how do you manage to monitor and give and maybe get feedback from the customer, maybe things to improve, the monitoring of the system itself, this part is a challenge, really, to be able to show it to the student and maybe , make him face it from a more professional perspective, because already imagining that he is going to the market and will come across these many situations there.

When they arrive, many use another environment[...] they put the system there and they don''t have to worry too much about other details[...] We really ask them to make this migration for them to have this other view, this aspect of setting up the environment. Putting it into production and keeping this system working.[...] I think this can be seen as a challenge, which is to convince students to give importance to this, the importance of them knowing these aspects too, not leaving it so transparent to them too. It is difficult to make the student face teaching scenarios with a more professional perspective, with production-level monitoring.

Difficulty in making clear to students the importance of having a more realistic perspective of production, using other environments and leaving aside the comfort zone in which they may be inserted. Difficulty in making clear to students the importance of having a more realistic perspective of production. professional; realistic; scenario; exercise; strategy; execution', 1, 'Exercises with professional scenarios', 'Once it''s deployed, how do you manage to monitor and give and maybe get feedback from the customer, maybe things to improve, the monitoring of the system itself, this part is a challenge, really, to be able to show it to the student and maybe , make him face it from a more professional perspective, because already imagining that he is going to the market and will come across these many situations there.

When they arrive, many use another environment[...] they put the system there and they don''t have to worry too much about other details[...] We really ask them to make this migration for them to have this other view, this aspect of setting up the environment. Putting it into production and keeping this system working.[...] I think this can be seen as a challenge, which is to convince students to give importance to this, the importance of them knowing these aspects too, not leaving it so transparent to them too.', 'Difficulty in making clear to students the importance of having a more realistic perspective of production.', true, 'professional; realistic; scenario; exercise; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (32, 'Difficulty in knowing how to deal with groups of students who have very different experiences.

Students in a class have different backgrounds, life stories and experiences.

Difficulty in preparing classes with students at different levels of proficiency in development and operation.

Dealing with the different experiences and perspectives of each student.

It''s hard to teach people with different backgrounds.

Students have different backgrouds.', 'The second challenge is people with different experiences [...] you have mixed classes, so at a point in the course where you talk about a specific programming language to give an example. Some are more familiar than others. [...] So, knowing how to deal with these differences to make the course pleasant for everyone and comfortable for everyone, this is a great challenge.

We have a standard agreement, not an agreement. It is a convention that we have which is the following, people are different, see? [...] they have different backgrounds, they have different life stories, experiences that marked them in different ways.

In both classes that I taught [...], there was a challenge of class heterogeneity. You have very proficient people in the development and have no idea about the server, Linux and environment configuration, tools, the other spectrum. People who came from operational, System admin itself is not so proficient in the programming part, in code.

Each student in the class brings a different experience, different challenges, and trying to generalize this is more complicated.

One of the challenges is how do you teach people from these different backgrounds [...]  there is so much technology that comes together in DevOps, that the challenge is how do you get everyone up to speed on an even right? So that we can all move forward together and learn together. So, so that''s a big challenge.

Some of them do have a lot of programming and are fairly mature, but because when we recruit, they be coming from different schools. Difficulty in knowing how to deal with groups of students who have very different experiences.

Students in a class have different backgrounds, life stories and experiences.

Difficulty in preparing classes with students at different levels of proficiency in development and operation.

Dealing with the different experiences and perspectives of each student.

It''s hard to teach people with different backgrounds.

Students have different backgrouds. It''s challeging to deal with students having different backgrounds. knowledge; level; background; experience; history; skill; technique; strategy; execution', 5, 'Difficulty in collaboration with groups of students who have very different experiences', 'The second challenge is people with different experiences [...] you have mixed classes, so at a point in the course where you talk about a specific programming language to give an example. Some are more familiar than others. [...] So, knowing how to deal with these differences to make the course pleasant for everyone and comfortable for everyone, this is a great challenge.

We have a standard agreement, not an agreement. It is a convention that we have which is the following, people are different, see? [...] they have different backgrounds, they have different life stories, experiences that marked them in different ways.

In both classes that I taught [...], there was a challenge of class heterogeneity. You have very proficient people in the development and have no idea about the server, Linux and environment configuration, tools, the other spectrum. People who came from operational, System admin itself is not so proficient in the programming part, in code.

Each student in the class brings a different experience, different challenges, and trying to generalize this is more complicated.

One of the challenges is how do you teach people from these different backgrounds [...]  there is so much technology that comes together in DevOps, that the challenge is how do you get everyone up to speed on an even right? So that we can all move forward together and learn together. So, so that''s a big challenge.

Some of them do have a lot of programming and are fairly mature, but because when we recruit, they be coming from different schools.', 'It''s challeging to deal with students having different backgrounds.', false, 'knowledge; level; background; experience; history; skill; technique; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (46, 'Students rely heavily on the teacher''s slide material, which is often limited.

The students don''t read the suggested book even if you strongly encourage them.

Students tend to get short free versions and not full versions of books.', 'And sometimes you took a little bit of such a thing, right? Not all that text was relevant, you know? So, your material ends up becoming the only source, let''s put it that way. For students, I''ve already figured that out, like, you know? People studied and such, they went a lot for the material I prepared. When the material I was preparing was, let''s say, it was a set of slides, right? Which doesn''t serve that much, from the point of view, right, from having a more in-depth reading and such. So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such.

There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.
So, all this traceability of what was done to what they are going to do, was the very difficult part [...] So, you can''t think about doing a theoretical thing, you have to have practice, you can''t just to be just practical exercises, it has to have a whole journey, a well-established train of thought. It was quite tricky to get to that topic.

 So part one is the three ways, just give you an overview of the, each of the three way. And then you have one part essentially for each of the three ways. And I think that the first two parts of the book you can find online, but, but not, not as a, someone who puts it in PDF, but from the publisher, from, from revolution, publisher and official version. So you can read it from the way. Students rely heavily on the teacher''s slide material, which is often limited.

The students don''t read the suggested book even if you strongly encourage them.

Students tend to get short free versions and not full versions of books. Students rely on limited material instead of reading books. material; strategy; execution', 2, 'Strong reliance on student-limited support material', 'And sometimes you took a little bit of such a thing, right? Not all that text was relevant, you know? So, your material ends up becoming the only source, let''s put it that way. For students, I''ve already figured that out, like, you know? People studied and such, they went a lot for the material I prepared. When the material I was preparing was, let''s say, it was a set of slides, right? Which doesn''t serve that much, from the point of view, right, from having a more in-depth reading and such. So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such.

There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.
So, all this traceability of what was done to what they are going to do, was the very difficult part [...] So, you can''t think about doing a theoretical thing, you have to have practice, you can''t just to be just practical exercises, it has to have a whole journey, a well-established train of thought. It was quite tricky to get to that topic.

 So part one is the three ways, just give you an overview of the, each of the three way. And then you have one part essentially for each of the three ways. And I think that the first two parts of the book you can find online, but, but not, not as a, someone who puts it in PDF, but from the publisher, from, from revolution, publisher and official version. So you can read it from the way.', 'Students rely on limited material instead of reading books.', false, 'material; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) VALUES (66, 'When you start teaching DevOps, it doesn''t look relevant.

Students only believe the importance of DevOps mindset when they experiment in the practice.

Students do not know that they will need DevOps concepts at industry every day.

Young undergraduate students can have no interest in DevOps course.', 'Human challenges are when you start teaching DevOps, it doesn''t look serious.

So one of the challenges regarding the culture, if you want, is that when you tell them that initially they don''t believe it. And only when they start doing it, they do believe it. 

Whatever they found it valuable usually, um, after the class is done at the end of the year, they don''t always see the value. It''s the kind of class where you want them to know this stuff, because once they will be in the industry, they''ll need it every day. Um, but they don''t know they need it every day. 

An undergrad program, it''s also something complicated because it''s teaching at the undergrad program might make sense, but then it''s other kinds of challenges like younger students who might not be interested in this. When you start teaching DevOps, it doesn''t look relevant.

Students only believe the importance of DevOps mindset when they experiment in the practice.

Students do not know that they will need DevOps concepts at industry every day.

Young undergraduate students can have no interest in DevOps course. DevOps course doesn''t look relevant for undergratuate students when you start teaching. motivation; mindset; strategy; execution', 2, 'students without motivation in DevOps course', 'Human challenges are when you start teaching DevOps, it doesn''t look serious.

So one of the challenges regarding the culture, if you want, is that when you tell them that initially they don''t believe it. And only when they start doing it, they do believe it. 

Whatever they found it valuable usually, um, after the class is done at the end of the year, they don''t always see the value. It''s the kind of class where you want them to know this stuff, because once they will be in the industry, they''ll need it every day. Um, but they don''t know they need it every day. 

An undergrad program, it''s also something complicated because it''s teaching at the undergrad program might make sense, but then it''s other kinds of challenges like younger students who might not be interested in this.', 'DevOps course doesn''t look relevant for undergratuate students when you start teaching.', true, 'motivation; mindset; strategy; execution', 'STRATEGIES_IN_COURSE_EXECUTION', NULL);


-- Completed on 2023-05-01 00:31:31

--
-- PostgreSQL database dump complete
--

