--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-29 01:57:55

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

DROP DATABASE postgres;
--
-- TOC entry 3386 (class 1262 OID 5)
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
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 3386
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16581)
-- Name: challenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenge (
    id bigint NOT NULL,
    abstracts character varying(40000) NOT NULL,
    all_text character varying(40000) NOT NULL,
    amount_of_interviews bigint NOT NULL,
    code character varying(40000) NOT NULL,
    interview_quotes character varying(40000) NOT NULL,
    main_idea character varying(40000),
    specific boolean NOT NULL,
    tags character varying(40000) NOT NULL,
    theme character varying(255) NOT NULL
);


ALTER TABLE public.challenge OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16588)
-- Name: challenge_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenge_tag (
    challenge bigint NOT NULL,
    tag bigint NOT NULL
);


ALTER TABLE public.challenge_tag OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16593)
-- Name: link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link (
    challenge bigint NOT NULL,
    recommendation bigint NOT NULL
);


ALTER TABLE public.link OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16598)
-- Name: link_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_feedback (
    id bigint NOT NULL,
    feedback_type character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    link_challenge bigint,
    link_recommendation bigint
);


ALTER TABLE public.link_feedback OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16605)
-- Name: recommendation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendation (
    id bigint NOT NULL,
    abstracts character varying(40000) NOT NULL,
    all_text character varying(40000) NOT NULL,
    amount_of_interviews bigint NOT NULL,
    code character varying(40000) NOT NULL,
    interview_quotes character varying(40000) NOT NULL,
    main_idea character varying(40000),
    specific boolean NOT NULL,
    tags character varying(40000) NOT NULL,
    theme character varying(255) NOT NULL
);


ALTER TABLE public.recommendation OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16612)
-- Name: recommendation_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendation_feedback (
    id bigint NOT NULL,
    feedback_type character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    recommendation_id bigint NOT NULL
);


ALTER TABLE public.recommendation_feedback OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16619)
-- Name: recommendation_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendation_tag (
    recommendation bigint NOT NULL,
    tag bigint NOT NULL
);


ALTER TABLE public.recommendation_tag OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16448)
-- Name: seq_link_feedback; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_link_feedback
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_link_feedback OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16449)
-- Name: seq_recommendation_feedback; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_recommendation_feedback
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_recommendation_feedback OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16533)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 16581)
-- Dependencies: 218
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (1, 'Insufficient knowledge level of students to start the course.

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

Many students, even master''s students who are going through this kind of a program are probably, are we missing one or two frames of reference? A lot of students come through approaching this from the software engineering side of the house. They''re learning how to build applications and that sort of thing. They have no real experience on operations and simply standing up infrastructure in the cloud is not operations, right? It''s an aspect of operations. It''s important piece of operations, but it''s not everything you don''t necessarily have people with the expertise in network design capacity plan, security, identity management', 'Insufficient knowledge level of students to start the course.', false, 'knowledge; level; background; experience; history; skill; technique; curriculum; syllabus', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (2, 'Difficulty configuring and setting up the infrastructure needed to run DevOps experiments.

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

We''ve tried to let the students, uh, deal with the setup and, uh, install everything on their computer with Dockerizing stuff and scan things. And that was yet another disaster because then it''s not reproducible and it works on their computer, but then it''s really complicated to make it work on the TA.', 'Setting up the infrastructure is difficulty.', true, 'configuration; environment; setup; infrastructure', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (3, 'Few computational resources for setting up scenarios close to real ones.

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

If you''re the things and they''ve launch, you know, Docker and Jenkins, that''s it or JDK, that''s it. There''s no memory left. Um, so is the environment set up is hard. ', 'Limited computional resources.', false, 'hardware; resource; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (4, 'Even through educational partnerships, using private cloud providers by students could be limited.

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

Mean, captive of their platform and you also have to sign with your blood and agreements that you''re doing it for academic purposes and those kind of things, because IBM can be quite aggressive with their partnership, um, policies. So except that I had to sign something that was a little bit too much from my perspective, this kind of tooling was good.', 'Cloud providers usage has limits.', false, 'cloud; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (6, 'There is no taxonomy about what are the main DevOps concepts.

There''s a lack of reference on operations concepts.

It is difficult to express and formalize DevOps concepts. There is not bulletproof in devops.', 'There is no accepted taxonomy of what the concepts of DevOps are.

There''s a lack of frame of reference on even what operations is. Most people get into operations, at least in my experience sort of accidentally.

 How to express concept, formalize them. But at the same time also focus on those issues that are getting in the way, the non-industrial way of, you know, writing scripts that if you want to industrialize them and they become Bulletproof, it''s a mess, right? It''s difficult. There is no taxonomy about what are the main DevOps concepts.

There''s a lack of reference on operations concepts.

It is difficult to express and formalize DevOps concepts. There is not bulletproof in devops. There is no convention about DevOps concepts. taxonomy; concept; theory', 3, 'Lack of taxonomy of DevOps concepts', 'There is no accepted taxonomy of what the concepts of DevOps are.

There''s a lack of frame of reference on even what operations is. Most people get into operations, at least in my experience sort of accidentally.

 How to express concept, formalize them. But at the same time also focus on those issues that are getting in the way, the non-industrial way of, you know, writing scripts that if you want to industrialize them and they become Bulletproof, it''s a mess, right? It''s difficult.', 'There is no convention about DevOps concepts.', true, 'taxonomy; concept; theory', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (7, 'Unknown specific devops educational supportive environment.', 'I don''t know any specific teaching devops tool. Unknown specific devops educational supportive environment.  tool; environment; technology', 1, 'Lack of specific tool for DevOps teaching', 'I don''t know any specific teaching devops tool.', NULL, true, 'tool; environment; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (8, 'Insufficient time to address extensive DevOps knowledge in a limited-hour curriculum.

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

I introduced the concept of them speaking about continuous integration, continuous, and delivery and continuous deployment. But, uh, in, in practice doing the remaining stage in the lab is very challenging because we don''t have enough time because it''s three months.', 'Insufficient time in the course to teach DevOps.', true, 'time; content; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (9, 'Difficulty in getting authorization and lab resources from the institution to install tools in order to setup a DevOps environment.

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

All of those challenges are basically how do you rebuild an enterprise environment into a university environment that is much more restrictive and doesn''t have enough machines for them. Usually that''s a real challenge.', 'Institutions'' resources have limits.', true, 'university; academy; institution; restriction; limitation; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (10, 'There was no automated environment setup tool to support the student.', '
There wasn''t a tool to configure the environment [...] or to automate these environments then [..] since it became manual. There was no automated environment setup tool to support the student.  automation; environment; technology; setup', 1, 'No automated environment configuration tool.', '
There wasn''t a tool to configure the environment [...] or to automate these environments then [..] since it became manual.', NULL, true, 'automation; environment; technology; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (11, 'There was no script for the student on how to install the tools used during the course.', 'There wasn''t a set of [...] scripts that the student should configure this environment himself, install the tool himself [...] whatever the servers he needed. There was no script for the student on how to install the tools used during the course.  script; tutorial; installation; configuration; environment; setup', 1, 'Lack of tools installation script.', 'There wasn''t a set of [...] scripts that the student should configure this environment himself, install the tool himself [...] whatever the servers he needed.', NULL, true, 'script; tutorial; installation; configuration; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (12, 'Difficulty finding book on corporate systems related to DevOps.

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

your books are written mostly with the different projects in mind. Like they are thinking about people working in the company, but not thinking about students who are learning. And this makes it very difficult to design a DevOps curriculum where you cover a hundred percent DevOps in one course.', 'Insufficient literature related to teach DevOps.', true, 'literature; material; book; publication; preparation; research', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (13, 'It is difficult to make the student face teaching scenarios with a more professional perspective, with production-level monitoring.

Difficulty in making clear to students the importance of having a more realistic perspective of production, using other environments and leaving aside the comfort zone in which they may be inserted.', 'Once it''s deployed, how do you manage to monitor and give and maybe get feedback from the customer, maybe things to improve, the monitoring of the system itself, this part is a challenge, really, to be able to show it to the student and maybe , make him face it from a more professional perspective, because already imagining that he is going to the market and will come across these many situations there.

When they arrive, many use another environment[...] they put the system there and they don''t have to worry too much about other details[...] We really ask them to make this migration for them to have this other view, this aspect of setting up the environment. Putting it into production and keeping this system working.[...] I think this can be seen as a challenge, which is to convince students to give importance to this, the importance of them knowing these aspects too, not leaving it so transparent to them too. It is difficult to make the student face teaching scenarios with a more professional perspective, with production-level monitoring.

Difficulty in making clear to students the importance of having a more realistic perspective of production, using other environments and leaving aside the comfort zone in which they may be inserted. Difficulty in making clear to students the importance of having a more realistic perspective of production. professional; realistic; scenario; exercise; strategy; execution', 1, 'Exercises with professional scenarios', 'Once it''s deployed, how do you manage to monitor and give and maybe get feedback from the customer, maybe things to improve, the monitoring of the system itself, this part is a challenge, really, to be able to show it to the student and maybe , make him face it from a more professional perspective, because already imagining that he is going to the market and will come across these many situations there.

When they arrive, many use another environment[...] they put the system there and they don''t have to worry too much about other details[...] We really ask them to make this migration for them to have this other view, this aspect of setting up the environment. Putting it into production and keeping this system working.[...] I think this can be seen as a challenge, which is to convince students to give importance to this, the importance of them knowing these aspects too, not leaving it so transparent to them too.', 'Difficulty in making clear to students the importance of having a more realistic perspective of production.', true, 'professional; realistic; scenario; exercise; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (36, 'Difficulty in monitoring and keeping in touch with all students effectively during remote learning classes.

It''s hard to do hands-on on remote learning because the teacher can''t see the students face.

It is very difficult to interact with students in lecture remote teaching.', 'For you to be able to look at all the students is very difficult, I understand why some cannot open the camera. It does not have the capacity or technology or structure to open, talk to you. Communication is broken, no matter how much we open it all the time, even if Zoom allows it. It is different from everyday life in the classroom because you cannot look at the student and see how he is reacting to that content. Not that you only adapt to one student, but you do not have the personal perception of doubt. Sometimes you can look at the student and say, oh, I think that was not clear to him. It is a challenge.

Because of the remote learning [...] I''ve been teaching my classes on zoom. And so, uh, that makes it very hard to do hands-on because I can''t see the students right. While I''m doing the hands-on. So I can''t see the puzzled look on their face and say, okay, I just lost them.

To make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. And of course, uh, zoom teaching, uh, makes it a challenge. Difficulty in monitoring and keeping in touch with all students effectively during remote learning classes.

It''s hard to do hands-on on remote learning because the teacher can''t see the students face.

It is very difficult to interact with students in lecture remote teaching. Comunications with students is hard when classes are remote. remote; communication; conversation; interaction; discussion; strategy; execution', 3, 'students'' difficulty in remote learning: in monitoring and keeping in contact ', 'For you to be able to look at all the students is very difficult, I understand why some cannot open the camera. It does not have the capacity or technology or structure to open, talk to you. Communication is broken, no matter how much we open it all the time, even if Zoom allows it. It is different from everyday life in the classroom because you cannot look at the student and see how he is reacting to that content. Not that you only adapt to one student, but you do not have the personal perception of doubt. Sometimes you can look at the student and say, oh, I think that was not clear to him. It is a challenge.

Because of the remote learning [...] I''ve been teaching my classes on zoom. And so, uh, that makes it very hard to do hands-on because I can''t see the students right. While I''m doing the hands-on. So I can''t see the puzzled look on their face and say, okay, I just lost them.

To make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. And of course, uh, zoom teaching, uh, makes it a challenge.', 'Comunications with students is hard when classes are remote.', false, 'remote; communication; conversation; interaction; discussion; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (14, 'Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.

Difficulty for students to practice the concept of Continuous Delivery when it is necessary to add new features to the system without the build breaking.', 'The challenge of making students see this approach to operationalization, putting the system on the air, maintaining this system, adding new features and not breaking the system.

The concept of continuous delivery [...] The difficult thing is to put it into practice [...] when they, as a team, need to release a certain functionality and ensure that it doesn''t break the system. Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.

Difficulty for students to practice the concept of Continuous Delivery when it is necessary to add new features to the system without the build breaking. Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system. feature; break; system; build; continuous delivery; concept; theory; cd; application; pause; gradual; technique; approach; continuous deployment', 1, 'Difficulty in teaching about operationalization and addition of new system features', 'The challenge of making students see this approach to operationalization, putting the system on the air, maintaining this system, adding new features and not breaking the system.

The concept of continuous delivery [...] The difficult thing is to put it into practice [...] when they, as a team, need to release a certain functionality and ensure that it doesn''t break the system.', 'Difficulty in teaching the student how to operate the system, allowing the addition of new features without breaking the system.', true, 'feature; break; system; build; continuous delivery; concept; theory; cd; application; pause; gradual; technique; approach; continuous deployment', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (15, 'Difficulty in assessing students'' understanding of Continuous Delivery.', 'How can we see if the student is aware of the concept of continuous delivery, which is one of the concepts we address? Difficulty in assessing students'' understanding of Continuous Delivery.  continuous delivery; assessment; cd; evaluation; gradual; technique; continuous deployment', 1, 'Difficulty in evaluating the understanding of Continuous Delivery', 'How can we see if the student is aware of the concept of continuous delivery, which is one of the concepts we address?', NULL, true, 'continuous delivery; assessment; cd; evaluation; gradual; technique; continuous deployment', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (16, 'The environment adopted by instructors can frighten students by making them migrate to other tools.

Students'' initial difficult at having to switch from tools in which their applications were already working to the one adopted by the instructor.', 'It''s more this initial contact that seems to scare them a little more, it makes them go to others, when they arrive.

The part of actually putting an initial part has this shock of this reality there for the students in which they have to leave a tool that they are already there with the system running and bring it to our tool. The environment adopted by instructors can frighten students by making them migrate to other tools.

Students'' initial difficult at having to switch from tools in which their applications were already working to the one adopted by the instructor. The process of making students migrate to other tools it''s hard. migration; tool; environment; setup', 1, 'Difficulty in tool change', 'It''s more this initial contact that seems to scare them a little more, it makes them go to others, when they arrive.

The part of actually putting an initial part has this shock of this reality there for the students in which they have to leave a tool that they are already there with the system running and bring it to our tool.', 'The process of making students migrate to other tools it''s hard.', true, 'migration; tool; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (17, 'Initial difficulty using the Docker container tool.', 'the docker, [...] to use, they usually have a greater difficulty in this theme, in the beginning. Initial difficulty using the Docker container tool.  docker; container; tool; technology', 1, 'Difficulty with Docker', 'the docker, [...] to use, they usually have a greater difficulty in this theme, in the beginning.', NULL, true, 'docker; container; tool; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (19, 'The student has difficulty realizing the importance of setting the environment.', 'A challenge that is to convince students to give importance to this... they have this other view, this aspect of the configuration of the environment. The student has difficulty realizing the importance of setting the environment.  environment; setup', 1, 'Difficulty in understanding the importance of setting the environment', 'A challenge that is to convince students to give importance to this... they have this other view, this aspect of the configuration of the environment.', NULL, true, 'environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (22, 'There are a large number of DevOps tools available.

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

It can be also challenging for the, if you have the lab instructor with handling all tools.', 'There is a large number of DevOps tools.', true, 'tool; technology; automation', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (25, 'Difficulty to teach the DevOps culture.

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

Culture is difficult to teach.', 'DevOps culture is hard to teach. ', true, 'culture; mindset; principle; skill; convention; rule; technique; criteria', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (26, 'Students have a prior concept that DevOps is restricted to the use of tools, not being interested in the cultural part of DevOps.

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

Let''s say political challenge that you have to convince in a way that DevOps is not purely technical and that it''s must be part of an academy curriculum.', 'It''s hard to show to students that DevOps is not all about tooling.', true, 'tool; focus', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (28, 'Difficulty dealing with assessments based on a traditional test model.', '[...] in many cases the assessment is still based on the traditional test model or on some fixed assessment process, with an X list of questions or something similar. Difficulty dealing with assessments based on a traditional test model.  traditional; assessment; test; exam; quiz; popular; evaluation; standard; model', 1, 'Difficulty in using assessments with traditional tests', '[...] in many cases the assessment is still based on the traditional test model or on some fixed assessment process, with an X list of questions or something similar.', NULL, true, 'traditional; assessment; test; exam; quiz; popular; evaluation; standard; model', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (29, 'The teaching of devops is multidisciplinary, covering different areas such as development, safety and operation.

There is a very diverse and multidisciplinary knowledge in teaching DevOps.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

You cannot teach DevOps without experiencing DevOps, right? You cannot read in a book and want to teach DevOps because DevOps is a very practical discipline. There is a lot that happens in practice. So, there is a lot of doubt, from concepts, about Kubernetes configuration error, for example. So, these are things that we have to deal with [...] So, venturing out to teach DevOps, parachuting, that is a big challenge because the level of knowledge you will have to collect for this is quite diverse and multidisciplinary. The teaching of devops is multidisciplinary, covering different areas such as development, safety and operation.

There is a very diverse and multidisciplinary knowledge in teaching DevOps. The multidiscuplinary of DevOps is hard to deal with. multidisciplinary; curriculum; syllabus', 2, 'Wide coverage of diverse areas by DevOps teaching.', 'The DevOps concept, it''s very open, right, it encompasses different areas between development, security and operations.

You cannot teach DevOps without experiencing DevOps, right? You cannot read in a book and want to teach DevOps because DevOps is a very practical discipline. There is a lot that happens in practice. So, there is a lot of doubt, from concepts, about Kubernetes configuration error, for example. So, these are things that we have to deal with [...] So, venturing out to teach DevOps, parachuting, that is a big challenge because the level of knowledge you will have to collect for this is quite diverse and multidisciplinary.', 'The multidiscuplinary of DevOps is hard to deal with.', true, 'multidisciplinary; curriculum; syllabus', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (30, 'There is a greater difficulty in understanding devops by students whose background is more academic, who have no experience in software development or direct operation.

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

When you''re talking to freshmen and they have no idea what''s happening. Like they have a superficial idea of what''s happening. Then it''s like finding a way to explain them why the mindset is important.', 'Teach DevOps concepts to students no industrial experience is hard.', true, 'industry; concept; theory', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (31, 'The teacher needs good technical knowledge in the areas of security (especially vulnerability management) and systems development to teach DevSecOps.

Skills to teach DevOps are challeging.', 'DevSecOps [...] is the type of discipline that requires strong knowledge in two areas, both distinct, in the security area, but at the same time in the development area to be able to find the link between the two and then yes, get to what the student.

The second point that the second challenge would be [...] skills.  I''m working on software engineering and I''m working on how to build software since the gate. The teacher needs good technical knowledge in the areas of security (especially vulnerability management) and systems development to teach DevSecOps.

Skills to teach DevOps are challeging. Skills to teach DevOps are challeging. technology; knowledge; skill; teaching; technique; training; preparation', 2, 'Teacher background necessary in DevSecOps teaching: security and development', 'DevSecOps [...] is the type of discipline that requires strong knowledge in two areas, both distinct, in the security area, but at the same time in the development area to be able to find the link between the two and then yes, get to what the student.

The second point that the second challenge would be [...] skills.  I''m working on software engineering and I''m working on how to build software since the gate.', 'Skills to teach DevOps are challeging.', false, 'technology; knowledge; skill; teaching; technique; training; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (32, 'Difficulty in knowing how to deal with groups of students who have very different experiences.

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

Some of them do have a lot of programming and are fairly mature, but because when we recruit, they be coming from different schools.', 'It''s challeging to deal with students having different backgrounds.', false, 'knowledge; level; background; experience; history; skill; technique; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (27, 'Difficulties in remote work with students: privacy, availability, infrastructure differences, environment configuration.', 'As people are remote, basically for training, there are several factors that influence the didactics. The home environment, even, that the person, sometimes, does not live alone, or has sons, daughters. This is not a problem for people, for me, a teacher, as a teacher, but for a person, sometimes, you can''t open a camera. You can''t do one, so dealing with these differences within the pandemic is important. It''s not a problem, but it''s a point of e also the differences from the infrastructure that the person has to take the course. A machine a little newer, older, pre-configured for work, there are companies that already have the machine ready for day to day and the course uses other configurations which are challenges that we have with the students to talk, look, I need version X, and the person does not have the installation permission.
 Difficulties in remote work with students: privacy, availability, infrastructure differences, environment configuration.  remote; strategy; execution', 1, 'Difficulty in remote work with students: privacy, availability, infrastructure difference, environment configuration.', 'As people are remote, basically for training, there are several factors that influence the didactics. The home environment, even, that the person, sometimes, does not live alone, or has sons, daughters. This is not a problem for people, for me, a teacher, as a teacher, but for a person, sometimes, you can''t open a camera. You can''t do one, so dealing with these differences within the pandemic is important. It''s not a problem, but it''s a point of e also the differences from the infrastructure that the person has to take the course. A machine a little newer, older, pre-configured for work, there are companies that already have the machine ready for day to day and the course uses other configurations which are challenges that we have with the students to talk, look, I need version X, and the person does not have the installation permission.
', NULL, true, 'remote; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (33, 'Students find it difficult to configure the tools on their own machines in remote teaching mode.', 'Another challenge too, that [...] we changed our model from in-person to online, live. And then, we had this problem, right, that in the course there is a project, with certain technologies, but, in our case, we already have a laboratory that has everything installed and configured. So, in this case, man, now, it''s the student who''s going to do his homework, right, how is he going to configure the infrastructure with that specific project and without having a headache, it won''t interfere in class. Students find it difficult to configure the tools on their own machines in remote teaching mode.  remote; tool; configuration; technology', 1, 'difficult tools configuration on remote teaching', 'Another challenge too, that [...] we changed our model from in-person to online, live. And then, we had this problem, right, that in the course there is a project, with certain technologies, but, in our case, we already have a laboratory that has everything installed and configured. So, in this case, man, now, it''s the student who''s going to do his homework, right, how is he going to configure the infrastructure with that specific project and without having a headache, it won''t interfere in class.', NULL, false, 'remote; tool; configuration; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (35, 'Difficulty in making the association between theory and practice.

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

There''s a gap between what we can experiment during the course, what can be presented during the invited lecture from the industry, for example, those kinds of things and how, how whole, the things are connected together.', 'It''s challeging to balance DevOps theory and practice.', false, 'theory; practice; culture; tool; concept', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (37, 'Difficulty in understanding environment, tools and network configuration.', 'There''s still this challenge of understanding these tools, environment, network, configuration, you know? So, I think one challenge brings the other, right? I would say this is a challenge, too.
 Difficulty in understanding environment, tools and network configuration.  environment; network; configuration; setup', 1, 'Difficulty in an understanding environment, tools and network configuration.', 'There''s still this challenge of understanding these tools, environment, network, configuration, you know? So, I think one challenge brings the other, right? I would say this is a challenge, too.
', NULL, true, 'environment; network; configuration; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (38, 'There is difficulty for students to carry out the automation of the construction of systems used during the course.', 'When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe you understand all the automations and such, but at the same time I see that the guys have a lot of difficulty in doing it. There is difficulty for students to carry out the automation of the construction of systems used during the course.  build; automation; technology; tool', 1, 'Students with difficulty in automating systems.', 'When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe you understand all the automations and such, but at the same time I see that the guys have a lot of difficulty in doing it.', NULL, false, 'build; automation; technology; tool', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (39, 'Difficulty selecting an example system realistic enough for students to use during the course.

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

The fact that DevOps is not just purely technical, it would be related to the fact that it''s really complicated teach on a given semester because you have, let''s say 13 to 15 weeks, three hours a week, and then you have to go through you can''t address like large, large project because it doesn''t fit in the semester.', 'It''s challeging to find the right sized examples to teach DevOps.', true, 'example; sample; project; activity; task; mission; tool; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (34, 'Devops concepts like configuration management and contaizerization need examples with mininum scale and complexity.

The students can have difficulty understanding the DevOps culture working on a small example.

Small project wasn''t really satisfactory.', 'Doing infrastructure as code or forms of configuration management or containerization, or even the simpler things like treating build scripts as first-class citizens alongside your code, start to not be meaningful until you have code at some minimum scale where there''s a certain minimum complexity, both in terms of construction.

If you give artificial example or small toy example, then it''s just going about configuring small things. So naturally naturally what DevOps is, uh, it''s really complicated to make the students experience a cultural change and those kinds of things, because there''s, well, there''s no culture of, uh, industrial project in a school because it''s academic project or it''s teaching how to behave in a industrial project.

So it was lectures and labs and like a small project, but it was wasn''t really satisfactory. Devops concepts like configuration management and contaizerization need examples with mininum scale and complexity.

The students can have difficulty understanding the DevOps culture working on a small example.

Small project wasn''t really satisfactory. Small examples weren''t really satisfactory. example; sample; project; activity; task; mission; tool; technology', 2, 'small examples not satisfactory.', 'Doing infrastructure as code or forms of configuration management or containerization, or even the simpler things like treating build scripts as first-class citizens alongside your code, start to not be meaningful until you have code at some minimum scale where there''s a certain minimum complexity, both in terms of construction.

If you give artificial example or small toy example, then it''s just going about configuring small things. So naturally naturally what DevOps is, uh, it''s really complicated to make the students experience a cultural change and those kinds of things, because there''s, well, there''s no culture of, uh, industrial project in a school because it''s academic project or it''s teaching how to behave in a industrial project.

So it was lectures and labs and like a small project, but it was wasn''t really satisfactory.', 'Small examples weren''t really satisfactory.', true, 'example; sample; project; activity; task; mission; tool; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (40, 'Lack of time for teachers to develop a ready-made and well-crafted example system.

Lack of time to structure more complex environments with students.', 'So, because then, if I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such, but then we also know that there are challenges, right? Wow, this is not that simple, will I have time to do it, right?

There is no time for, for example, structuring complex environments [...] I know it is not the reality in the market, very few companies I had contact that set up their environment from scratch on the nail, in a set of internal servers. Lack of time for teachers to develop a ready-made and well-crafted example system.

Lack of time to structure more complex environments with students. Lack of time to prepare classes to teach DevOps. time; example; sample; preparation', 2, 'Little time during preparation of a well-designed example system by the teacher with little time ', 'So, because then, if I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such, but then we also know that there are challenges, right? Wow, this is not that simple, will I have time to do it, right?

There is no time for, for example, structuring complex environments [...] I know it is not the reality in the market, very few companies I had contact that set up their environment from scratch on the nail, in a set of internal servers.', 'Lack of time to prepare classes to teach DevOps.', false, 'time; example; sample; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (41, 'Difficulty for teachers to keep up with the state of the art in the industry.

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

So keeping things up to date and making things work like really working in, in, in being able to run the labs, not in panic mode, that everything was fragile and everything was able to collapse at any point was really stressful. And of course, a lot of things, I think it costs me like twice or three times the cost of preparing a regular course.', 'It''s challeging to be up-to-date with industrial DevOps tools.', false, 'state of the art; tool; up-to-date; update; break; change; advance; improvement; pause; evolution; development; progress; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (47, 'The DevOps concepts collaboration, communication and organization are difficult to assess due to the high degree of subjectivity.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate. The DevOps concepts collaboration, communication and organization are difficult to assess due to the high degree of subjectivity.  collaboration; communication; organization; assessment; subjectivity; participation; partnership; conversation; concept; theory; management; evaluation; interaction; discussion', 1, 'Difficulty in subjective DevOps concepts during assessment.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.', NULL, true, 'collaboration; communication; organization; assessment; subjectivity; participation; partnership; conversation; concept; theory; management; evaluation; interaction; discussion', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (42, 'Difficulty supporting the use of several different tools and environments at the same time.

Differences in people''s environments and their hardware configuration cause problems.

Different types of OSs can difficult the flow of environment setup.', '[...] it turned out that a lot of people did it in [...] different environments [...] for us, teacher, often we are not proficient in all of these.

Yeah, so challenges, um, differences in people''s environments, their hardware, for example, every term, you know, if I want people to do something locally with, let''s say, setting up virtual machines or containers or, or whatever, there''s always some buddy who has some strange hardware configuration that causes problems.

We have some students on Mac, some on Linux, some on windows, some have, um, computers that are led by the university. They came up to class with computers, with family version of windows that cannot run Docker because there is no hypervisor in it. Difficulty supporting the use of several different tools and environments at the same time.

Differences in people''s environments and their hardware configuration cause problems.

Different types of OSs can difficult the flow of environment setup. It''s difficult to deal with different hardware and software. tool; environment; hardware; tool; technology', 3, 'Difficulty supporting multiple tools and environments', '[...] it turned out that a lot of people did it in [...] different environments [...] for us, teacher, often we are not proficient in all of these.

Yeah, so challenges, um, differences in people''s environments, their hardware, for example, every term, you know, if I want people to do something locally with, let''s say, setting up virtual machines or containers or, or whatever, there''s always some buddy who has some strange hardware configuration that causes problems.

We have some students on Mac, some on Linux, some on windows, some have, um, computers that are led by the university. They came up to class with computers, with family version of windows that cannot run Docker because there is no hypervisor in it.', 'It''s difficult to deal with different hardware and software.', false, 'tool; environment; hardware; tool; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (43, 'A lot of time preparing the initial environment setup of students.

Lots of work to setup the labs even if you have teacher assistants.

On premises systems for deployment everything is complicated because it requires a lot of maintenance and time.', 'Then the boy will go in a week, he will only have his entire environment set up, right? But, this creates challenges too, right? That it will be difficult to do this and such.

We had to work to do on the labs. ...  the assistant I had two for the labs was too busy with too many things.

That''s really complicated as, um, like as a teacher, uh, then we decided to move for on premises, uh, version with our own, uh, systems for deployment building and everything, uh, another disaster, because then it requires a lot of maintenance and a lot of them, of course, or the students are going to work like in the two days before the room, the, um, the delivery of the project. A lot of time preparing the initial environment setup of students.

Lots of work to setup the labs even if you have teacher assistants.

On premises systems for deployment everything is complicated because it requires a lot of maintenance and time. Prepare the labs environment requires a lot of time. time; lab; environment; setup', 3, 'No time for initial setup of student environment', 'Then the boy will go in a week, he will only have his entire environment set up, right? But, this creates challenges too, right? That it will be difficult to do this and such.

We had to work to do on the labs. ...  the assistant I had two for the labs was too busy with too many things.

That''s really complicated as, um, like as a teacher, uh, then we decided to move for on premises, uh, version with our own, uh, systems for deployment building and everything, uh, another disaster, because then it requires a lot of maintenance and a lot of them, of course, or the students are going to work like in the two days before the room, the, um, the delivery of the project.', 'Prepare the labs environment requires a lot of time.', true, 'time; lab; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (44, 'There is no unified material for teaching DevOps.

There is no complete material to teach DevOps.', 'Material heterogeneity is the biggest challenge. You have to set up a class sewing the fonts, right?

When I started preparing, there was not a buy the book, a kit a suggestion for a course, there for you to start, it is a good start, right? There is no unified material for teaching DevOps.

There is no complete material to teach DevOps. Unknown unified material for teaching DevOps. material; preparation', 2, 'There is no unified material for DevOps teaching.', 'Material heterogeneity is the biggest challenge. You have to set up a class sewing the fonts, right?

When I started preparing, there was not a buy the book, a kit a suggestion for a course, there for you to start, it is a good start, right?', 'Unknown unified material for teaching DevOps.', true, 'material; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (45, 'Difficulty in resuming sufficient and suitable material for class lessons.

It is necessary to use multiple books because they do not cover all concepts.', 'Because you take so many different things that I feel a bit sorry, in quotes, to pass everything on to the students. ... So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such. It would be that, the condensation of everything, let''s say, the centralization of the material in what you produced, right?

I use a couple of books, um, and, uh, as I said, to to be able to own, um, they cover many different topics. And so I tried to use one over, two picks in it. [...] I still think that, uh, the idea scenario would have been able, will have been, to be able to do a situation where I can take several topics in the book and then cover them from the beginning to them. But, uh, I haven''t been able to find that possible yet. Difficulty in resuming sufficient and suitable material for class lessons.

It is necessary to use multiple books because they do not cover all concepts. Difficulty in using multiple materials to create the classes. material; preparation', 2, 'Difficulty in condensing suitable material for classes', 'Because you take so many different things that I feel a bit sorry, in quotes, to pass everything on to the students. ... So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such. It would be that, the condensation of everything, let''s say, the centralization of the material in what you produced, right?

I use a couple of books, um, and, uh, as I said, to to be able to own, um, they cover many different topics. And so I tried to use one over, two picks in it. [...] I still think that, uh, the idea scenario would have been able, will have been, to be able to do a situation where I can take several topics in the book and then cover them from the beginning to them. But, uh, I haven''t been able to find that possible yet.', 'Difficulty in using multiple materials to create the classes.', false, 'material; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (46, 'Students rely heavily on the teacher''s slide material, which is often limited.

The students don''t read the suggested book even if you strongly encourage them.

Students tend to get short free versions and not full versions of books.', 'And sometimes you took a little bit of such a thing, right? Not all that text was relevant, you know? So, your material ends up becoming the only source, let''s put it that way. For students, I''ve already figured that out, like, you know? People studied and such, they went a lot for the material I prepared. When the material I was preparing was, let''s say, it was a set of slides, right? Which doesn''t serve that much, from the point of view, right, from having a more in-depth reading and such. So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such.

There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.
So, all this traceability of what was done to what they are going to do, was the very difficult part [...] So, you can''t think about doing a theoretical thing, you have to have practice, you can''t just to be just practical exercises, it has to have a whole journey, a well-established train of thought. It was quite tricky to get to that topic.

 So part one is the three ways, just give you an overview of the, each of the three way. And then you have one part essentially for each of the three ways. And I think that the first two parts of the book you can find online, but, but not, not as a, someone who puts it in PDF, but from the publisher, from, from revolution, publisher and official version. So you can read it from the way. Students rely heavily on the teacher''s slide material, which is often limited.

The students don''t read the suggested book even if you strongly encourage them.

Students tend to get short free versions and not full versions of books. Students rely on limited material instead of reading books. material; strategy; execution', 2, 'Strong reliance on student-limited support material', 'And sometimes you took a little bit of such a thing, right? Not all that text was relevant, you know? So, your material ends up becoming the only source, let''s put it that way. For students, I''ve already figured that out, like, you know? People studied and such, they went a lot for the material I prepared. When the material I was preparing was, let''s say, it was a set of slides, right? Which doesn''t serve that much, from the point of view, right, from having a more in-depth reading and such. So, I think it''s a difficulty, from the point of view, like, the pedagogical type of setting up the classes and such.

There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.
So, all this traceability of what was done to what they are going to do, was the very difficult part [...] So, you can''t think about doing a theoretical thing, you have to have practice, you can''t just to be just practical exercises, it has to have a whole journey, a well-established train of thought. It was quite tricky to get to that topic.

 So part one is the three ways, just give you an overview of the, each of the three way. And then you have one part essentially for each of the three ways. And I think that the first two parts of the book you can find online, but, but not, not as a, someone who puts it in PDF, but from the publisher, from, from revolution, publisher and official version. So you can read it from the way.', 'Students rely on limited material instead of reading books.', false, 'material; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (48, 'Difficulty in structuring the learning journey.

Difficulty to create a teaching plan, especially connecting the covered subjects.', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.

The teaching plan, where I am going to start, where I am going to go, what is next. So, structuring this sequence of subjects to be covered, of how you are going to connect the subjects, which is the hardest part. Difficulty in structuring the learning journey.

Difficulty to create a teaching plan, especially connecting the covered subjects. Difficulty in structuring the learning journey. teaching; planning; concept; syllabus; theory; training; learning; preparation; curriculum', 1, 'Difficulty in structuring the learning journey', 'There are concepts of collaboration, communication, organization that are a little subjective, right? So, it''s a little harder for you to evaluate.

The teaching plan, where I am going to start, where I am going to go, what is next. So, structuring this sequence of subjects to be covered, of how you are going to connect the subjects, which is the hardest part.', 'Difficulty in structuring the learning journey.', false, 'teaching; planning; concept; syllabus; theory; training; learning; preparation; curriculum', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (49, 'Large class assessment requires great effort.', 'team of monitors [...] If you don''t have it, it gets heavier, it''s more difficult, you alone evaluate. Take a class with forty students, even if you divide it into teams, it''s a lot for you to evaluate. Large class assessment requires great effort.  class; assessment; evaluation', 1, 'Requirement of great effort during assessment of large classes', 'team of monitors [...] If you don''t have it, it gets heavier, it''s more difficult, you alone evaluate. Take a class with forty students, even if you divide it into teams, it''s a lot for you to evaluate.', NULL, false, 'class; assessment; evaluation', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (50, 'Difficulty in setting up classes without a prior reference ones.

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

If you want to teach devops, it''s really difficult to find, uh, supports, like finding a way to understand how it''s towards elsewhere. It''s really complicated because there''s not a lot, of course that grant themselves as DevOps, basically because it''s often hidden because it''s something technical you''re not supposed to teach.', 'It is difficult to create a DevOps course without a previous reference ones.', false, 'reference; support; class; resource; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (51, 'Rapid and constant changes in DevOps make it difficult to create a teaching plan.', 'This teaching plan is not and should not be completed, right? He doesn''t have it, he''s never ready. ... Things change too fast, the focus changes too fast. Rapid and constant changes in DevOps make it difficult to create a teaching plan.  teaching; planning; change; training; update; advance; organization; change; improvement; evolution; curriculum; syllabus; schedule; progress', 1, 'Challenge during the creation of the teaching plan related to rapid and constant changes in DevOps  ', 'This teaching plan is not and should not be completed, right? He doesn''t have it, he''s never ready. ... Things change too fast, the focus changes too fast.', NULL, true, 'teaching; planning; change; training; update; advance; organization; change; improvement; evolution; curriculum; syllabus; schedule; progress', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (52, 'Difficulty in linking DevOps classes with other subjects of interest to students.', 'DevOps ends up forcing you to tap into a lot of other universes, right? Especially if you go into project as an evaluation method. So, that''s another big challenge, you keep an eye out for what''s going on, which can be correlated and which you can bring as an open scope to be worked also in the discipline, with this type of direction. Which in my case, comes AI student, Bank student, Software Engineering student, pay for the post, and that then you can''t just stay in the context of developing software, delivering software on DevOps, right? There''s a whole other context of things related, for example, to operation, infrastructure analysis, learning, prediction, and so on. Difficulty in linking DevOps classes with other subjects of interest to students.  linking; subject; class', 1, 'Difficulty related to linking DevOps with other disciplines', 'DevOps ends up forcing you to tap into a lot of other universes, right? Especially if you go into project as an evaluation method. So, that''s another big challenge, you keep an eye out for what''s going on, which can be correlated and which you can bring as an open scope to be worked also in the discipline, with this type of direction. Which in my case, comes AI student, Bank student, Software Engineering student, pay for the post, and that then you can''t just stay in the context of developing software, delivering software on DevOps, right? There''s a whole other context of things related, for example, to operation, infrastructure analysis, learning, prediction, and so on.', NULL, true, 'linking; subject; class', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (53, 'Environment set up in a cloud service cost money.', 'There are several environments in the cloud, but they all cost money. Environment set up in a cloud service cost money.  cloud; environment; setup', 1, 'Environment set up in a cloud service cost money.', 'There are several environments in the cloud, but they all cost money.', NULL, false, 'cloud; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (54, 'VirtualBox has limitation in MacOS.', ' However, last semester eight of my students showed up with apple, M one Silicon Macs and they don''t run VirtualBox because VirtualBox only runs on Intel. It''s not an emulator. It is a virtualizing layer, right? It needs an Intel CPU in order to virtualize. Um, and so I had to change the class for them to use Docker and VirtualBox.  VirtualBox has limitation in MacOS.  virtualbox; virtualization; tool; technology', 1, 'limitation of VirtualBox', ' However, last semester eight of my students showed up with apple, M one Silicon Macs and they don''t run VirtualBox because VirtualBox only runs on Intel. It''s not an emulator. It is a virtualizing layer, right? It needs an Intel CPU in order to virtualize. Um, and so I had to change the class for them to use Docker and VirtualBox. ', NULL, false, 'virtualbox; virtualization; tool; technology', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (55, 'You have to find a set of tools that work together.

For many people, getting all technologies to work together can be particularly challenging.', 'You have to find a set of tools that work together.

 For many people, getting them all to work together can be particularly challenging. You have to find a set of tools that work together.

For many people, getting all technologies to work together can be particularly challenging. Getting all DevOps tools to work together is challenging. tool; technology; integration; tool; technology; automation; combination', 2, 'Challenge of integration of all DevOps tools together ', 'You have to find a set of tools that work together.

 For many people, getting them all to work together can be particularly challenging.', 'Getting all DevOps tools to work together is challenging.', true, 'tool; technology; integration; tool; technology; automation; combination', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (56, 'It is difficult to students learning agile techniques like pair programming.

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

How do you work in sprints? ', 'It is difficult to teach agile techniques.', false, 'agile; pair programming; spring; minimum viable product; mvp', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (57, 'It is challeging to verify if the students learn the devops process of working.', 'Are they following the process? Not, did they get the work done in the end? That''s not the important part is did they learn the process and follow it? And did they learn from it? So that''s, it''s kind of challenging. It is challeging to verify if the students learn the devops process of working.  assessment; process; technique; evaluation', 1, 'difficulty in the evaluation of students learn level', 'Are they following the process? Not, did they get the work done in the end? That''s not the important part is did they learn the process and follow it? And did they learn from it? So that''s, it''s kind of challenging.', NULL, true, 'assessment; process; technique; evaluation', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (58, 'Doing a hands-on class with that many (45) students is just physically challenging.', 'Doing a hands-on class with that many (45) students is just physically challenging. Doing a hands-on class with that many (45) students is just physically challenging.  hands-on; lab; strategy; execution', 1, 'Difficulty in hands-on classes with 45 or more students', 'Doing a hands-on class with that many (45) students is just physically challenging.', NULL, false, 'hands-on; lab; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (59, 'Teach operational activities is ignored because it is hard.', 'You have a clean compile, you''ve tested your code and it meets the functional requirements. And that''s the end of the story. But as we know, you know, even from software development,[...] it doesn''t end once the software is built and once it''s passed testing, then it goes into this entire operational stage. We tend to ignore it. And I don''t think we ignore it deliberately. We ignore it because it''s hard Teach operational activities is ignored because it is hard.  operation; activity; environment; setup', 1, 'operational activities ignored', 'You have a clean compile, you''ve tested your code and it meets the functional requirements. And that''s the end of the story. But as we know, you know, even from software development,[...] it doesn''t end once the software is built and once it''s passed testing, then it goes into this entire operational stage. We tend to ignore it. And I don''t think we ignore it deliberately. We ignore it because it''s hard', NULL, true, 'operation; activity; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (60, 'Many devops concepts need to be taught.', 'That is a lot of the devops principles that come into play.  Many devops concepts need to be taught.  concept; theory', 1, 'many devops concepts', 'That is a lot of the devops principles that come into play. ', NULL, true, 'concept; theory', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (61, 'It is very dangerous to teach too many tools because it conveys that DevOps is a very technology centric approach.', 'It is very dangerous to teach too many tools because it''s simply conveys that it is a very technology centric approach. It is very dangerous to teach too many tools because it conveys that DevOps is a very technology centric approach.  tool; technology; automation', 1, 'Dangerous of teaching too many tools', 'It is very dangerous to teach too many tools because it''s simply conveys that it is a very technology centric approach.', NULL, true, 'tool; technology; automation', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (62, 'Students are not at a level in the their companies where they can introduce DevOps mindset.', 'A lot of the folks who are attending the course are not at a level in the organization where they can actually affect culture [...] they are usually technologists and so they can very easily understand how they can affect things like technology decisions and the application of technology. But many of them are not, let''s say at manager or director or senior director VP levels or things like that will, they can actually affect more senior levels of challenge there. Students are not at a level in the their companies where they can introduce DevOps mindset.  industry; mindset; knowledge; level; hierarchy', 1, 'DevOps students without sufficient level at their companies', 'A lot of the folks who are attending the course are not at a level in the organization where they can actually affect culture [...] they are usually technologists and so they can very easily understand how they can affect things like technology decisions and the application of technology. But many of them are not, let''s say at manager or director or senior director VP levels or things like that will, they can actually affect more senior levels of challenge there.', NULL, true, 'industry; mindset; knowledge; level; hierarchy', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (63, 'It is hard to find strategies from industry unless if it written in a paper.', 'It can be a little harder garner garnering some of that same thing from, from industry, you know, unless you happen to find reasonably wit reasonably written, uh, white papers or, or things along those lines. It is hard to find strategies from industry unless if it written in a paper.  industry; strategy; material; paper; report; preparation; approach; scenario; story', 1, 'few industry strategies unless papers', 'It can be a little harder garner garnering some of that same thing from, from industry, you know, unless you happen to find reasonably wit reasonably written, uh, white papers or, or things along those lines.', NULL, false, 'industry; strategy; material; paper; report; preparation; approach; scenario; story', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (64, 'Task done by students do not means that students learned correctly.', 'I have tended to get much more forgiving on how I, for example, grade this particular course, I used to be one of those folks. You know, you, you do the assignment and then you get a grade for the assignment. And at the end of the day, and this is not just devops it''s it''s for other courses as well. At the end of the day, I''m way more concerned. They''re able to get stuff working and that you understand why we''re doing it. Task done by students do not means that students learned correctly.  task; learning; assessment; mission; evaluation', 1, 'Without correlation between task done and learned correctly', 'I have tended to get much more forgiving on how I, for example, grade this particular course, I used to be one of those folks. You know, you, you do the assignment and then you get a grade for the assignment. And at the end of the day, and this is not just devops it''s it''s for other courses as well. At the end of the day, I''m way more concerned. They''re able to get stuff working and that you understand why we''re doing it.', NULL, false, 'task; learning; assessment; mission; evaluation', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (65, 'It is difficult for students to understand the importance the software running in production, not just compiling.', 'The challenge of course, is newer students obviously have more than enough to worry about just getting code wrong and compile. Uh, but that''s, that''s the reality, unfortunately, is the code just doesn''t run a compile on a laptop, right? It runs out in production and it''s serving real people. And in this day and age, there is, there is stuff that goes with that. And the more folks understand, at least some of the sooner, the better I hope the software will be. It is difficult for students to understand the importance the software running in production, not just compiling.  production; running; software; understanding', 1, 'difficulty for understand the importance of a correct software over just compiling', 'The challenge of course, is newer students obviously have more than enough to worry about just getting code wrong and compile. Uh, but that''s, that''s the reality, unfortunately, is the code just doesn''t run a compile on a laptop, right? It runs out in production and it''s serving real people. And in this day and age, there is, there is stuff that goes with that. And the more folks understand, at least some of the sooner, the better I hope the software will be.', NULL, false, 'production; running; software; understanding', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (66, 'When you start teaching DevOps, it doesn''t look relevant.

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

An undergrad program, it''s also something complicated because it''s teaching at the undergrad program might make sense, but then it''s other kinds of challenges like younger students who might not be interested in this.', 'DevOps course doesn''t look relevant for undergratuate students when you start teaching.', true, 'motivation; mindset; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (67, 'You need a lot of interconnected machines running different services with visibility on each other to do continous deployment.', 'When you do continuous integration, you need to have a logical base. You need to have a lot of people committing in the code changes often. Um, you need to have a lot of machines. You have the machines where people are coding. You have the machines that are building, you have the machines that are the way you run your database. You have the machines where you deploy to. ... you need a lot of machines interconnected, um, with visibility on each other that they can get to. You need a lot of interconnected machines running different services with visibility on each other to do continous deployment.  continuous deployment; service; integration; interconnection; cd; environment; setup; gradual; combination; continuous deployment', 1, 'Continous deployment require a lot of interconnected machines running different services with visibility to each other', 'When you do continuous integration, you need to have a logical base. You need to have a lot of people committing in the code changes often. Um, you need to have a lot of machines. You have the machines where people are coding. You have the machines that are building, you have the machines that are the way you run your database. You have the machines where you deploy to. ... you need a lot of machines interconnected, um, with visibility on each other that they can get to.', NULL, true, 'continuous deployment; service; integration; interconnection; cd; environment; setup; gradual; combination; continuous deployment', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (68, 'It''s hard to supervise students'' work when you use a lot of virtual machines.', 'Uh, so that''s a practical challenge that when you want to put it in place, and as a teacher, you want to be able to log into all of those machines to see what they''re doing. It''s hard to supervise students'' work when you use a lot of virtual machines.  virtual machine; vm; supervision; monitoring; strategy; execution', 1, 'difficulty in the supervision of students work with a lot of virtual machines', 'Uh, so that''s a practical challenge that when you want to put it in place, and as a teacher, you want to be able to log into all of those machines to see what they''re doing.', NULL, false, 'virtual machine; vm; supervision; monitoring; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (69, 'It''s hard for students to see the values of deployment side and they don''t want to do operational activities.', 'It''s hard for them to see all the values, layers of source side, real shoes, deployment side. They have a tendency because the students write code clicky works done, right? And it''s hard to teach them that no wanting code somewhere. It''s hard for students to see the values of deployment side and they don''t want to do operational activities.  deployment; understanding; operation', 1, 'difficulty in students understanding about deployment side without the knowledge of operational activities', 'It''s hard for them to see all the values, layers of source side, real shoes, deployment side. They have a tendency because the students write code clicky works done, right? And it''s hard to teach them that no wanting code somewhere.', NULL, true, 'deployment; understanding; operation', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (70, 'It is hard to prepare a robust and simple technology stack.', 'What is hard is to be prepared with, um, a technology stack that is robust and simple or very simple so that you know exactly what you look when you help them debug. It is hard to prepare a robust and simple technology stack.  technology; stack; automation; tool', 1, 'Hard preparation of simple and robust technologies', 'What is hard is to be prepared with, um, a technology stack that is robust and simple or very simple so that you know exactly what you look when you help them debug.', NULL, false, 'technology; stack; automation; tool', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (71, 'The preparation of the exercise is demanding.

It is laborious to prepare the exercise that the students will work.', 'It''s mostly the preparation of the exercise that is demanding.

That''s one of the challenge that I find in preparing proper courses, finding and implementing an application, creating some issues in it, some bugs in it. The preparation of the exercise is demanding.

It is laborious to prepare the exercise that the students will work. The preparation of the exercise is demanding. exercise; preparation', 2, 'laborious exercise preparation', 'It''s mostly the preparation of the exercise that is demanding.

That''s one of the challenge that I find in preparing proper courses, finding and implementing an application, creating some issues in it, some bugs in it.', 'The preparation of the exercise is demanding.', true, 'exercise; preparation', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (72, 'Teach DevOps requires much knowledge from the professor who could not be familiar with it.', 'Um, but then the preparation for the class itself was a concept class. That''s, I''ve done that. Um, and then adjust, but it''s no more difficult than any other class. It depends what you know, and what you do as a job. Right? And that''s part of my job to do it. So I feel comfortable Teach DevOps requires much knowledge from the professor who could not be familiar with it.  knowledge; level; teaching; training; preparation; learning', 1, 'requirement of teaching a lot of DevOps knowledge from the professor perspective', 'Um, but then the preparation for the class itself was a concept class. That''s, I''ve done that. Um, and then adjust, but it''s no more difficult than any other class. It depends what you know, and what you do as a job. Right? And that''s part of my job to do it. So I feel comfortable', NULL, true, 'knowledge; level; teaching; training; preparation; learning', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (73, 'It is arduous to analyse the code and run scripts for each project.', 'I check out the code of every group. And I look at the commits who has done what I look at. How has it been coded, easy to blatant copy paste of somebody else''s code? Is it innovative? I run all the scripts. I ask them to provide me with scripts that are portable, that will run on my computer. Um, and there has to be a bill script or run script, uh, scenario, script, et cetera. And I run them on my computer. It takes four it''s very long. Uh, but it''s an effective way of checking what they''ve done. It is arduous to analyse the code and run scripts for each project.  coding; script; project; analyse; assessment; activity; task; evaluation; exercise', 1, 'arduous analysis for each project', 'I check out the code of every group. And I look at the commits who has done what I look at. How has it been coded, easy to blatant copy paste of somebody else''s code? Is it innovative? I run all the scripts. I ask them to provide me with scripts that are portable, that will run on my computer. Um, and there has to be a bill script or run script, uh, scenario, script, et cetera. And I run them on my computer. It takes four it''s very long. Uh, but it''s an effective way of checking what they''ve done.', NULL, false, 'coding; script; project; analyse; assessment; activity; task; evaluation; exercise', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (74, 'They don''t have time to practice on Kubernetes because it is lot of work.', 'We show them Kubernetes, um, but they don''t really have time to practice on Kubernetes. They don''t have time to practice on Kubernetes because it is lot of work.  time; practice; kubernetes; curriculum; syllabus; schedule', 1, 'without time to practice Kubernetes', 'We show them Kubernetes, um, but they don''t really have time to practice on Kubernetes.', NULL, true, 'time; practice; kubernetes; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (75, 'There is a limitation of what is appropriate to ask the students because they are doing a lot of other activities.', 'And as I said, we, students are doing other things. So this means we are limited in what we can ask them. There is a limitation of what is appropriate to ask the students because they are doing a lot of other activities.  activity; limitation; time; exercise; task; restriction; mission; strategy; execution', 1, 'limitation of about professor´s asks due many activities', 'And as I said, we, students are doing other things. So this means we are limited in what we can ask them.', NULL, false, 'activity; limitation; time; exercise; task; restriction; mission; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (76, 'Make a DevOps course attractive to the students is challenging.

Make the lectures attractive is difficult.', 'For us as educators, we need to find a way where we can make it interesting.

You can make the lectures more interactive, but to make the lecture attractive students have to willing to interact. Right. Which is very difficult to do. Make a DevOps course attractive to the students is challenging.

Make the lectures attractive is difficult. Make a DevOps course attractive to the students is challenging. lecture; motivation; course', 2, 'Challenge of creation of an attractive DevOps course', 'For us as educators, we need to find a way where we can make it interesting.

You can make the lectures more interactive, but to make the lecture attractive students have to willing to interact. Right. Which is very difficult to do.', 'Make a DevOps course attractive to the students is challenging.', true, 'lecture; motivation; course', 'class preparation');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (77, 'There is no convention as to what are the main DevOps concepts that should be taught.

It''s difficult to decide what will be taught in a DevOps course.

Hard to decide whether to teach telemetry or not.', 'The biggest challenge is this, like, what goes in, you know? People do lots of things in the DevOps Pipeline these days, which doesn''t necessarily go into a DevOps course, right?

I would say at the end of the fall, or maybe at the beginning of 2019, we started to plan this course. And for the longest time I was really questioning myself. Like, what do you teach in a DevOps course?

Now we''re questioning ourselves. What else did we bring in? We may add some things about a bit of telemetry. So they have a bit of telemetry because they have lives, but we put some emphasis on it. There is no convention as to what are the main DevOps concepts that should be taught.

It''s difficult to decide what will be taught in a DevOps course.

Hard to decide whether to teach telemetry or not. There is no convention as to what are the main DevOps concepts that should be taught. convention; curriculum; concept; telemetry; theory; principle; criteria; standard; syllabus; model', 2, 'no convention about DevOps course curriculum', 'The biggest challenge is this, like, what goes in, you know? People do lots of things in the DevOps Pipeline these days, which doesn''t necessarily go into a DevOps course, right?

I would say at the end of the fall, or maybe at the beginning of 2019, we started to plan this course. And for the longest time I was really questioning myself. Like, what do you teach in a DevOps course?

Now we''re questioning ourselves. What else did we bring in? We may add some things about a bit of telemetry. So they have a bit of telemetry because they have lives, but we put some emphasis on it.', 'There is no convention as to what are the main DevOps concepts that should be taught.', true, 'convention; curriculum; concept; telemetry; theory; principle; criteria; standard; syllabus; model', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (78, 'It''s hard to make clear to students and make them understand the fact that technologies will change with time, but the fundamentals will remain.', 'The, the overall context will change the process they use will have to change, to adapt, to become better, to, to stay at the top too, you know, they have to, so they have to recognize first that technologies will change, but the foundation, the fundamentals will remain, It''s hard to make clear to students and make them understand the fact that technologies will change with time, but the fundamentals will remain.  concept; mindset; tool; technology; understanding; theory', 1, 'Students'' understanding of the importance of DevOps concepts over the tools', 'The, the overall context will change the process they use will have to change, to adapt, to become better, to, to stay at the top too, you know, they have to, so they have to recognize first that technologies will change, but the foundation, the fundamentals will remain,', NULL, false, 'concept; mindset; tool; technology; understanding; theory', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (79, 'It''s difficult to use Jira lifecycle management tool because of its licence model.', 'JIRA is quite difficult to use in industry context, um, just because of the license model then. So it''s, it''s too complex. It''s difficult to use Jira lifecycle management tool because of its licence model.  jira; licence; management; tool; technology; automation; organization', 1, 'arduous manage of Jira lifecycles licence', 'JIRA is quite difficult to use in industry context, um, just because of the license model then. So it''s, it''s too complex.', NULL, false, 'jira; licence; management; tool; technology; automation; organization', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (80, 'It''s hard to find something students can relate to, from a environment point of view.', 'So one of the challenge from an environment point of view is to get something that students can relate to. It''s hard to find something students can relate to, from a environment point of view.  environment; relation; strategy; execution', 1, 'difficulty students in relationship with an environment point of view', 'So one of the challenge from an environment point of view is to get something that students can relate to.', NULL, false, 'environment; relation; strategy; execution', 'strategies in course execution');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (81, 'There is a lack between what the industry wants from students about DevOps and what the university teaches.', 'We hear from our industrial partners and from industry in general is there''s this HUGE gap right? Between what the industry needs and what university provides. There is a lack between what the industry wants from students about DevOps and what the university teaches.  industry; university; concept; curriculum; academy; syllabus', 1, 'difference between industry desire about student knowledge of DevOps and DevOps academic teaching', 'We hear from our industrial partners and from industry in general is there''s this HUGE gap right? Between what the industry needs and what university provides.', NULL, true, 'industry; university; concept; curriculum; academy; syllabus', 'curriculum');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (82, 'Katacoda does not work for some specific tools.', 'It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website. Katacoda does not work for some specific tools.  katacoda; tool; technology; automation', 1, 'spacific tools do not woth with katacoda', 'It didn''t work for some specific tools that they wanted to present using this a katacoda, uh, website.', NULL, false, 'katacoda; tool; technology; automation', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (83, 'It was hard to have the same criteria and metric for scoring different students because they were free to use any technology and present it.', 'Since the students were free to use any technology and present it ...  it was hard to stay as objective as possible and to have, uh, have the same criteria and metric for, uh, scoring different students, because someone was working on this project, someone was working on that project. It was hard to have the same criteria and metric for scoring different students because they were free to use any technology and present it.  criteria; metric; score; assessment; freedom; technology; stack; flexibility; tool; automation; evaluation; standard; grade', 1, 'challenging evaluation with the same criteria a classroom with different technologies', 'Since the students were free to use any technology and present it ...  it was hard to stay as objective as possible and to have, uh, have the same criteria and metric for, uh, scoring different students, because someone was working on this project, someone was working on that project.', NULL, false, 'criteria; metric; score; assessment; freedom; technology; stack; flexibility; tool; automation; evaluation; standard; grade', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (84, 'The students wouldn''t get the score if they had contributed to some open source project that the developers didn''t merge on github.', 'It was a bit risk because if they had contributed to something that, uh, that the developers didn''t merge they wouldn''t get, uh, get the score. The students wouldn''t get the score if they had contributed to some open source project that the developers didn''t merge on github.  score; open source; project; merge; github; assessment; activity; task; mission; evaluation; exercise; grade', 1, 'student scores based on Github commit approval', 'It was a bit risk because if they had contributed to something that, uh, that the developers didn''t merge they wouldn''t get, uh, get the score.', NULL, false, 'score; open source; project; merge; github; assessment; activity; task; mission; evaluation; exercise; grade', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (85, 'It is difficult to students understand how the pipeline deployment works and not just running it.', 'How this practitioner really works, because if you''re not doing this, then you will stay at a very technical level. Like you deploy a pipeline and you''re doing DevOps, which is absolutely not the case. And that''s absolutely not the, uh, understanding of what DevOps is. It is difficult to students understand how the pipeline deployment works and not just running it.  pipeline; deployment; understanding; running', 1, 'how pipeline deployment works', 'How this practitioner really works, because if you''re not doing this, then you will stay at a very technical level. Like you deploy a pipeline and you''re doing DevOps, which is absolutely not the case. And that''s absolutely not the, uh, understanding of what DevOps is.', NULL, true, 'pipeline; deployment; understanding; running', 'devops concepts');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (86, 'Using remote services is really complicated to debug because you don''t have the access on the what''s happening.

Debugging lab sessions are frustating.', 'We try to use, um, like remote services to relieve the burden of setup saying that, okay, you''re going to use Jenkins on the cloud. Then you''re going to use, we have this partnership with IBM. So we''re using to use the bluemix platform from, uh, IBM that was supporting this kind of thing, um, disaster, because in the end it was really complicated to debug what was happening because you don''t have the access go on the what''s happening.

I think that that''s one of the course that costed me the most in terms of, uh, frustrating time I''ve spent, uh, debugging lab sessions,  Using remote services is really complicated to debug because you don''t have the access on the what''s happening.

Debugging lab sessions are frustating. Debugging lab sessions are very difficult. debug; lab; remote; service; environment; setup', 1, 'difficulty in debugging of lab sessions', 'We try to use, um, like remote services to relieve the burden of setup saying that, okay, you''re going to use Jenkins on the cloud. Then you''re going to use, we have this partnership with IBM. So we''re using to use the bluemix platform from, uh, IBM that was supporting this kind of thing, um, disaster, because in the end it was really complicated to debug what was happening because you don''t have the access go on the what''s happening.

I think that that''s one of the course that costed me the most in terms of, uh, frustrating time I''ve spent, uh, debugging lab sessions, ', 'Debugging lab sessions are very difficult.', true, 'debug; lab; remote; service; environment; setup', 'environment setup');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (87, 'Bamboo continuous integration does not work with 120 students running pipeline at the same time.', 'Your Bamboo continuous to, uh, integration will just collapse because there''s way too much students. My cohorts were 120 students a year. So when you have 120 students who all try to start their pipeline at the very same time, uh, in the last two days, and it''s just a catastrophe and I mean, this thing will always happen. Bamboo continuous integration does not work with 120 students running pipeline at the same time.  bamboo; continuous integration; pipeline; tool; technology; automation; gradual; ci', 1, 'problems with a lot of pipelines in Bambo', 'Your Bamboo continuous to, uh, integration will just collapse because there''s way too much students. My cohorts were 120 students a year. So when you have 120 students who all try to start their pipeline at the very same time, uh, in the last two days, and it''s just a catastrophe and I mean, this thing will always happen.', NULL, true, 'bamboo; continuous integration; pipeline; tool; technology; automation; gradual; ci', 'tool / technology');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (88, 'It is really difficult to quantitative grade scale on the description and the justification of case studies.', 'He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way. It''s, it''s, it''s really difficult to be quantitative and to have this, uh, uh, grade scale that is by the, uh, by the point. It is really difficult to quantitative grade scale on the description and the justification of case studies.  grade; scale; quantitative; case study; justification; assessment; answer; solution; evaluation; score; description; demonstration', 1, 'quantitative grade scale on description and case study', 'He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way. It''s, it''s, it''s really difficult to be quantitative and to have this, uh, uh, grade scale that is by the, uh, by the point.', NULL, false, 'grade; scale; quantitative; case study; justification; assessment; answer; solution; evaluation; score; description; demonstration', 'assessment');
INSERT INTO public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (90, 'There is no consensus if DevOps course should be mandatory or optional.', 'Like, do you have to go through this course to if you''re doing a master or a bachelor in software engineering, is it mandatory to go through DevOps or is it like an option that an optional path that you''re following is this kind of, uh, there is no consensus on, on those kinds of, um, uh, things. There is no consensus if DevOps course should be mandatory or optional.  mandatory; optional; course; curriculum; syllabus; prerequisite; requisite', 1, 'no consensual about DevOps discipline mandatory', 'Like, do you have to go through this course to if you''re doing a master or a bachelor in software engineering, is it mandatory to go through DevOps or is it like an option that an optional path that you''re following is this kind of, uh, there is no consensus on, on those kinds of, um, uh, things.', NULL, true, 'mandatory; optional; course; curriculum; syllabus; prerequisite; requisite', 'curriculum');


--
-- TOC entry 3375 (class 0 OID 16588)
-- Dependencies: 219
-- Data for Name: challenge_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 168);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 176);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 23);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 112);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 142);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 310);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (1, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (2, 62);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (2, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (2, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (2, 150);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (3, 140);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (3, 281);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (3, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (3, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (4, 48);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (4, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (4, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (6, 344);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (6, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (6, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (7, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (7, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (7, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (8, 355);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (8, 64);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (8, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (8, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (8, 292);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 367);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 2);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 153);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 284);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 179);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (9, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (10, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (10, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (10, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (10, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 295);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 364);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 152);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 62);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (11, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 182);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 190);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 32);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 263);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (12, 280);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 255);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 269);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 291);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 111);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (13, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 117);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 34);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 341);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 36);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 67);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 40);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 12);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 233);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 134);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (14, 13);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 67);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 40);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 134);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (15, 68);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (16, 197);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (16, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (16, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (16, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (17, 98);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (17, 63);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (17, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (17, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (19, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (19, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (22, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (22, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (22, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 78);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 198);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 249);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 310);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 72);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 285);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (25, 75);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (26, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (26, 121);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 359);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 353);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 108);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 268);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 242);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 325);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (28, 203);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (29, 208);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (29, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (29, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (30, 149);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (30, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (30, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 168);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 310);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 346);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 360);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (31, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 168);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 176);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 23);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 112);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 142);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 310);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (32, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (27, 274);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (27, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (27, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (33, 274);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (33, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (33, 62);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (33, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (35, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (35, 245);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (35, 78);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (35, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (35, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 274);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 55);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 73);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 155);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 95);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (36, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (37, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (37, 213);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (37, 62);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (37, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (38, 36);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (38, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (38, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (38, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 109);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 287);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 259);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 201);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (39, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 109);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 287);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 259);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 201);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (34, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (40, 355);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (40, 109);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (40, 287);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (40, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 327);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 368);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 369);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 34);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 42);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 6);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 146);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 233);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 107);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 91);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 258);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (41, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (42, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (42, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (42, 140);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (42, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (43, 355);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (43, 170);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (43, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (43, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (44, 190);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (44, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (45, 190);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (45, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (46, 190);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (46, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (46, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 52);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 55);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 226);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 336);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 230);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 232);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 73);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 184);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (47, 155);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 346);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 240);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 360);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 173);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (48, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (49, 46);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (49, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (49, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (50, 271);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (50, 338);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (50, 46);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (50, 281);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (50, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 346);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 240);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 42);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 360);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 369);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 6);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 226);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 146);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 107);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (51, 292);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (52, 180);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (52, 335);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (52, 46);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (53, 48);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (53, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (53, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (54, 377);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (54, 378);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (54, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (54, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (55, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (55, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (55, 154);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (55, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (55, 53);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (56, 7);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (56, 228);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (56, 319);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (56, 200);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (56, 211);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (57, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (57, 252);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (57, 349);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (57, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (58, 139);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (58, 170);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (58, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (58, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (59, 221);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (59, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (59, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (59, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (60, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (60, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (61, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (61, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (61, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (62, 149);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (62, 198);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (62, 168);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (62, 176);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (62, 141);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 149);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 190);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 229);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 275);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 13);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 291);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (63, 328);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (64, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (64, 173);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (64, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (64, 201);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (64, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (65, 254);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (65, 286);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (65, 313);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (65, 365);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (66, 207);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (66, 198);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (66, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (66, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 68);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 301);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 154);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 156);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 40);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 134);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (67, 53);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 376);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 379);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 337);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 206);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (68, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (69, 89);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (69, 365);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (69, 221);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (70, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (70, 322);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (70, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (70, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (71, 111);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (71, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 168);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 176);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 346);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 360);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 246);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (72, 173);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 51);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 295);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 259);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 9);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (73, 111);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 355);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 245);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 169);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (74, 292);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 179);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 355);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 111);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 284);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 201);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (75, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (76, 175);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (76, 207);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (76, 74);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 72);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 351);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 249);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 75);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 325);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (77, 203);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 198);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 365);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (78, 354);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 162);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 177);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 184);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (79, 226);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (80, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (80, 272);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (80, 329);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (80, 110);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 149);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 367);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 60);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 2);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (81, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (82, 167);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (82, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (82, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (82, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 75);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 196);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 294);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 123);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 322);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 119);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 325);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (83, 132);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 294);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 220);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 259);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 193);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 127);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 4);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 343);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 201);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 111);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (84, 132);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (85, 239);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (85, 89);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (85, 365);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (85, 286);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 83);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 170);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 274);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 301);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 104);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (86, 303);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 26);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 70);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 239);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 356);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 350);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 21);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 134);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (87, 44);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 132);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 290);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 266);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 39);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 164);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 18);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 11);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 314);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 106);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 294);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 90);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (88, 88);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 185);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 224);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 74);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 79);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 340);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 247);
INSERT INTO public.challenge_tag (challenge, tag) VALUES (90, 279);


--
-- TOC entry 3376 (class 0 OID 16593)
-- Dependencies: 220
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link (challenge, recommendation) VALUES (1, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (1, 11);
INSERT INTO public.link (challenge, recommendation) VALUES (1, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (1, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (1, 121);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 1);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (2, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 1);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 44);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (3, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (4, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 4);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 32);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 96);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (6, 137);
INSERT INTO public.link (challenge, recommendation) VALUES (7, 7);
INSERT INTO public.link (challenge, recommendation) VALUES (7, 8);
INSERT INTO public.link (challenge, recommendation) VALUES (7, 191);
INSERT INTO public.link (challenge, recommendation) VALUES (7, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 11);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 10);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 16);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 20);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 87);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 49);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 82);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 90);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 105);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 44);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 38);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 121);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 143);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 172);
INSERT INTO public.link (challenge, recommendation) VALUES (8, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 1);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (9, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 8);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 45);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (10, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (11, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 4);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 10);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 176);
INSERT INTO public.link (challenge, recommendation) VALUES (12, 177);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 22);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 23);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 14);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 69);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 88);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 110);
INSERT INTO public.link (challenge, recommendation) VALUES (13, 158);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 14);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 104);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 75);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 112);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 154);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 193);
INSERT INTO public.link (challenge, recommendation) VALUES (14, 156);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 5);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 18);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 86);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 184);
INSERT INTO public.link (challenge, recommendation) VALUES (15, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 75);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 148);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (16, 140);
INSERT INTO public.link (challenge, recommendation) VALUES (17, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (17, 191);
INSERT INTO public.link (challenge, recommendation) VALUES (17, 175);
INSERT INTO public.link (challenge, recommendation) VALUES (19, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (19, 112);
INSERT INTO public.link (challenge, recommendation) VALUES (19, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (19, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 8);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 45);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 59);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 60);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 70);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 71);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 83);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 108);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 7);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 77);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 85);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 91);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 94);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 23);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 90);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 140);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 142);
INSERT INTO public.link (challenge, recommendation) VALUES (22, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 104);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 33);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 46);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 112);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 196);
INSERT INTO public.link (challenge, recommendation) VALUES (25, 162);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 34);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 68);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 67);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 96);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 104);
INSERT INTO public.link (challenge, recommendation) VALUES (26, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 46);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 57);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 62);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 74);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (27, 139);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 5);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 17);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 86);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 95);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 159);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 166);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 184);
INSERT INTO public.link (challenge, recommendation) VALUES (28, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 23);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 39);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 68);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 81);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 88);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 11);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 20);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 29);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 87);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 111);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 121);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 143);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 151);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 130);
INSERT INTO public.link (challenge, recommendation) VALUES (29, 196);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 104);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 34);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 29);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 49);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 192);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 193);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 147);
INSERT INTO public.link (challenge, recommendation) VALUES (30, 128);
INSERT INTO public.link (challenge, recommendation) VALUES (31, 105);
INSERT INTO public.link (challenge, recommendation) VALUES (31, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (31, 171);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 49);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 43);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 55);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 120);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 160);
INSERT INTO public.link (challenge, recommendation) VALUES (32, 128);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 43);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 46);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 57);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 62);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 74);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (33, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (34, 72);
INSERT INTO public.link (challenge, recommendation) VALUES (35, 39);
INSERT INTO public.link (challenge, recommendation) VALUES (35, 67);
INSERT INTO public.link (challenge, recommendation) VALUES (35, 10);
INSERT INTO public.link (challenge, recommendation) VALUES (35, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (35, 153);
INSERT INTO public.link (challenge, recommendation) VALUES (36, 61);
INSERT INTO public.link (challenge, recommendation) VALUES (36, 43);
INSERT INTO public.link (challenge, recommendation) VALUES (36, 46);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (37, 193);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 91);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 94);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 93);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 108);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 123);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 124);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 125);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 127);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 161);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 198);
INSERT INTO public.link (challenge, recommendation) VALUES (38, 191);
INSERT INTO public.link (challenge, recommendation) VALUES (39, 72);
INSERT INTO public.link (challenge, recommendation) VALUES (39, 79);
INSERT INTO public.link (challenge, recommendation) VALUES (39, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (39, 146);
INSERT INTO public.link (challenge, recommendation) VALUES (40, 76);
INSERT INTO public.link (challenge, recommendation) VALUES (40, 72);
INSERT INTO public.link (challenge, recommendation) VALUES (40, 171);
INSERT INTO public.link (challenge, recommendation) VALUES (41, 105);
INSERT INTO public.link (challenge, recommendation) VALUES (41, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (41, 171);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 91);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 94);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 90);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 55);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 122);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 140);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 155);
INSERT INTO public.link (challenge, recommendation) VALUES (42, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 72);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (43, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 82);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 176);
INSERT INTO public.link (challenge, recommendation) VALUES (44, 177);
INSERT INTO public.link (challenge, recommendation) VALUES (45, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (45, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (46, 110);
INSERT INTO public.link (challenge, recommendation) VALUES (46, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (46, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (46, 82);
INSERT INTO public.link (challenge, recommendation) VALUES (46, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 5);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 86);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 95);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (47, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 92);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 112);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 103);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 196);
INSERT INTO public.link (challenge, recommendation) VALUES (48, 139);
INSERT INTO public.link (challenge, recommendation) VALUES (49, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (49, 5);
INSERT INTO public.link (challenge, recommendation) VALUES (49, 18);
INSERT INTO public.link (challenge, recommendation) VALUES (49, 133);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 111);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 49);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 92);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 105);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 145);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 147);
INSERT INTO public.link (challenge, recommendation) VALUES (50, 190);
INSERT INTO public.link (challenge, recommendation) VALUES (51, 196);
INSERT INTO public.link (challenge, recommendation) VALUES (51, 145);
INSERT INTO public.link (challenge, recommendation) VALUES (52, 49);
INSERT INTO public.link (challenge, recommendation) VALUES (52, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (52, 151);
INSERT INTO public.link (challenge, recommendation) VALUES (52, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (53, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (53, 1);
INSERT INTO public.link (challenge, recommendation) VALUES (53, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (53, 12);
INSERT INTO public.link (challenge, recommendation) VALUES (53, 170);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 44);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 70);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 75);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 124);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (54, 122);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 181);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 85);
INSERT INTO public.link (challenge, recommendation) VALUES (55, 155);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 196);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 114);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 115);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 128);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 156);
INSERT INTO public.link (challenge, recommendation) VALUES (56, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (57, 5);
INSERT INTO public.link (challenge, recommendation) VALUES (57, 17);
INSERT INTO public.link (challenge, recommendation) VALUES (57, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (57, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (57, 159);
INSERT INTO public.link (challenge, recommendation) VALUES (58, 175);
INSERT INTO public.link (challenge, recommendation) VALUES (58, 130);
INSERT INTO public.link (challenge, recommendation) VALUES (58, 114);
INSERT INTO public.link (challenge, recommendation) VALUES (58, 56);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 98);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 152);
INSERT INTO public.link (challenge, recommendation) VALUES (59, 177);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 32);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 96);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 97);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 137);
INSERT INTO public.link (challenge, recommendation) VALUES (60, 39);
INSERT INTO public.link (challenge, recommendation) VALUES (61, 85);
INSERT INTO public.link (challenge, recommendation) VALUES (61, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (62, 144);
INSERT INTO public.link (challenge, recommendation) VALUES (63, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (63, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (63, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 17);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 86);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 95);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (64, 21);
INSERT INTO public.link (challenge, recommendation) VALUES (65, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 33);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 121);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 143);
INSERT INTO public.link (challenge, recommendation) VALUES (66, 151);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 136);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 141);
INSERT INTO public.link (challenge, recommendation) VALUES (67, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (68, 175);
INSERT INTO public.link (challenge, recommendation) VALUES (68, 114);
INSERT INTO public.link (challenge, recommendation) VALUES (69, 32);
INSERT INTO public.link (challenge, recommendation) VALUES (69, 148);
INSERT INTO public.link (challenge, recommendation) VALUES (69, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (69, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 25);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 93);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 140);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 91);
INSERT INTO public.link (challenge, recommendation) VALUES (70, 94);
INSERT INTO public.link (challenge, recommendation) VALUES (71, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (71, 146);
INSERT INTO public.link (challenge, recommendation) VALUES (71, 171);
INSERT INTO public.link (challenge, recommendation) VALUES (71, 111);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 13);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 24);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 78);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 82);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 105);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 176);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 177);
INSERT INTO public.link (challenge, recommendation) VALUES (72, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (73, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (73, 114);
INSERT INTO public.link (challenge, recommendation) VALUES (73, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (73, 95);
INSERT INTO public.link (challenge, recommendation) VALUES (74, 116);
INSERT INTO public.link (challenge, recommendation) VALUES (74, 36);
INSERT INTO public.link (challenge, recommendation) VALUES (74, 138);
INSERT INTO public.link (challenge, recommendation) VALUES (74, 79);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 116);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 117);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 132);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 156);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 183);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 51);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 80);
INSERT INTO public.link (challenge, recommendation) VALUES (75, 79);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 54);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 147);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 165);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 9);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 33);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 43);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 46);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 106);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 117);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 120);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 132);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 148);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 53);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 113);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 186);
INSERT INTO public.link (challenge, recommendation) VALUES (76, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 23);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 27);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 81);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 137);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 20);
INSERT INTO public.link (challenge, recommendation) VALUES (77, 111);
INSERT INTO public.link (challenge, recommendation) VALUES (78, 153);
INSERT INTO public.link (challenge, recommendation) VALUES (78, 41);
INSERT INTO public.link (challenge, recommendation) VALUES (78, 37);
INSERT INTO public.link (challenge, recommendation) VALUES (79, 170);
INSERT INTO public.link (challenge, recommendation) VALUES (80, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (80, 30);
INSERT INTO public.link (challenge, recommendation) VALUES (80, 43);
INSERT INTO public.link (challenge, recommendation) VALUES (81, 187);
INSERT INTO public.link (challenge, recommendation) VALUES (81, 197);
INSERT INTO public.link (challenge, recommendation) VALUES (81, 91);
INSERT INTO public.link (challenge, recommendation) VALUES (81, 94);
INSERT INTO public.link (challenge, recommendation) VALUES (81, 23);
INSERT INTO public.link (challenge, recommendation) VALUES (82, 126);
INSERT INTO public.link (challenge, recommendation) VALUES (83, 109);
INSERT INTO public.link (challenge, recommendation) VALUES (83, 19);
INSERT INTO public.link (challenge, recommendation) VALUES (83, 35);
INSERT INTO public.link (challenge, recommendation) VALUES (83, 17);
INSERT INTO public.link (challenge, recommendation) VALUES (83, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 17);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 63);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 159);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 200);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 131);
INSERT INTO public.link (challenge, recommendation) VALUES (84, 133);
INSERT INTO public.link (challenge, recommendation) VALUES (85, 32);
INSERT INTO public.link (challenge, recommendation) VALUES (85, 96);
INSERT INTO public.link (challenge, recommendation) VALUES (85, 185);
INSERT INTO public.link (challenge, recommendation) VALUES (85, 69);
INSERT INTO public.link (challenge, recommendation) VALUES (85, 15);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 2);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 52);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 180);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 191);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 175);
INSERT INTO public.link (challenge, recommendation) VALUES (86, 156);
INSERT INTO public.link (challenge, recommendation) VALUES (87, 83);
INSERT INTO public.link (challenge, recommendation) VALUES (87, 60);
INSERT INTO public.link (challenge, recommendation) VALUES (87, 179);
INSERT INTO public.link (challenge, recommendation) VALUES (87, 140);
INSERT INTO public.link (challenge, recommendation) VALUES (90, 199);
INSERT INTO public.link (challenge, recommendation) VALUES (90, 16);


--
-- TOC entry 3377 (class 0 OID 16598)
-- Dependencies: 221
-- Data for Name: link_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3378 (class 0 OID 16605)
-- Dependencies: 222
-- Data for Name: recommendation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (1, 'Cloud service companies such as AWS, through a contract with an educational institution, can provide the computing resource for the student''s use.

All three main cloud providers have an education-oriented version.

Use student program cloud services like AWS, Google, Azure or IBM Cloud to eliminate hardware and network limitation for students.

Use private cloud services through academia-industry partnerships such as Red Hat Academy.

Amazon cloud provider has a free plan helpful to students.', 'Amazon sometimes has some agreements, which I think now that the Federal Institute is doing, that it makes this student accounts available that they could test it for a period.

Most of these tools have free layers, in the case of Cloud providers. All three of the main ones have an education-oriented version, and that is very good. This for the teacher is a very great facilitator.

I recommend [...] Moving all teaching to a cloud. [...] contact AWS. They have a student program, or Google, with Ali Baba, Azure, and IBM Cloud.

There were times when I combined a set of free services to be used, Heroku. I combined some free services to run these things. I already had a partnership to use closed [...] there is Red Hat Academy, right, where you can use OpenShift and everything else in the context of the effort you want to make. So, this kind of thing helps a lot.

They have a real experience with respect to Amazon, it''s pretty simple, and you can get a free Amazon, you just have to register.  Cloud service companies such as AWS, through a contract with an educational institution, can provide the computing resource for the student''s use.

All three main cloud providers have an education-oriented version.

Use student program cloud services like AWS, Google, Azure or IBM Cloud to eliminate hardware and network limitation for students.

Use private cloud services through academia-industry partnerships such as Red Hat Academy.

Amazon cloud provider has a free plan helpful to students. Use cloud provider services with students plans. aws; cloud; planning; educational; computing resource; tool; technology; automation; organization', 5, 'agreement between educational institution and internet cloud services', 'Amazon sometimes has some agreements, which I think now that the Federal Institute is doing, that it makes this student accounts available that they could test it for a period.

Most of these tools have free layers, in the case of Cloud providers. All three of the main ones have an education-oriented version, and that is very good. This for the teacher is a very great facilitator.

I recommend [...] Moving all teaching to a cloud. [...] contact AWS. They have a student program, or Google, with Ali Baba, Azure, and IBM Cloud.

There were times when I combined a set of free services to be used, Heroku. I combined some free services to run these things. I already had a partnership to use closed [...] there is Red Hat Academy, right, where you can use OpenShift and everything else in the context of the effort you want to make. So, this kind of thing helps a lot.

They have a real experience with respect to Amazon, it''s pretty simple, and you can get a free Amazon, you just have to register. ', 'Use cloud provider services with students plans.', false, 'aws; cloud; planning; educational; computing resource; tool; technology; automation; organization', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (2, 'Build scenarios that students can run on their own computer.

Give up teaching content that the student cannot run on their machine.

Take advantage of the student''s own computational resource and adapt to something that requires less computational demand.', 'Set up scenarios that they can run on their computer.

Sometimes give up certain things you would like to teach [...] to the detriment of the student not having the ability to perform.

Solutions that the student can run on his computer. [...] adapt to something perhaps with less computational demand. Build scenarios that students can run on their own computer.

Give up teaching content that the student cannot run on their machine.

Take advantage of the student''s own computational resource and adapt to something that requires less computational demand. Build scenarios that students can run on their own computer. scenario; example; computing resource; environment; sample; setup', 1, 'setting up scenarios on the student''s computer', 'Set up scenarios that they can run on their computer.

Sometimes give up certain things you would like to teach [...] to the detriment of the student not having the ability to perform.

Solutions that the student can run on his computer. [...] adapt to something perhaps with less computational demand.', 'Build scenarios that students can run on their own computer.', false, 'scenario; example; computing resource; environment; sample; setup', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (4, 'Define what are the devops concepts.', 'This was somehow harmonized. Define what are the devops concepts.  concept; theory', 1, 'No definition of DevOps concepts', 'This was somehow harmonized.', NULL, true, 'concept; theory', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (5, 'You can''t assess students'' DevOps learning with a test, it''s necessary to assess with projects, with some kind of hands-on activity.

DevOps teaching with practical activities.

Prefer practical assessments to written tests in order to verify student learning on the subject.

Prefer assessment based on practical projects.

Evaluate through practical exercises.

The assessment must be practical.

Evaluate through practical challenges.', 'You can''t evaluate with proof; you have to assess with projects with some activity.

With some practical activity.

Taking a test, simply evaluating him, is even a way of doing this, but in this more practical approach, I believe that the student is better prepared and we are able to evaluate, in fact, the most important aspects of his education [.. .] If he is really acquiring that knowledge, what we really wanted to convey in that particular topic, in that particular subject.

We have adopted project-based assessment a lot [...] the assessment of this project puts a student in his context to test in practice or simulate, in practice, a little of what he saw during classes.

From a practical point of view, I simply pass on the exercise.

I think that proof would not be a nice deal, but it would be more or less certification from AWS, for example, from Azure, Google, and that is not the purpose. [...] Taking the test, written, open, I do not like it, I do not like the test model as an assessment, I do not think it is cool, I prefer to work with more practical things.

You propose a practical challenge to solve a problem. I think the students end up learning more. You can''t assess students'' DevOps learning with a test, it''s necessary to assess with projects, with some kind of hands-on activity.

DevOps teaching with practical activities.

Prefer practical assessments to written tests in order to verify student learning on the subject.

Prefer assessment based on practical projects.

Evaluate through practical exercises.

The assessment must be practical.

Evaluate through practical challenges. The assess should be with hands-on activity. hands-on; lab; project; practice; activity; exercise; assessment; task; mission; evaluation', 5, 'Assessment of learning with practical projects and activities.', 'You can''t evaluate with proof; you have to assess with projects with some activity.

With some practical activity.

Taking a test, simply evaluating him, is even a way of doing this, but in this more practical approach, I believe that the student is better prepared and we are able to evaluate, in fact, the most important aspects of his education [.. .] If he is really acquiring that knowledge, what we really wanted to convey in that particular topic, in that particular subject.

We have adopted project-based assessment a lot [...] the assessment of this project puts a student in his context to test in practice or simulate, in practice, a little of what he saw during classes.

From a practical point of view, I simply pass on the exercise.

I think that proof would not be a nice deal, but it would be more or less certification from AWS, for example, from Azure, Google, and that is not the purpose. [...] Taking the test, written, open, I do not like it, I do not like the test model as an assessment, I do not think it is cool, I prefer to work with more practical things.

You propose a practical challenge to solve a problem. I think the students end up learning more.', 'The assess should be with hands-on activity.', true, 'hands-on; lab; project; practice; activity; exercise; assessment; task; mission; evaluation', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (7, 'The GNS3 tool is a potential candidate as a tool for teaching DevOps.', 'I think a potential candidate is GNS3. The GNS3 tool is a potential candidate as a tool for teaching DevOps.  gns3; tool; technology; automation', 1, 'GNS3 as a DevOps Teaching Support Tool', 'I think a potential candidate is GNS3.', NULL, true, 'gns3; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (8, 'Ansible as deployment automation tools can be used in teaching DevOps.', 'All the DevOps tooling behind it like [...] the ansible or terraform here, or any of those other flavors of automation and deployment and stuff like that you can use. Ansible as deployment automation tools can be used in teaching DevOps.  ansible; deployment; automation; terraform; iac; infrastructure as code; tool; technology', 1, 'Use of Ansible, Terraform as a tool during DevOps teaching', 'All the DevOps tooling behind it like [...] the ansible or terraform here, or any of those other flavors of automation and deployment and stuff like that you can use.', NULL, true, 'ansible; deployment; automation; terraform; iac; infrastructure as code; tool; technology', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (9, 'Incremental teaching method based on projects and practical activities.

DevOps teaching should be project-based.

Create script for practical devops activities.

Use a practical approach.

Teach continuous delivery in a more practical context for development classes, using tools and delivery models.

Teach devops in a practical way by applying it.

DevOps disciplines should use hands-on activities.

Teaching must be practical, not just theoretical.

Teaching needs a practical project, not just theoretical teaching.

Teaching devops should be practical, not just theoretical.

Build an incremental teaching journey based on activities and missions, always combining practical activities with theoretical knowledge.

Try to be very incremental. Everything on your desk first. Splits into several components. Build them one by one. Start working in group.', 'For me, the approach, from the point of view of the teaching method, would be based on projects and practical activities throughout the course.

It will always be project-based.

Being able to evaluate the actions has to be a script of practical actions that the student has to carry out, and you will evaluate while that student is doing that there.

So, I think it''s more fruitful, didactically, pedagogically, teaching in this way, with the most practical approach.

Development classes [...] want to understand better the issue of DevOps related to continuous delivery processes or how it translates into practice and into delivery tools and models that streamline application building.

Teach DevOps [...] how it applies in practice.

I cannot see a discipline, a DevOps teaching that is not hands-on [...] That is not getting hands-on and making people at least exercise the tools.

There is much technology on the market [...] you cannot cover everything, right? However, at the same time, just giving the concept, I do not think it is enough. So you have to make a choice. I will teach this here.

It needed to be some practical project [...] Not to be just in the theory part.

You cannot teach DevOps only in theory. You have to experience it. You have to have practical experimentation for that.

Build this entire journey based on practical, incremental activities or missions that are all correlated so that the lessons learned during these practical activities and revisiting the theory of knowledge can flow into a project that involves a set of decision-making, which also in addition to the subjects theoretically covered in the room.

I''ve tried to be very incremental. Um, first teach the value of tests, then write the script to build everything on your desk. You don''t need any you''re alone. ... Then break it down into several components and build them one by one, then put an Artifactory in the middle. So you have the dependency. ... So you can imagine that each people in the group is like a different team in the world. Incremental teaching method based on projects and practical activities.

DevOps teaching should be project-based.

Create script for practical devops activities.

Use a practical approach.

Teach continuous delivery in a more practical context for development classes, using tools and delivery models.

Teach devops in a practical way by applying it.

DevOps disciplines should use hands-on activities.

Teaching must be practical, not just theoretical.

Teaching needs a practical project, not just theoretical teaching.

Teaching devops should be practical, not just theoretical.

Build an incremental teaching journey based on activities and missions, always combining practical activities with theoretical knowledge.

Try to be very incremental. Everything on your desk first. Splits into several components. Build them one by one. Start working in group. Teaching method based on practical activities. practice; activity; exercise; project; teaching method; theory; mission; incremental; continuous delivery; hands-on; group; task; mission; cd; concept; gradual; technique; strategy; execution; continuous deployment', 7, 'Incremental teaching based on projects and practical activities.', 'For me, the approach, from the point of view of the teaching method, would be based on projects and practical activities throughout the course.

It will always be project-based.

Being able to evaluate the actions has to be a script of practical actions that the student has to carry out, and you will evaluate while that student is doing that there.

So, I think it''s more fruitful, didactically, pedagogically, teaching in this way, with the most practical approach.

Development classes [...] want to understand better the issue of DevOps related to continuous delivery processes or how it translates into practice and into delivery tools and models that streamline application building.

Teach DevOps [...] how it applies in practice.

I cannot see a discipline, a DevOps teaching that is not hands-on [...] That is not getting hands-on and making people at least exercise the tools.

There is much technology on the market [...] you cannot cover everything, right? However, at the same time, just giving the concept, I do not think it is enough. So you have to make a choice. I will teach this here.

It needed to be some practical project [...] Not to be just in the theory part.

You cannot teach DevOps only in theory. You have to experience it. You have to have practical experimentation for that.

Build this entire journey based on practical, incremental activities or missions that are all correlated so that the lessons learned during these practical activities and revisiting the theory of knowledge can flow into a project that involves a set of decision-making, which also in addition to the subjects theoretically covered in the room.

I''ve tried to be very incremental. Um, first teach the value of tests, then write the script to build everything on your desk. You don''t need any you''re alone. ... Then break it down into several components and build them one by one, then put an Artifactory in the middle. So you have the dependency. ... So you can imagine that each people in the group is like a different team in the world.', 'Teaching method based on practical activities.', false, 'practice; activity; exercise; project; teaching method; theory; mission; incremental; continuous delivery; hands-on; group; task; mission; cd; concept; gradual; technique; strategy; execution; continuous deployment', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (29, 'Identify the most compatible DevOps scope for each class.

Adapt the course according to the profile of students.', 'The recommendation is to understand the learning context of the class.

Adapt the menu according to the student profile you have. Identify the most compatible DevOps scope for each class.

Adapt the course according to the profile of students. Identify the most compatible DevOps scope for each class. scope; background; profile; student; history; training; experience; preparation', 1, 'DevOps scope more compatible with each class', 'The recommendation is to understand the learning context of the class.

Adapt the menu according to the student profile you have.', 'Identify the most compatible DevOps scope for each class.', true, 'scope; background; profile; student; history; training; experience; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (10, 'The practical part must occupy at least 80% of the class.

Balance the presentation of the concepts and the practicals.

Do not delve so deeply into discussions about the theoretical part of devops.

Teach each DevOps concept using one hour lecture followed by one hour and a half lab hands-on.

Is not efficient to have more theoretical part than practice part during the course.

One hour of classrom concept teaching and three hours of practical session.

Make use of labs and lectures.', 'The practice that should occupy eighty percent of the class there, at least.

The practical discipline has a balance between concept and practice, with the practice being the most important.

The concepts need to be objectively presented, but there is not much discussion about.

My classes are about an hour lecture. And then the other hour and a half is lab it''s hands-on, you know, I give them a concept, let''s go do it. And by doing it, that''s where it really sticks.

First year I did a lot of concept on the whiteboard, um, and then went to exercise for the students to practice. It''s not efficient.

That''s why we build a class where we have a ratio of about one hour of classroom concept teaching on the whiteboard or something at three hours where they actually type on the keyboard of practical session. I think that''s important. Otherwise they don''t see it. 

So all of us, we covered a bit in really in the course, but also the, I mean, the lectures, but also they practice that in the lab. The practical part must occupy at least 80% of the class.

Balance the presentation of the concepts and the practicals.

Do not delve so deeply into discussions about the theoretical part of devops.

Teach each DevOps concept using one hour lecture followed by one hour and a half lab hands-on.

Is not efficient to have more theoretical part than practice part during the course.

One hour of classrom concept teaching and three hours of practical session.

Make use of labs and lectures. Focus more on the practical part compared to the theoretical part of DevOps. theory; practice; concept; discussion; lecture; lab; hands-on; theory; conversation; strategy; execution', 4, 'Non-deep theory class.', 'The practice that should occupy eighty percent of the class there, at least.

The practical discipline has a balance between concept and practice, with the practice being the most important.

The concepts need to be objectively presented, but there is not much discussion about.

My classes are about an hour lecture. And then the other hour and a half is lab it''s hands-on, you know, I give them a concept, let''s go do it. And by doing it, that''s where it really sticks.

First year I did a lot of concept on the whiteboard, um, and then went to exercise for the students to practice. It''s not efficient.

That''s why we build a class where we have a ratio of about one hour of classroom concept teaching on the whiteboard or something at three hours where they actually type on the keyboard of practical session. I think that''s important. Otherwise they don''t see it. 

So all of us, we covered a bit in really in the course, but also the, I mean, the lectures, but also they practice that in the lab.', 'Focus more on the practical part compared to the theoretical part of DevOps.', true, 'theory; practice; concept; discussion; lecture; lab; hands-on; theory; conversation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (11, 'Divide the workload of subjects that are related to networking and programming.

Seeking balance in teaching development and operation.', 'The strategy we used was to divide the workload in half, divide the workload in half [...] and occupy half of this workload with content that is more suited to the area of networks [...] And half of this with the one with content that has more aptitude for the programming area.

I believe that for DevOps, you have this balance [...] if you go to a course, that the focus is more development [...] Taking students there to see the other side [...] See Ops and the guys over there from Ops when you can have the opportunity to see more of the Dev too. Divide the workload of subjects that are related to networking and programming.

Seeking balance in teaching development and operation. Divide the workload of subjects that are related to networking and programming. subject; network; programming; operation; development; workload; curriculum; syllabus; schedule', 2, 'Division between Dev and Ops disciplines.', 'The strategy we used was to divide the workload in half, divide the workload in half [...] and occupy half of this workload with content that is more suited to the area of networks [...] And half of this with the one with content that has more aptitude for the programming area.

I believe that for DevOps, you have this balance [...] if you go to a course, that the focus is more development [...] Taking students there to see the other side [...] See Ops and the guys over there from Ops when you can have the opportunity to see more of the Dev too.', 'Divide the workload of subjects that are related to networking and programming.', true, 'subject; network; programming; operation; development; workload; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (12, 'Delegating the responsibility for finding adequate infrastructure for the student when it is not possible to obtain the necessary resources from the institution.

Delegate responsibility to the student.', 'I had to delegate this responsibility to the student.

When you do not have resources in the structure you are linked to, as an institution, you have to delegate that the student really finds his ways. Delegating the responsibility for finding adequate infrastructure for the student when it is not possible to obtain the necessary resources from the institution.

Delegate responsibility to the student. Delegate the responsibility for finding adequate infrastructure for the student. delegation; infrastructure; computing resource; institution; university; student; environment; academy; setup; support', 1, 'resources from the student''s side instead of academy', 'I had to delegate this responsibility to the student.

When you do not have resources in the structure you are linked to, as an institution, you have to delegate that the student really finds his ways.', 'Delegate the responsibility for finding adequate infrastructure for the student.', false, 'delegation; infrastructure; computing resource; institution; university; student; environment; academy; setup; support', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (13, 'Using a textbook as a basis and to give students a better idea of the sequence of the course contents.

Take Gene Kim''s book DevOps Handbook as a reference to prepare a DevOps class.

Devops Handbook goes to the foundations of DevOps and gets to the different key ideas.

Use DevOps Handbook to create the lectures.

Find books like DevOps Handbook that have industrial case studies about Facebook, Google, etc.', 'I like to base it on a textbook because I think a sequence is evident for the students, right? We can even choose some chapters, even making an essential part of this material [...] we research several things to set up our class. Still, having a backbone formed by literature I think it''s always important.

 I was looking for books to use. And, um, you know, I started to look at the books from Jane Kim. Um, and essentially I found this DevOps handbook, which has really not written as a textbook, but it''s, it covers it''s, it''s built around the three ways of DevOps. So the first way is the notion of flow. The second way is the notion of, um, feedback. And the third way is continual learning and experimentation.

So this book [DevOps Handbook] is very well done in this sense [...] it goes to the foundations of devops and gets to the different key ideas, right?

The lectures, um, for the first part it''s okay. I think for, until the midterm to have just get essentially through the book.

The book has a lot of case study and examples like Facebook, Google, LinkedIn, uh, Netflix. Using a textbook as a basis and to give students a better idea of the sequence of the course contents.

Take Gene Kim''s book DevOps Handbook as a reference to prepare a DevOps class.

Devops Handbook goes to the foundations of DevOps and gets to the different key ideas.

Use DevOps Handbook to create the lectures.

Find books like DevOps Handbook that have industrial case studies about Facebook, Google, etc. Use a textbook as a basis to guide the course classes. book; material; DevOps Handbook; case study; industry; preparation', 2, 'Use of a textbook.', 'I like to base it on a textbook because I think a sequence is evident for the students, right? We can even choose some chapters, even making an essential part of this material [...] we research several things to set up our class. Still, having a backbone formed by literature I think it''s always important.

 I was looking for books to use. And, um, you know, I started to look at the books from Jane Kim. Um, and essentially I found this DevOps handbook, which has really not written as a textbook, but it''s, it covers it''s, it''s built around the three ways of DevOps. So the first way is the notion of flow. The second way is the notion of, um, feedback. And the third way is continual learning and experimentation.

So this book [DevOps Handbook] is very well done in this sense [...] it goes to the foundations of devops and gets to the different key ideas, right?

The lectures, um, for the first part it''s okay. I think for, until the midterm to have just get essentially through the book.

The book has a lot of case study and examples like Facebook, Google, LinkedIn, uh, Netflix.', 'Use a textbook as a basis to guide the course classes.', false, 'book; material; DevOps Handbook; case study; industry; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (14, 'Work on improving students'' skills related to non-functional requirements.', 'There are a [...] series of features to be developed, and [...] the student has been trained for this. But other aspects related more to putting the system into production, to be careful [...] after the procedure is operational, not focusing on factors related to the system''s functionalities anymore, but directing to non-functional aspects, then the students they need to have a better sense of it. Work on improving students'' skills related to non-functional requirements.  production; non-functional; skill; student; technique; curriculum; syllabus', 1, 'Perfecting of skills with non-functional requirements', 'There are a [...] series of features to be developed, and [...] the student has been trained for this. But other aspects related more to putting the system into production, to be careful [...] after the procedure is operational, not focusing on factors related to the system''s functionalities anymore, but directing to non-functional aspects, then the students they need to have a better sense of it.', NULL, false, 'production; non-functional; skill; student; technique; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (15, 'Use of a learning tool to facilitate understanding of the concept of Continuous Integration.

Using a learning tool helps in DevOps teaching.

Using a learning tool helps in DevOps teaching.

Use tools while explaining the continuous integration concept.', 'The microservices tool is one of the tools I have been using with them. A device, an environment in which we put the students'' solutions there and they can see more of the Continuous Integration part there.

These systems being made available and then with the creation of the DevOps tool from the IFRN cloud, the microservices system there, it was then possible for us to have this more practical view of the process as a whole. So, I have adopted it in all semesters, including, I have always asked students to work with this tool.

Having this system already in the air, I also believe that it is another gain, why? Because as you advance in the themes, you can already put look, this aspect here that we are working on, you will have already contemplated in the system through this, this and this.

When it comes to teaching devops concepts, like, continuous integration, there will be a tool. Use of a learning tool to facilitate understanding of the concept of Continuous Integration.

Using a learning tool helps in DevOps teaching.

Using a learning tool helps in DevOps teaching.

Use tools while explaining the continuous integration concept. Use a learning tool to easy the DevOps teaching. continuous integration; tool; technology; practice; automation; gradual; ci', 2, 'Use of a learning tool', 'The microservices tool is one of the tools I have been using with them. A device, an environment in which we put the students'' solutions there and they can see more of the Continuous Integration part there.

These systems being made available and then with the creation of the DevOps tool from the IFRN cloud, the microservices system there, it was then possible for us to have this more practical view of the process as a whole. So, I have adopted it in all semesters, including, I have always asked students to work with this tool.

Having this system already in the air, I also believe that it is another gain, why? Because as you advance in the themes, you can already put look, this aspect here that we are working on, you will have already contemplated in the system through this, this and this.

When it comes to teaching devops concepts, like, continuous integration, there will be a tool.', 'Use a learning tool to easy the DevOps teaching.', true, 'continuous integration; tool; technology; practice; automation; gradual; ci', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (16, 'DevOps deserves a discipline in the curriculum.

Be concerned with the course''s curriculum, maintaining and creating DevOps disciplines.

DevOps deserves a discipline in the curriculum of courses focused on software development.', 'The importance of actually having a discipline like this in the curriculum talking about these themes.

We are going through a matrix reformulation process,[...] this part of the workload and this discipline, really, the usefulness and one of the defenses that were made, was precisely that the discipline existed in the course, precisely because at another time, these topics would not be considered. So that''s why it''s important to have a discipline like that in the curriculum talking about these themes.

In a course like ours, in development, having a discipline like this, I think it is important indeed.
 DevOps deserves a discipline in the curriculum.

Be concerned with the course''s curriculum, maintaining and creating DevOps disciplines.

DevOps deserves a discipline in the curriculum of courses focused on software development. DevOps deserves a discipline in the curriculum. discipline; course; curriculum; syllabus', 1, 'Necessity of a DevOps discipline', 'The importance of actually having a discipline like this in the curriculum talking about these themes.

We are going through a matrix reformulation process,[...] this part of the workload and this discipline, really, the usefulness and one of the defenses that were made, was precisely that the discipline existed in the course, precisely because at another time, these topics would not be considered. So that''s why it''s important to have a discipline like that in the curriculum talking about these themes.

In a course like ours, in development, having a discipline like this, I think it is important indeed.
', 'DevOps deserves a discipline in the curriculum.', true, 'discipline; course; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (17, 'Evaluate level of participation and difficulty of students in teamwork.

Assess students through project and group exercises, more specifically the collaboration of each one within the group.', 'We can assess teamwork in students, like those who are collaborating, those who are more overloaded, those who are perhaps less overloaded, those who develop and deliver more features, those who do not cooperate with teamwork.

The evaluation part [...] the recommendation would be to try to come up [...] some project or some challenge in the project itself that involves collaboration between people. Be able to divide the class there, the students into groups and each one will attack a problem and then everything has to come together, right? So, watch them. Evaluate level of participation and difficulty of students in teamwork.

Assess students through project and group exercises, more specifically the collaboration of each one within the group. Evaluate level of participation and difficulty of students in teamwork. evaluation; team; group; project; exercise; collaboration; participation; partnership; assessment; activity; task; mission; evaluation', 2, 'Evaluation of participation in teamwork', 'We can assess teamwork in students, like those who are collaborating, those who are more overloaded, those who are perhaps less overloaded, those who develop and deliver more features, those who do not cooperate with teamwork.

The evaluation part [...] the recommendation would be to try to come up [...] some project or some challenge in the project itself that involves collaboration between people. Be able to divide the class there, the students into groups and each one will attack a problem and then everything has to come together, right? So, watch them.', 'Evaluate level of participation and difficulty of students in teamwork.', false, 'evaluation; team; group; project; exercise; collaboration; participation; partnership; assessment; activity; task; mission; evaluation', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (18, 'Monitoring of students through activities in a learning support environment.', 'We can monitor this part of the evaluation a lot due to their activity. So part of it is the cloud system tool that allows us to do this monitoring. Monitoring of students through activities in a learning support environment.  monitoring; activity; exercise; support; environment; task; platform; mission; tool; technology; automation; supervision', 1, 'Monitoring by a supportive learning environment.', 'We can monitor this part of the evaluation a lot due to their activity. So part of it is the cloud system tool that allows us to do this monitoring.', NULL, false, 'monitoring; activity; exercise; support; environment; task; platform; mission; tool; technology; automation; supervision', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (19, 'Ask students to adopt the tools used by instructors.', 'Usually, they already arrive with the system, sometimes deployed in another environment, which is quite common for them to use this environment. Then we have to bring them in, asking them to use ours. Ask students to adopt the tools used by instructors.  adoption; migration; tool; technology; automation; choice; selection', 1, 'Adoption of tools from instructors   by students', 'Usually, they already arrive with the system, sometimes deployed in another environment, which is quite common for them to use this environment. Then we have to bring them in, asking them to use ours.', NULL, false, 'adoption; migration; tool; technology; automation; choice; selection', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (20, 'A discipline must have a considerable workload to centralize and harmonize development and operation information.', 'Suppose the course is a development course or one that involves the operation part. In that case, it is essential to have a discipline that centralizes this information, a domain, perhaps, later on, that gathers these concepts, already preparing the student more for the market.[...] a rather considerable workload to have this dynamic with the students. A discipline must have a considerable workload to centralize and harmonize development and operation information.  workload; course; discipline; development; operation; curriculum; syllabus; schedule', 1, 'DevOps discipline with the considerable workload.', 'Suppose the course is a development course or one that involves the operation part. In that case, it is essential to have a discipline that centralizes this information, a domain, perhaps, later on, that gathers these concepts, already preparing the student more for the market.[...] a rather considerable workload to have this dynamic with the students.', NULL, true, 'workload; course; discipline; development; operation; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (21, 'Socializing knowledge acquired in practical activities is essential for learning.

Teach social coding.

Get the students to be more social in their coding practices and do pair programming ', 'They use the system, and I always ask them to socialize. Now, of more remote education, we''re doing that they associate what they did.  And when we are at this moment of socialization, the students can take advantage of the gain and knowledge that another team had in an aspect that, at times, they had not noticed.

 I teach them about social coding.

It''s tough to get the students to be more social if you will, in their coding practices and do pair programming, uh, and follow the, get feature branch workflow.  Socializing knowledge acquired in practical activities is essential for learning.

Teach social coding.

Get the students to be more social in their coding practices and do pair programming  Teach social coding. social; knowledge; practice; activity; exercise; coding; pair programming; task; mission; strategy; execution', 2, 'Socialization of knowledge of practical activities', 'They use the system, and I always ask them to socialize. Now, of more remote education, we''re doing that they associate what they did.  And when we are at this moment of socialization, the students can take advantage of the gain and knowledge that another team had in an aspect that, at times, they had not noticed.

 I teach them about social coding.

It''s tough to get the students to be more social if you will, in their coding practices and do pair programming, uh, and follow the, get feature branch workflow. ', 'Teach social coding.', false, 'social; knowledge; practice; activity; exercise; coding; pair programming; task; mission; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (22, 'Adopt a more professional approach in which teachers act as clients.', 'They choose to [...] put this system on the air for a customer to see, right? In this aspect, the client is the teachers themselves who are evaluating. Adopt a more professional approach in which teachers act as clients.  professional; approach; technique; strategy; execution', 1, 'Teachers as clients', 'They choose to [...] put this system on the air for a customer to see, right? In this aspect, the client is the teachers themselves who are evaluating.', NULL, false, 'professional; approach; technique; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (23, 'The Continuous Integration and industry tools must be in the curricula.', 'The aspects that we address about continuous integration, [...] use of the tools we use in the environment, on a day-to-day basis, facilitate development that speeds up delivery; this is one of the topics we have. In the discipline, I believe that these themes should be part of their curriculum; they should contact this theme there. The Continuous Integration and industry tools must be in the curricula.  continuous integration; tool; technology; concept; course; discipline; theory; automation; gradual; curriculum; syllabus; ci', 1, 'Continuous Integration and industrial tools at the curriculum', 'The aspects that we address about continuous integration, [...] use of the tools we use in the environment, on a day-to-day basis, facilitate development that speeds up delivery; this is one of the topics we have. In the discipline, I believe that these themes should be part of their curriculum; they should contact this theme there.', NULL, true, 'continuous integration; tool; technology; concept; course; discipline; theory; automation; gradual; curriculum; syllabus; ci', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (24, 'Combine the various materials and publications available to make up for the lack of a unified, complete, and high-level material.', 'But as there isn''t, we find different materials; we have several publications. Combine the various materials and publications available to make up for the lack of a unified, complete, and high-level material.  material; publication; paper; combination; solution; report; group; integration; preparation; writing; book; record', 1, 'Union of various materials and publications available', 'But as there isn''t, we find different materials; we have several publications.', NULL, false, 'material; publication; paper; combination; solution; report; group; integration; preparation; writing; book; record', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (25, 'When using a tool to help teach, you must have a good command of it and the necessary permissions/accompaniment of someone with such permissions to deal well with the possible difficulties during its use in the discipline.', '[...] With the addition of our Project of Software Development team of professor Sales, he has access, so, more within the tool, he already knows the most diverse aspects. It was already possible for us to solve several difficulties.[...] When using a tool to help teach, you must have a good command of it and the necessary permissions/accompaniment of someone with such permissions to deal well with the possible difficulties during its use in the discipline.  command; permission; tool; technology; automation; freedom', 1, 'good mastery of the tools with the necessary permissions', '[...] With the addition of our Project of Software Development team of professor Sales, he has access, so, more within the tool, he already knows the most diverse aspects. It was already possible for us to solve several difficulties.[...]', NULL, false, 'command; permission; tool; technology; automation; freedom', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (26, 'You can use the same discipline of DevOps for operation groups focused on safety and development groups.', 'The same DevOps discipline now applies at the institution where I teach concerning classes focused on security and vulnerability management and courses focused on application development and construction. You can use the same discipline of DevOps for operation groups focused on safety and development groups.  discipline; course; operation; security; development; curriculum; syllabus', 1, 'Identical DevOps discipline for  operation and development classes', 'The same DevOps discipline now applies at the institution where I teach concerning classes focused on security and vulnerability management and courses focused on application development and construction.', NULL, true, 'discipline; course; operation; security; development; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (27, 'Teach the part of cloud vulnerability, architecture, and network management to the security classes in DevOps.', 'In DevOps [...], the security teams are much more in understanding what it represents from the point of view of vulnerability management and architecture, from the network concerning the cloud. Teach the part of cloud vulnerability, architecture, and network management to the security classes in DevOps.  cloud; security; architecture; network; structure; curriculum; syllabus', 1, 'Vulnerability management teaching to DevOps security classes.', 'In DevOps [...], the security teams are much more in understanding what it represents from the point of view of vulnerability management and architecture, from the network concerning the cloud.', NULL, true, 'cloud; security; architecture; network; structure; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (77, 'Exercise as many tools as possible.', 'The point is to try to exercise as many tools as possible to provide everyone [...] with a range of things to apply in your daily life when you see the need. Exercise as many tools as possible.  exercise; task; mission; tool; technology; automation', 1, 'Practice of large amount of tools', 'The point is to try to exercise as many tools as possible to provide everyone [...] with a range of things to apply in your daily life when you see the need.', NULL, false, 'exercise; task; mission; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (30, 'Make an example to the student in a practical context from the initial stage to the final step.

During the explanation of how to apply devops methodology, make use of example including tools.

Use different tools and methodologies.

Provide sample application in the labs.

Show concrete examples when you are presenting some tool like Kubernetes and Docker.', 'Having a unique mechanism and an initial step, the final step you want to reach within this test, makes it much easier when you teach, when you do, especially for examples.

Explain how the methodology can be applied, with examples and even tools.

I am not going to deliver a ready-made recipe. I am going to use different tools. diverse methodologies that are also tools for them to try to apply within their process.

The lab is like in the lab, because it''s a very practical ...   we''ve implemented an application, uh, a web application, which, uh, in, currently we are using the application we use is a banking application. It is the online banking where people can go in and create an account or transfer between accounts and do all those kind of thing.

In some topics, maybe it''s introducing a bit more. So say that you''re getting in the topic in the, in the lecture where, um, containers are, are relevant and then deployment is relevant. Then maybe the way is to discuss a bit more maybe than use Kubernetes and Docker, give concrete examples and stuff like that that supports the reading that they have done. Make an example to the student in a practical context from the initial stage to the final step.

During the explanation of how to apply devops methodology, make use of example including tools.

Use different tools and methodologies.

Provide sample application in the labs.

Show concrete examples when you are presenting some tool like Kubernetes and Docker. Teach using examples. example; practice; incremental; methodology; lab; tool; technology; docker; kubernetes; sample; automation; approach; strategy; execution', 4, 'Practice with well-defined example steps and contexts.', 'Having a unique mechanism and an initial step, the final step you want to reach within this test, makes it much easier when you teach, when you do, especially for examples.

Explain how the methodology can be applied, with examples and even tools.

I am not going to deliver a ready-made recipe. I am going to use different tools. diverse methodologies that are also tools for them to try to apply within their process.

The lab is like in the lab, because it''s a very practical ...   we''ve implemented an application, uh, a web application, which, uh, in, currently we are using the application we use is a banking application. It is the online banking where people can go in and create an account or transfer between accounts and do all those kind of thing.

In some topics, maybe it''s introducing a bit more. So say that you''re getting in the topic in the, in the lecture where, um, containers are, are relevant and then deployment is relevant. Then maybe the way is to discuss a bit more maybe than use Kubernetes and Docker, give concrete examples and stuff like that that supports the reading that they have done.', 'Teach using examples.', false, 'example; practice; incremental; methodology; lab; tool; technology; docker; kubernetes; sample; automation; approach; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (32, 'Introduce well-established concepts by the DevOps community, such as the DevOps pipeline process.

Teach how to set up a pipeline and explain how it works.', 'Present concepts that are well established in the community, such as axes, [...] in the DevOps process.

I simply want them to be able to set up some kind of a pipeline and understand how it works. Introduce well-established concepts by the DevOps community, such as the DevOps pipeline process.

Teach how to set up a pipeline and explain how it works. Introduce well-established concepts by the DevOps community, such as the DevOps pipeline process. concept; pipeline; deployment; delivery; theory; technique; skill', 2, 'Teaching of well-established concepts like the DevOps pipeline process', 'Present concepts that are well established in the community, such as axes, [...] in the DevOps process.

I simply want them to be able to set up some kind of a pipeline and understand how it works.', 'Introduce well-established concepts by the DevOps community, such as the DevOps pipeline process.', true, 'concept; pipeline; deployment; delivery; theory; technique; skill', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (33, 'Present the use case of devops, for example, the elimination of silos among the development team.

Identify the market use cases of devops such as the Google case and the relationship between DevOps and the SRE professional to illustrate the importance of DevOps concepts.

Try to use case study together labs.

Use lectures to show case studies and emphasize in some of the DevOps concepts.', 'Present [...] cases on how this translates, [...] eliminating the silos between operations and development. Present the use case of devops, for example, the elimination of silos among the development team.

Identify the market use cases of devops such as the Google case and the relationship between DevOps and the SRE professional to illustrate the importance of DevOps concepts.

Try to use case study together labs.

Use lectures to show case studies and emphasize in some of the DevOps concepts. Show use cases of DevOps. silo; use case; SRE; lab; lecture; concept; case study; theory; strategy; execution; site reliability engineering', 2, 'Use case sampling, eliminating silos between development and operations teams.', 'Present [...] cases on how this translates, [...] eliminating the silos between operations and development.', 'Show use cases of DevOps.', true, 'silo; use case; SRE; lab; lecture; concept; case study; theory; strategy; execution; site reliability engineering', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (34, 'Start teaching DevOps from the culture. Only then demonstrate with tools.', 'Always start with culture before moving on to teaching or tool-based demonstration. Start teaching DevOps from the culture. Only then demonstrate with tools.  mindset; culture; tool; technology; skill; technique; automation; demonstration; presentation; strategy; execution', 1, 'teaching from culture, tools next', 'Always start with culture before moving on to teaching or tool-based demonstration.', NULL, true, 'mindset; culture; tool; technology; skill; technique; automation; demonstration; presentation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (35, 'Delimit a specific set of tools to build a scenario in order to demonstrate a concept to be taught.

Standardize the use of tools in a well-defined setting.', 'Build a cohesive [...] laboratory in a specific setting that can better demonstrate the concept being taught there.

So, the recommendation is to abuse the use of online solutions, which facilitate this process, but at the same time, stop the journey [...] So, the recommendation is to abuse the use of online solutions, which facilitate this process, but at the same time, stop the journey. Delimit a specific set of tools to build a scenario in order to demonstrate a concept to be taught.

Standardize the use of tools in a well-defined setting. Delimit a specific set of tools to build a scenario. scenario; demonstration; standard; tool; technology; automation; presentation', 1, 'Creation of teaching scenario based on specific set of tools', 'Build a cohesive [...] laboratory in a specific setting that can better demonstrate the concept being taught there.

So, the recommendation is to abuse the use of online solutions, which facilitate this process, but at the same time, stop the journey [...] So, the recommendation is to abuse the use of online solutions, which facilitate this process, but at the same time, stop the journey.', 'Delimit a specific set of tools to build a scenario.', false, 'scenario; demonstration; standard; tool; technology; automation; presentation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (64, 'Evaluate the course, performing an NPS (Net Promoter Score) with students.

Teachers and monitors must not be present at the time of course evaluation by students.

Do not try to get feedback before a student assessment, as the student may feel fearful.', 'They also assess the course at the end; we send you a link and recommend you do this, consider some topics to take the NPS; I think the NPS is the universal metric for assessment, I don''t know if you put it under the puts under the radar, the Net Promoter Score, from zero to ten, where zero to zero to seven is Detractor, eight is passive, nine to ten is promoter based on a set of questions that you cannot induce the student.

When people come in to do this, this, this feedback with the students, understand, the students also talk to a person who is not me, who on the last day, I leave, it is a recommendation I give, I leave the conference to leave the students at ease, talking to this person, they make a mistake during the training and the person got annoyed, and with you inside, they will be a little, a little afraid to expose, although it is also by email.

You need to get the feedback, you don''t get the feedback, right? So, and when we, when the students do the student evaluation, of course don''t write much. So it''s much easier if you can trigger this question. Evaluate the course, performing an NPS (Net Promoter Score) with students.

Teachers and monitors must not be present at the time of course evaluation by students.

Do not try to get feedback before a student assessment, as the student may feel fearful. Evaluate the course. nps; evaluation; course; feedback; fear; assessment; answer; net promoter score', 2, 'NPS as a form of course evaluation with students', 'They also assess the course at the end; we send you a link and recommend you do this, consider some topics to take the NPS; I think the NPS is the universal metric for assessment, I don''t know if you put it under the puts under the radar, the Net Promoter Score, from zero to ten, where zero to zero to seven is Detractor, eight is passive, nine to ten is promoter based on a set of questions that you cannot induce the student.

When people come in to do this, this, this feedback with the students, understand, the students also talk to a person who is not me, who on the last day, I leave, it is a recommendation I give, I leave the conference to leave the students at ease, talking to this person, they make a mistake during the training and the person got annoyed, and with you inside, they will be a little, a little afraid to expose, although it is also by email.

You need to get the feedback, you don''t get the feedback, right? So, and when we, when the students do the student evaluation, of course don''t write much. So it''s much easier if you can trigger this question.', 'Evaluate the course.', false, 'nps; evaluation; course; feedback; fear; assessment; answer; net promoter score', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (36, 'For a scenario with limited resources, it is recommended to make use of public cloud services.

Use available cloud services (AWS, Google) with Kubernetes.

Do environment setup in the cloud is the best option because they are always consistent.

Get students off their local machines and get them working off cloud servers.

Make the students experiment how to use a cloud provider like AWS.

Using external cloud services would give you the better in terms of DevOps philosophy, because then you''re really pushing and you bring stuff outside of the academy ecosystem.', 'If it''s a case where I don''t have access to almost anything, I need to go to a cloud to take a class with the student, even if it doesn''t involve the course itself. I need to do everything remote.

Everyone is already using Google or Amazon, with their Kubernetes environments available for you to use.

The environment setup is key. What I would love to do is have an environment in the cloud. That''s always consistent. That would kind of be the best.

The recommendation is we just get them off their local machines and get them working off cloud servers or something like that. So that at least a, you can kind of script the stuff be if it gets messed up, there''s no risk. You just tear it down and build a new one.

The third lab, that''s what we do since last winter. We didn''t do it last summer, did deploy on, on, on AWS. So we have, we have built accounts on Amazon, so they can go all the way.

I think maybe the, um, the using external cloud services would give you the better in terms of DevOps philosophy, let''s say, because then you''re really pushing and you bring stuff outside of the academy ecosystem. For a scenario with limited resources, it is recommended to make use of public cloud services.

Use available cloud services (AWS, Google) with Kubernetes.

Do environment setup in the cloud is the best option because they are always consistent.

Get students off their local machines and get them working off cloud servers.

Make the students experiment how to use a cloud provider like AWS.

Using external cloud services would give you the better in terms of DevOps philosophy, because then you''re really pushing and you bring stuff outside of the academy ecosystem. Use cloud provider services. scenario; computing resource; cloud; aws; kubernetes; local machine; tool; technology; automation; support', 6, 'cloud provider services', 'If it''s a case where I don''t have access to almost anything, I need to go to a cloud to take a class with the student, even if it doesn''t involve the course itself. I need to do everything remote.

Everyone is already using Google or Amazon, with their Kubernetes environments available for you to use.

The environment setup is key. What I would love to do is have an environment in the cloud. That''s always consistent. That would kind of be the best.

The recommendation is we just get them off their local machines and get them working off cloud servers or something like that. So that at least a, you can kind of script the stuff be if it gets messed up, there''s no risk. You just tear it down and build a new one.

The third lab, that''s what we do since last winter. We didn''t do it last summer, did deploy on, on, on AWS. So we have, we have built accounts on Amazon, so they can go all the way.

I think maybe the, um, the using external cloud services would give you the better in terms of DevOps philosophy, let''s say, because then you''re really pushing and you bring stuff outside of the academy ecosystem.', 'Use cloud provider services.', false, 'scenario; computing resource; cloud; aws; kubernetes; local machine; tool; technology; automation; support', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (37, 'Search for references from practical contexts experienced by students to easy the understanding, using popular tools.

During the explanations, make use of the difficulties, opinions and experiences faced by the students, pointing out solutions using Devops.

Use the difficulties with infrastructure in favor of learning, conducting discussions among students.

Promotes discussions about DevOps concepts and related issues.', 'Put the student in an efficient context; he can see in class a tool that he has probably seen someone using in the company or has heard of. This makes for much better immersion in class.

So, suppose someone had a more traumatic experience at such a stage of the delivery process. In that case, you know how to use it at the right time with them and impersonate with them, talk, look, as you told me in that part, a solution that might work for you, again, because there is no ready-made solution, it would be to apply this technology to try to mitigate or resolve it.

I prefer to take it out during class to show the day-to-day blocks delivered in the end. However, the recommendation is to use the infrastructure blocks to feed your course, as didactics. Do you speak, look, remember the block we had? The dependency, the software is made in Java 8, and we tried to compile a machine that had Java 15. Do you see this problem? How do we solve it? We analyze, run some process analysis frameworks because we can use any language as a tool, but use it as an experience.

  I spent a couple of discussing about the concepts discussing about the issues. Search for references from practical contexts experienced by students to easy the understanding, using popular tools.

During the explanations, make use of the difficulties, opinions and experiences faced by the students, pointing out solutions using Devops.

Use the difficulties with infrastructure in favor of learning, conducting discussions among students.

Promotes discussions about DevOps concepts and related issues. Promotes discussions about DevOps concepts and related issues. reference; practice; tool; technology; opinion; experience; discussion; issue; skill; resource; technique; automation; conversation; problem; question; strategy; execution', 3, 'References from practical context lived by students', 'Put the student in an efficient context; he can see in class a tool that he has probably seen someone using in the company or has heard of. This makes for much better immersion in class.

So, suppose someone had a more traumatic experience at such a stage of the delivery process. In that case, you know how to use it at the right time with them and impersonate with them, talk, look, as you told me in that part, a solution that might work for you, again, because there is no ready-made solution, it would be to apply this technology to try to mitigate or resolve it.

I prefer to take it out during class to show the day-to-day blocks delivered in the end. However, the recommendation is to use the infrastructure blocks to feed your course, as didactics. Do you speak, look, remember the block we had? The dependency, the software is made in Java 8, and we tried to compile a machine that had Java 15. Do you see this problem? How do we solve it? We analyze, run some process analysis frameworks because we can use any language as a tool, but use it as an experience.

  I spent a couple of discussing about the concepts discussing about the issues.', 'Promotes discussions about DevOps concepts and related issues.', false, 'reference; practice; tool; technology; opinion; experience; discussion; issue; skill; resource; technique; automation; conversation; problem; question; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (38, 'Create mutations in the menu due to the breadth of DevOps encompassing the development, operation, and security part.', 'This menu will have some possibilities to create mutations in this menu because the DevOps concept is very open; right, it encompasses different areas between development, security, and operations. Create mutations in the menu due to the breadth of DevOps encompassing the development, operation, and security part.  mutation; development; operation; security; curriculum; syllabus', 1, 'menu varying percentage of development, operation and security', 'This menu will have some possibilities to create mutations in this menu because the DevOps concept is very open; right, it encompasses different areas between development, security, and operations.', NULL, true, 'mutation; development; operation; security; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (39, 'Half of the curriculum with DevOps concepts/culture. Half the curriculum with tools.', 'This curriculum, a part of it, do you understand? With about forty percent, about sixty percent fixed, which is culture, main historical characteristics of how it came about, what does culture represent, what it changes about development processes, security operations. The changeable part is the tools, where you will apply them or what matches you to the students within the classroom in the course syllabus. Half of the curriculum with DevOps concepts/culture. Half the curriculum with tools.  concept; culture; mindset; practice; tool; technology; theory; skill; technique; automation; curriculum; syllabus; schedule', 1, 'Dedication on 50% for DevOps culture and 50% for tools on the curriculum', 'This curriculum, a part of it, do you understand? With about forty percent, about sixty percent fixed, which is culture, main historical characteristics of how it came about, what does culture represent, what it changes about development processes, security operations. The changeable part is the tools, where you will apply them or what matches you to the students within the classroom in the course syllabus.', NULL, true, 'concept; culture; mindset; practice; tool; technology; theory; skill; technique; automation; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (40, 'For project management class, it is necessary to introduce DevOps through direct analogies or using scenarios known to them during teaching.', 'For a project management class [...], I often had to introduce [...] based on direct analogies or analogies with other scenarios he has already encountered in the product management part to understand what I was speaking. For project management class, it is necessary to introduce DevOps through direct analogies or using scenarios known to them during teaching.  project; analogy; scenario; comparison; relation; strategy; execution', 1, 'Teaching through known direct analogies to project management classes', 'For a project management class [...], I often had to introduce [...] based on direct analogies or analogies with other scenarios he has already encountered in the product management part to understand what I was speaking.', NULL, true, 'project; analogy; scenario; comparison; relation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (70, 'Perform continuous delivery through virtual machines or with Docker.', 'Software build [...] deliver this to a VM, somehow, in the best way you understand, which is possible in your suite [...] You can provide it with Docker. Perform continuous delivery through virtual machines or with Docker.  continuous delivery; virtual machine; vm; docker; container; tool; technology; automation; cd; gradual; technique; skill; continuous deployment', 1, 'Continuous delivery through virtual machine or docker', 'Software build [...] deliver this to a VM, somehow, in the best way you understand, which is possible in your suite [...] You can provide it with Docker.', NULL, true, 'continuous delivery; virtual machine; vm; docker; container; tool; technology; automation; cd; gradual; technique; skill; continuous deployment', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (41, 'Emphasize the importance of the DevOps culture and propagate it.

It is important to teach concepts such as observability and other cultural aspects such as sharing and communication.

Teach the DevOps culture: respect the individualities of your team, not looking for blame, but for solutions.

Live DevOps and its culture is the best way to learn it.

Living DevOps culture is more important than just learning DevOps tools.

Don''t teach a DevOps course only focusing on tools and technologies because it changes over time.', 'Always focus on culture, the tools are excellent, they attract a student, they create a practical scenario, but oh, DevOps implementation errors in practice are mainly caused by companies and professionals who do not interpret this as a culture.

More important [...] is to understand that concepts such as observability, development culture, communication, sharing are core. They are the core of what is proposed in relation to DevOps.

Teach the DevOps culture: respect the individualities of your team, not looking to blame anyone but for solutions.

The only way to teach culture, the only way to experience culture is to immerse the students in the culture. [...] one of the examples I give to my students is I say, you know, I took three years of Spanish in high school and I don''t speak a word of Spanish, but I bet if I spent a summer in Spain, I would come back speaking, fluent Spanish. So I tell them: this class is your summer in Spain, right? We are going to live DevOps. We''re going to experience DevOps. And that''s the only way you can properly teach it.

Working as an agile team and using the DevOps tools, but most importantly, living the DevOps culture.

Like, what do you teach in a DevOps course? Like, do you teach just technologies like Kubernetes and Docker? And, and I kept saying, no, this is not why I went back to university. I don''t want to be just teaching techniques and tools because these will change over time. Emphasize the importance of the DevOps culture and propagate it.

It is important to teach concepts such as observability and other cultural aspects such as sharing and communication.

Teach the DevOps culture: respect the individualities of your team, not looking for blame, but for solutions.

Live DevOps and its culture is the best way to learn it.

Living DevOps culture is more important than just learning DevOps tools.

Don''t teach a DevOps course only focusing on tools and technologies because it changes over time. Teach the DevOps mindset. mindset; culture; observability; sharing; communication; respect; team; tool; technology; conversation; skill; technique; automation; interaction; discussion; participation; partnership', 4, 'Teaching of Culture DevOps', 'Always focus on culture, the tools are excellent, they attract a student, they create a practical scenario, but oh, DevOps implementation errors in practice are mainly caused by companies and professionals who do not interpret this as a culture.

More important [...] is to understand that concepts such as observability, development culture, communication, sharing are core. They are the core of what is proposed in relation to DevOps.

Teach the DevOps culture: respect the individualities of your team, not looking to blame anyone but for solutions.

The only way to teach culture, the only way to experience culture is to immerse the students in the culture. [...] one of the examples I give to my students is I say, you know, I took three years of Spanish in high school and I don''t speak a word of Spanish, but I bet if I spent a summer in Spain, I would come back speaking, fluent Spanish. So I tell them: this class is your summer in Spain, right? We are going to live DevOps. We''re going to experience DevOps. And that''s the only way you can properly teach it.

Working as an agile team and using the DevOps tools, but most importantly, living the DevOps culture.

Like, what do you teach in a DevOps course? Like, do you teach just technologies like Kubernetes and Docker? And, and I kept saying, no, this is not why I went back to university. I don''t want to be just teaching techniques and tools because these will change over time.', 'Teach the DevOps mindset.', true, 'mindset; culture; observability; sharing; communication; respect; team; tool; technology; conversation; skill; technique; automation; interaction; discussion; participation; partnership', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (43, 'We seek a communication between students and teachers, where attention is paid to the students'' opinions.

Teaching customized based on students background.', 'And DevOps a lot in seeing this; they have different backgrounds, have other life stories, experiences that marked them in different ways and knowing when to present a new tool, listen to what these people have.

So I let them know that if you asked me the same question a second time, I promise I won''t answer it the same way. I''ll try to find some different way to make that connection with you. Right? So that you understand it, given the background that you have. Given the skills that you have. Uh, so again, I try to immerse them in this culture. We seek a communication between students and teachers, where attention is paid to the students'' opinions.

Teaching customized based on students background. Customize the teaching based on students background. communication; opinion; customization; background; level; history; conversation; experience; interaction; discussion; strategy; execution', 2, 'Culture of communication between student and teacher', 'And DevOps a lot in seeing this; they have different backgrounds, have other life stories, experiences that marked them in different ways and knowing when to present a new tool, listen to what these people have.

So I let them know that if you asked me the same question a second time, I promise I won''t answer it the same way. I''ll try to find some different way to make that connection with you. Right? So that you understand it, given the background that you have. Given the skills that you have. Uh, so again, I try to immerse them in this culture.', 'Customize the teaching based on students background.', false, 'communication; opinion; customization; background; level; history; conversation; experience; interaction; discussion; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (44, 'Avoid using virtual machines because they demand hardware resources, which are not always available on the students'' devices.', 'Nor use VM virtual machines because the virtual machine demands hardware resources. And it''s not always that you have availability to upload two virtual machines on the student''s device. Avoid using virtual machines because they demand hardware resources, which are not always available on the students'' devices.  virtual machine; vm; hardware; computing resource; tool; technology; automation', 1, 'Necessary great resource using virtual machines ', 'Nor use VM virtual machines because the virtual machine demands hardware resources. And it''s not always that you have availability to upload two virtual machines on the student''s device.', NULL, false, 'virtual machine; vm; hardware; computing resource; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (45, 'Terraform as a deployment automation tool can be used in teaching devops.

Use Terraform as a provisioning tool (Infrastructure as Code).', 'All the devops tooling behind it like [...] the ansible or terraform here, or any of those other flavors of automaters and deployment and stuff like that you can use.

I am going to upload the environment here on AWS using Terraform. So, provision the students'' machines with TerraForm, explain to the students what you are doing, at the right time, on schedule, but decouple the need for the infrastructure. Terraform as a deployment automation tool can be used in teaching devops.

Use Terraform as a provisioning tool (Infrastructure as Code). Terraform as a deployment provisioning tool can be used in teaching devops. terraform; deployment; provisioning; automation; iac; tool; technology; automation; infrastructure as code', 2, 'Use the Terraform tool.', 'All the devops tooling behind it like [...] the ansible or terraform here, or any of those other flavors of automaters and deployment and stuff like that you can use.

I am going to upload the environment here on AWS using Terraform. So, provision the students'' machines with TerraForm, explain to the students what you are doing, at the right time, on schedule, but decouple the need for the infrastructure.', 'Terraform as a deployment provisioning tool can be used in teaching devops.', true, 'terraform; deployment; provisioning; automation; iac; tool; technology; automation; infrastructure as code', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (66, 'Record a training for the teacher to assess language addiction and whether the class flowed as planned.', 'If possible, record at least one training for an autoscopy at the end. See if you have any language addiction, if there were any process that didn''t fit the way you imagined, that would work, because when you''re talking and doing, sometimes, there''s a detail that it shouldn''t. Record a training for the teacher to assess language addiction and whether the class flowed as planned.  record; training; language; assessment; evaluation; voice', 1, 'Class evaluation through training recording.', 'If possible, record at least one training for an autoscopy at the end. See if you have any language addiction, if there were any process that didn''t fit the way you imagined, that would work, because when you''re talking and doing, sometimes, there''s a detail that it shouldn''t.', NULL, false, 'record; training; language; assessment; evaluation; voice', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (67, 'It is essential to mix the teaching of the theoretical part and the practical part of DevOps.', 'Mixing, theoretical and practical [...] is essential. It is essential to mix the teaching of the theoretical part and the practical part of DevOps.  theory; practice; balance; concept; curriculum; syllabus; schedule', 1, 'Theoretical and practical education mix', 'Mixing, theoretical and practical [...] is essential.', NULL, true, 'theory; practice; balance; concept; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (46, 'Use practical examples regularly for the student to interact.

Interact with the student and break the tone of voice every 20 minutes, inhibiting their loss of attention.

Interact with the student to keep him alert, proposing challenges, for example.', 'To put your hand on something, at least once every, depends a lot [...] on the schedule, but every, I''ll put it every eight hours is a very subjective metric, but if you give something practical every eight hours with examples for the student to interact, so you don''t stay in a lecture for hours on end talking, it''s essential to know how to divide and balance.

He has up to twenty, twenty-five minutes, he has your attention. So, if you cannot break that, alternate the tone of voice you speak, interact with him. If you just talk, you quickly lose the student after twenty minutes.

We need to adapt to the environment and try, every twenty to thirty minutes, to interact with the student so that he does something to keep his attention [...] Always propose challenges. Use practical examples regularly for the student to interact.

Interact with the student and break the tone of voice every 20 minutes, inhibiting their loss of attention.

Interact with the student to keep him alert, proposing challenges, for example. Interact with the students. practice; example; interaction; pause; attention; sample; break; strategy; execution', 1, 'Iteration with students through practical examples', 'To put your hand on something, at least once every, depends a lot [...] on the schedule, but every, I''ll put it every eight hours is a very subjective metric, but if you give something practical every eight hours with examples for the student to interact, so you don''t stay in a lecture for hours on end talking, it''s essential to know how to divide and balance.

He has up to twenty, twenty-five minutes, he has your attention. So, if you cannot break that, alternate the tone of voice you speak, interact with him. If you just talk, you quickly lose the student after twenty minutes.

We need to adapt to the environment and try, every twenty to thirty minutes, to interact with the student so that he does something to keep his attention [...] Always propose challenges.', 'Interact with the students.', false, 'practice; example; interaction; pause; attention; sample; break; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (48, 'Use examples with students to teach theory. For instance, we are using blocks or Trello to teach Lean.', 'So, I think it''s essential for you to break both the tone of voice, the didactics you''re using, put examples, you''ll explain something theoretical, like Lean, for example, does an exercise that simulates the Lean process, not in software, it can even be with software, it can be with blocks, use Trello, interact with the student because if you spend more than twenty minutes talking, anyway, any situation, even in a typical lecture, you lose the student, you lose the audience. Use examples with students to teach theory. For instance, we are using blocks or Trello to teach Lean.  example; theory; block; trello; lean; pause; voice; exercise; interaction; attention; lecture; sample; task; mission; concept; break; language; strategy; execution', 1, 'Use of blocks or trello for Lean teaching.', 'So, I think it''s essential for you to break both the tone of voice, the didactics you''re using, put examples, you''ll explain something theoretical, like Lean, for example, does an exercise that simulates the Lean process, not in software, it can even be with software, it can be with blocks, use Trello, interact with the student because if you spend more than twenty minutes talking, anyway, any situation, even in a typical lecture, you lose the student, you lose the audience.', NULL, false, 'example; theory; block; trello; lean; pause; voice; exercise; interaction; attention; lecture; sample; task; mission; concept; break; language; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (49, 'Seek to know in advance the needs and limitations of the class, such as installing software, for example, to create a more efficient schedule.

Identify the students'' initial level of knowledge to do the course. For example, check if students can run unit tests that will be used in the software build class.', 'Suppose it''s a class that, specifically, we were given the needs and characteristics before, such as access limitations, limited software installation on the machine. In that case, I prepare the class, and we have the schedule as a whole, which is ready; it has a beginning, middle, and an end.

If you are going to teach a software build class, for example, or unit testing, you need to assume that your class is in a certain place, let us say. You need to assume that your class is made up of developers, has a bit of knowledge and such, or you need to assume that your class does not have that much experience. Seek to know in advance the needs and limitations of the class, such as installing software, for example, to create a more efficient schedule.

Identify the students'' initial level of knowledge to do the course. For example, check if students can run unit tests that will be used in the software build class. Seek to know in advance the needs and limitations of the class. installation; schedule; knowledge; build; test; limitation; restriction; preparation', 2, 'knowledge of the needs and limitations of the class', 'Suppose it''s a class that, specifically, we were given the needs and characteristics before, such as access limitations, limited software installation on the machine. In that case, I prepare the class, and we have the schedule as a whole, which is ready; it has a beginning, middle, and an end.

If you are going to teach a software build class, for example, or unit testing, you need to assume that your class is in a certain place, let us say. You need to assume that your class is made up of developers, has a bit of knowledge and such, or you need to assume that your class does not have that much experience.', 'Seek to know in advance the needs and limitations of the class.', false, 'installation; schedule; knowledge; build; test; limitation; restriction; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (51, 'Share course prerequisites with students in advance.', 'If it''s a mixed class, we send students a document that shows them beforehand, right? What are the prerequisites for him to take the course, software, software versions, how to install, well documented. Share course prerequisites with students in advance.  sharing; prerequisite; advance; documentation; record; preparation; requisite; mandatory', 1, 'Prerequisites available beforehand.', 'If it''s a mixed class, we send students a document that shows them beforehand, right? What are the prerequisites for him to take the course, software, software versions, how to install, well documented.', NULL, false, 'sharing; prerequisite; advance; documentation; record; preparation; requisite; mandatory', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (68, 'In the theoretical part of DevOps, Lean, Kaisen, and Agile should be taught.', 'We need to talk about the theoretical part about Lean, which is the Toyota method, Kaisen is also very important, Agile which is significantly linked to the DevOps process. In the theoretical part of DevOps, Lean, Kaisen, and Agile should be taught.  theory; kaisen; lean; agile; concept; curriculum; syllabus', 1, 'teaching from Lean, Kaisen and Agile on the theoretical part', 'We need to talk about the theoretical part about Lean, which is the Toyota method, Kaisen is also very important, Agile which is significantly linked to the DevOps process.', NULL, true, 'theory; kaisen; lean; agile; concept; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (69, 'Make software from start to finish, going through the DevOps steps to the monitoring step.', 'What is practical, from the menu, is to make an end-to-end software, [...] But, end-to-end, and the end, which is monitoring. Make software from start to finish, going through the DevOps steps to the monitoring step.  process; monitoring; incremental; progress; technique; curriculum; syllabus; supervision; evolution; skill', 1, 'Development of software across all steps from DevOps.', 'What is practical, from the menu, is to make an end-to-end software, [...] But, end-to-end, and the end, which is monitoring.', NULL, true, 'process; monitoring; incremental; progress; technique; curriculum; syllabus; supervision; evolution; skill', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (52, 'Create student support examples and guidelines, breaks into parts to go through the steps gradually.

Create examples and guidelines to help students develop their solution based on it.

We''re building a couple of tutorials so that the ones that have less experience can look at it.', 'These are documents that we send in separate stages of the course [...]. We break the infrastructure documents to do the Kaisen process within Lean-to unify the documentation so that the student understands the difficulty he faced and the problem he faces daily.

But it''s been billed according to the right guidelines that we want them to use. So they can borrow heavily from the sample. They can see sample testifies, sample integration test, sample Docker files, componentization, et cetera.

We''re building a couple of tutorials so that, you know, the ones that have less experience with certainly the testing can look at it. Create student support examples and guidelines, breaks into parts to go through the steps gradually.

Create examples and guidelines to help students develop their solution based on it.

We''re building a couple of tutorials so that the ones that have less experience can look at it. Create tutorials to help students. tutorial; example; guideline; documentation; material; sample; environment; setup; record', 3, 'Separation in parts of support document for infrastructure configuration', 'These are documents that we send in separate stages of the course [...]. We break the infrastructure documents to do the Kaisen process within Lean-to unify the documentation so that the student understands the difficulty he faced and the problem he faces daily.

But it''s been billed according to the right guidelines that we want them to use. So they can borrow heavily from the sample. They can see sample testifies, sample integration test, sample Docker files, componentization, et cetera.

We''re building a couple of tutorials so that, you know, the ones that have less experience with certainly the testing can look at it.', 'Create tutorials to help students.', false, 'tutorial; example; guideline; documentation; material; sample; environment; setup; record', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (53, 'Simulate real problems that the student will likely face in their daily lives.

Try to simulate a real scenario employing someone in the group to insert issues and bugs in students project.', 'So we break the infrastructure documents to do the Kaisen process within Lean-to unify the documentation so that the student understands the difficulty he faced and the difficulty he will meet daily.

So we employ someone in our team, a couple of people who work on implementing that, and we created some issues in the application, like some bugs. Simulate real problems that the student will likely face in their daily lives.

Try to simulate a real scenario employing someone in the group to insert issues and bugs in students project. Simulate real problems with the students. simulation; problem; scenario; issue; bug; group; project; activity; task; mission; strategy; execution', 2, 'real problems common in the industry', 'So we break the infrastructure documents to do the Kaisen process within Lean-to unify the documentation so that the student understands the difficulty he faced and the difficulty he will meet daily.

So we employ someone in our team, a couple of people who work on implementing that, and we created some issues in the application, like some bugs.', 'Simulate real problems with the students.', false, 'simulation; problem; scenario; issue; bug; group; project; activity; task; mission; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (54, 'There is a specific support team to answer students'' questions about the related infrastructure part.', 'From a didactic point of view, we leave one or two hours before each day; there is a specific infra team to answer any student''s doubts. There is a specific support team to answer students'' questions about the related infrastructure part.  support; team; question; infrastructure; preparation', 1, 'Specific support team for infrastructure doubts.', 'From a didactic point of view, we leave one or two hours before each day; there is a specific infra team to answer any student''s doubts.', NULL, false, 'support; team; question; infrastructure; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (55, 'Avoid messing around with specific problems faced by students, dealing in a personalized way at the right time.', 'Realize how much you deviate because the student has a particular problem and loses his didactics a little. So, knowing how to limit it too, then work with the student, talk, look, and talk more calmly, because this situation is particular. There has to be a breakpoint because otherwise, you''ll lose the other students. Avoid messing around with specific problems faced by students, dealing in a personalized way at the right time.  problem; dealing; personalization; student; particular; strategy; execution', 1, 'Customization of Specific Problem Discussions Faced by Students', 'Realize how much you deviate because the student has a particular problem and loses his didactics a little. So, knowing how to limit it too, then work with the student, talk, look, and talk more calmly, because this situation is particular. There has to be a breakpoint because otherwise, you''ll lose the other students.', NULL, false, 'problem; dealing; personalization; student; particular; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (56, 'Use a task tracking tool like Trello or Notion.', 'A task tracking tool. Then it can be Notion or Trello; I think it''s essential. Use a task tracking tool like Trello or Notion.  task; tracking; trello; notion; mission; tool; technology', 1, 'Task Tracking Tools', 'A task tracking tool. Then it can be Notion or Trello; I think it''s essential.', NULL, false, 'task; tracking; trello; notion; mission; tool; technology', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (57, 'Use a streaming tool like Zoom, Google Meet, or Webex in remote learning scenario.

Use Zoom in remote learning scenario.', 'There must always be two tools, the stream that would be the zoom, Google Meet, any device that does that, Webex I don''t know, it depends on the company.

Because of the remote learning  [...] I''ve been teaching my classes on zoom. Use a streaming tool like Zoom, Google Meet, or Webex in remote learning scenario.

Use Zoom in remote learning scenario. Use streaming tool like Zoom in remote learning scenario. streaming; zoom; google meet; webex; remote; tool; technology', 2, 'Use a Stream Tool as Zoom, Google Meet or WebEx', 'There must always be two tools, the stream that would be the zoom, Google Meet, any device that does that, Webex I don''t know, it depends on the company.

Because of the remote learning  [...] I''ve been teaching my classes on zoom.', 'Use streaming tool like Zoom in remote learning scenario.', false, 'streaming; zoom; google meet; webex; remote; tool; technology', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (58, 'The Notion tool allows exporting to Markdown, enabling the versioning of documentation for each day of the course: all executed commands and additional content.', 'I prefer Notion even though I work for Trello''s company; I prefer Notion for a reason. I can export it in Markdown and directly version all documentation. So, for each day of the course, all the commands that we run or the additional content, I list them, interact with them, and interact together. The Notion tool allows exporting to Markdown, enabling the versioning of documentation for each day of the course: all executed commands and additional content.  notion; markdown; versioning; documentation; material; command; tool; technology; record', 1, 'Exportation to Markdown and Version from the Notion', 'I prefer Notion even though I work for Trello''s company; I prefer Notion for a reason. I can export it in Markdown and directly version all documentation. So, for each day of the course, all the commands that we run or the additional content, I list them, interact with them, and interact together.', NULL, false, 'notion; markdown; versioning; documentation; material; command; tool; technology; record', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (59, 'Use a code repository tool like Gitlab or Github.

Use Github with access to students accounts repositories.

Make public access the content of the course using the GitHub.

Use Github to record grading, pull requests and discussions between teacher assistants and the students.

Use github, gitlab or bitbucket as version control system tools adopted by the course.', 'And a code repository, you can GitLab, Github, which you can share with students, this situation.

They use GitHub. .. The only thing we really need is that the students give us, uh, access to their accounts.

This course has a very specific structure, which is not usual. Uh, the structure is that, uh, everything. Um, I think you have access to our GitHub repository and everything is, uh, available.

Everything in this course was, uh, was, uh, done through the GitHub repository, there are many issues, there are many pull requests and the discussions between TAs and the students and grading everything is there.

The student had to have the code that goes so git as a version control system, uh, GitHub GitLab, the, we had a Bitbucket on-premise also, uh, deployed inside the school. Use a code repository tool like Gitlab or Github.

Use Github with access to students accounts repositories.

Make public access the content of the course using the GitHub.

Use Github to record grading, pull requests and discussions between teacher assistants and the students.

Use github, gitlab or bitbucket as version control system tools adopted by the course. Use a code repository tool like Github. repository; gitlab; github; versioning; pull request; discussion; issue; tool; technology; automation; conversation', 4, 'Use of code versioning tools', 'And a code repository, you can GitLab, Github, which you can share with students, this situation.

They use GitHub. .. The only thing we really need is that the students give us, uh, access to their accounts.

This course has a very specific structure, which is not usual. Uh, the structure is that, uh, everything. Um, I think you have access to our GitHub repository and everything is, uh, available.

Everything in this course was, uh, was, uh, done through the GitHub repository, there are many issues, there are many pull requests and the discussions between TAs and the students and grading everything is there.

The student had to have the code that goes so git as a version control system, uh, GitHub GitLab, the, we had a Bitbucket on-premise also, uh, deployed inside the school.', 'Use a code repository tool like Github.', false, 'repository; gitlab; github; versioning; pull request; discussion; issue; tool; technology; automation; conversation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (60, 'Use a Continuous Integration tool. in particular, Jenkins is open source and very widespread. 

Use Jenkins to do continuous integration.

Use Jenkins.

Uses Jenkins through a Docker image.

Jenkins can be chosen as DevOps tool.

Jenkins can be use as continuous integration tool because it is free and lot of companies use it.

Use tools like Jenkins to have more control on support the deployment.', 'We usually use Jenkins as an integration tool because it''s open-source, it''s everywhere, despite having other devices that do the job even better, but it''s spread out, it''s ancient.

The software [...] built with Jenkins.

Jenkins, you do not pay anything, you install it on your server, and it has gone.

They need Jenkins. So either you tell them to go install Jenkins, or what I''ve done is I say, Hey, here''s a Docker image for Jenkins.

Now I realize every day that I need testing and continuous, I mean, Jenkins is my friend.

And, and, uh, so in terms of the continuous integration server, and there are many different services available, but can we use Jenkins because it is a, it is free and, and a lot of companies are using, but there are some other options that can be used.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff. Use a Continuous Integration tool. in particular, Jenkins is open source and very widespread. 

Use Jenkins to do continuous integration.

Use Jenkins.

Uses Jenkins through a Docker image.

Jenkins can be chosen as DevOps tool.

Jenkins can be use as continuous integration tool because it is free and lot of companies use it.

Use tools like Jenkins to have more control on support the deployment. Use Jenkins tool. jenkins; continuous integration; deployment; pipeline; tool; technology; automation; gradual; ci', 5, 'Use of Jenkins.', 'We usually use Jenkins as an integration tool because it''s open-source, it''s everywhere, despite having other devices that do the job even better, but it''s spread out, it''s ancient.

The software [...] built with Jenkins.

Jenkins, you do not pay anything, you install it on your server, and it has gone.

They need Jenkins. So either you tell them to go install Jenkins, or what I''ve done is I say, Hey, here''s a Docker image for Jenkins.

Now I realize every day that I need testing and continuous, I mean, Jenkins is my friend.

And, and, uh, so in terms of the continuous integration server, and there are many different services available, but can we use Jenkins because it is a, it is free and, and a lot of companies are using, but there are some other options that can be used.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff.', 'Use Jenkins tool.', true, 'jenkins; continuous integration; deployment; pipeline; tool; technology; automation; gradual; ci', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (61, 'Notion and Trello allow student and teacher interaction in two ways. Gist does not allow it.', 'Notion or Trello [...], you need to have a two-way tool where you and the student interact. Not a Gist, for example, because the Gist, although you can only release it because the student needs to put their feedback there too. [...] There are some tasks that we set up there, a post mortem of the process that fails; I need a feedback tool that the student can also interact with. Notion and Trello allow student and teacher interaction in two ways. Gist does not allow it.  notion; trello; interaction; communication; feedback; gist; conversation; tool; technology; discussion; answer', 1, 'Notion and Trello allow two-way iteration but Gist only one', 'Notion or Trello [...], you need to have a two-way tool where you and the student interact. Not a Gist, for example, because the Gist, although you can only release it because the student needs to put their feedback there too. [...] There are some tasks that we set up there, a post mortem of the process that fails; I need a feedback tool that the student can also interact with.', NULL, false, 'notion; trello; interaction; communication; feedback; gist; conversation; tool; technology; discussion; answer', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (62, 'Limit the zoom FPS rate to 10, avoiding excessive student and instructor resource consumption.', 'So, I usually recommend it to instructors; I recommend it to students when they share it with me. Decrease the FPF rate of screen sharing because that''s a lock. Zoom uses what it can if you don''t limit it. So, we restrict ten FPS, for example, so that I don''t consume too much of my or the student''s CPU because I sometimes have to correct the exercise on his side. Limit the zoom FPS rate to 10, avoiding excessive student and instructor resource consumption.  zoom; remote; computing resource; tool; technology', 1, 'Mitigation of excessive resource consumption by limiting the fps zoom rate', 'So, I usually recommend it to instructors; I recommend it to students when they share it with me. Decrease the FPF rate of screen sharing because that''s a lock. Zoom uses what it can if you don''t limit it. So, we restrict ten FPS, for example, so that I don''t consume too much of my or the student''s CPU because I sometimes have to correct the exercise on his side.', NULL, false, 'zoom; remote; computing resource; tool; technology', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (63, 'Individually assess the student''s progress throughout the course.

Grade students based on their learning journey and mistakes, not on what they submit. What''s important is how they get there, because every failure is learning opportunity.

Grade based how the students working their tasks and not only what they are submitting.

For the assessment, the students can make mistakes in the beginning without fear of being penalized.

Students can fix their code problems. In industry, we keep coding until it works. It also provides a little less pressure on students.

Do not focus your assessment on right versus wrong answers.

Create an environment that students feel comfortable with sharing about their mistakes and learn how with their teammates.', 'It would help if you observed each student and, and then, you have to listen a lot, too, what was the difficulty he had and where he arrived. So, then, we do a final assessment per student, but our perception of it. If he did well, if he had a lot of doubt, what was the point that generated the most suspicion for him?

I tell them, I am not going to grade you on what you submit. I''m going to grade you on how you got there because getting there is not the point. It''s the journey, right? That''s the point. [...] I teach them that every failure is a learning opportunity. If you fail and you learn something, you get credit. It''s not a failure because you''ve learned something, we''re here to learn.

You can''t just grade what they submit. You have to watch how they''re working.

For the assessment, as I said, I give them a lot of leeway in the beginning. Um, they can make mistakes on their Kanban board and still get full credit if they know what the mistakes are that they made. However, in later sprints, if they make the same mistakes, then I start taking points off.  So I give them time to learn, uh, so that they feel that they can make a few mistakes, take a few risks, um, and not get penalized for it.

 If there''s problems, I''ll tell you where there''s problems and you can go fix it, go get it, right. Go, go make it, do what it''s supposed to do. You know, because in industry we''re, we don''t just get a one and done shot. We keep at it until it works. And so I bring that to the table and I think that provides a little less pressure on students.

I tend not to get quite as hyper-focused on right versus wrong answers. ... so treating it as, as more of an assessment of maybe architecture, if you will, or an assessment of approach, as opposed to this is right, this is wrong. Uh, I think that''s been fairly well received.

So people need to feel comfortable sharing, if they''ve made a mistake or not thinking that they''re gonna have their headquarters. Right. Um, so when talking about that, if students have never worked in the context where, you know, people are blaming each other and stuff, it''s difficult to understand I, to, to be concrete. And this is so crucial. Individually assess the student''s progress throughout the course.

Grade students based on their learning journey and mistakes, not on what they submit. What''s important is how they get there, because every failure is learning opportunity.

Grade based how the students working their tasks and not only what they are submitting.

For the assessment, the students can make mistakes in the beginning without fear of being penalized.

Students can fix their code problems. In industry, we keep coding until it works. It also provides a little less pressure on students.

Do not focus your assessment on right versus wrong answers.

Create an environment that students feel comfortable with sharing about their mistakes and learn how with their teammates. Grade students based on their learning journey and mistakes. What''s important is how they get there, because every failure is learning opportunity. grade; assessment; mistake; failure; difficulty; task; coding; answer; team; mission; solution; evaluation; score; justification', 4, 'Individual assessment of students.', 'It would help if you observed each student and, and then, you have to listen a lot, too, what was the difficulty he had and where he arrived. So, then, we do a final assessment per student, but our perception of it. If he did well, if he had a lot of doubt, what was the point that generated the most suspicion for him?

I tell them, I am not going to grade you on what you submit. I''m going to grade you on how you got there because getting there is not the point. It''s the journey, right? That''s the point. [...] I teach them that every failure is a learning opportunity. If you fail and you learn something, you get credit. It''s not a failure because you''ve learned something, we''re here to learn.

You can''t just grade what they submit. You have to watch how they''re working.

For the assessment, as I said, I give them a lot of leeway in the beginning. Um, they can make mistakes on their Kanban board and still get full credit if they know what the mistakes are that they made. However, in later sprints, if they make the same mistakes, then I start taking points off.  So I give them time to learn, uh, so that they feel that they can make a few mistakes, take a few risks, um, and not get penalized for it.

 If there''s problems, I''ll tell you where there''s problems and you can go fix it, go get it, right. Go, go make it, do what it''s supposed to do. You know, because in industry we''re, we don''t just get a one and done shot. We keep at it until it works. And so I bring that to the table and I think that provides a little less pressure on students.

I tend not to get quite as hyper-focused on right versus wrong answers. ... so treating it as, as more of an assessment of maybe architecture, if you will, or an assessment of approach, as opposed to this is right, this is wrong. Uh, I think that''s been fairly well received.

So people need to feel comfortable sharing, if they''ve made a mistake or not thinking that they''re gonna have their headquarters. Right. Um, so when talking about that, if students have never worked in the context where, you know, people are blaming each other and stuff, it''s difficult to understand I, to, to be concrete. And this is so crucial.', 'Grade students based on their learning journey and mistakes. What''s important is how they get there, because every failure is learning opportunity.', true, 'grade; assessment; mistake; failure; difficulty; task; coding; answer; team; mission; solution; evaluation; score; justification', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (71, 'Use Grafana and Prometheus as monitoring tools.', 'The software [...] a monitoring tool, in the end, for you to look at. [...] Look at a Grafana, for example, with Prometheus, which is free software, like that. Use Grafana and Prometheus as monitoring tools.  grafana; prometheus; monitoring; tool; technology; automation; supervision', 1, 'Grafana and Prometheus as monitoring tools', 'The software [...] a monitoring tool, in the end, for you to look at. [...] Look at a Grafana, for example, with Prometheus, which is free software, like that.', NULL, true, 'grafana; prometheus; monitoring; tool; technology; automation; supervision', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (72, 'Use a complete example project from places such as a java discussion forum.', 'Of the menu is to make an end-to-end software, to understand the software in its conception. We already deliver this to the student, ready. Because we''re not going to create the software from scratch, because the code is already kind of polished, it''s a code from a forum in Java, where we have some features that depend on the machine to do the build, so we''re going to decouple. Use a complete example project from places such as a java discussion forum.  example; project; forum; discussion; sample; activity; task; mission; conversation; strategy; execution', 1, 'Exemplification from forum projects.', 'Of the menu is to make an end-to-end software, to understand the software in its conception. We already deliver this to the student, ready. Because we''re not going to create the software from scratch, because the code is already kind of polished, it''s a code from a forum in Java, where we have some features that depend on the machine to do the build, so we''re going to decouple.', NULL, false, 'example; project; forum; discussion; sample; activity; task; mission; conversation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (73, 'Carry out the following practical activities during the course: the first step is to decouple the database connection from the system code, then version the code with Git, insert continuous integration with Jenkins, and finish with constant delivery using public cloud services or tools with Ansible.', 'So, the first thing, uncouple the database connection that is versioned in the source code. You can still version the String os; although it''s not the best practice, you don''t have to comment out the code to change the environment because TomCat will read it from there. Versioning in a git, using a continuous integration like Jenkins, for example, and a constant deploy, a continuous delivery with, it can be with an Ansible, it can be with any tool you deliver or in a VM or the Cloud. Carry out the following practical activities during the course: the first step is to decouple the database connection from the system code, then version the code with Git, insert continuous integration with Jenkins, and finish with constant delivery using public cloud services or tools with Ansible.  practice; activity; exercise; coding; database; versioning; git; continuous integration; jenkins; cloud; ansible; delivery; task; mission; gradual; curriculum; syllabus; schedule; technique; skill; ci', 1, 'Practical activities in the course: bank decoupling, versioning, integration and continuous delivery', 'So, the first thing, uncouple the database connection that is versioned in the source code. You can still version the String os; although it''s not the best practice, you don''t have to comment out the code to change the environment because TomCat will read it from there. Versioning in a git, using a continuous integration like Jenkins, for example, and a constant deploy, a continuous delivery with, it can be with an Ansible, it can be with any tool you deliver or in a VM or the Cloud.', NULL, true, 'practice; activity; exercise; coding; database; versioning; git; continuous integration; jenkins; cloud; ansible; delivery; task; mission; gradual; curriculum; syllabus; schedule; technique; skill; ci', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (74, 'Provide a comfortable learning environment for the student, such as remote teaching, which requires adequate audio and video equipment.', 'Make it very clear, pedagogically, that I think it involves an exemplary sound configuration so that the student can hear you well, always with the camera open, even if the student doesn''t open it, because he can''t, but let him see you, that he feels this approach as much as possible. Provide a comfortable learning environment for the student, such as remote teaching, which requires adequate audio and video equipment.  environment; remote; audio; video; strategy; execution', 1, 'Comfortable student learning environment in remote', 'Make it very clear, pedagogically, that I think it involves an exemplary sound configuration so that the student can hear you well, always with the camera open, even if the student doesn''t open it, because he can''t, but let him see you, that he feels this approach as much as possible.', NULL, false, 'environment; remote; audio; video; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (75, 'Show the student that there are several ways and tools to do the task.

Teach in a way that knowledge can be applied in different tools, but not focus on the possible specific problems of each technology.', 'Within the menu, try to avoid making the student dependent on that stack you are teaching. So, if you''re going to explain Jenkins, take half an hour to explain the pipeline in another tool, so he can see that it''s possible. So he doesn''t come out with the recipe ready. As much as we don''t deliver it, the student creates a recipe in his head, and it won''t fit in all of his daily routines. Then it will generate frustration. So, make it clear, look, can you see what we''re doing? We''re doing it for that reason, at Jenkins. Today we are going to use Bitbucket, for example, which is how we do it. One, as an example, correct?

They said: teacher, I can do it in such language, I can do it in such a platform, can I do it like this? [...] So, I am not going to say that there were, I do not know, six, seven, different environments, right? That there was, but let us put two or three, right, different ones. So, for us, professors, we are often not proficient in all of these, right? So, then the person will have to clarify a doubt, then you say: man, I don''t know. So, you decided to do it there, you kind of jump up, like, you know? The most we can do is try to convey the concepts, right? And when the person has a very big doubt like that, you say, boy, try to explain to me how this technology is there that you are using see if I can at least translate the things that I know, that is it. Show the student that there are several ways and tools to do the task.

Teach in a way that knowledge can be applied in different tools, but not focus on the possible specific problems of each technology. Show the student that there are several ways and tools to do the task. teaching method; knowledge; problem; tool; technology; automation; issue', 2, 'clear diversity of possible tools to perform a task.', 'Within the menu, try to avoid making the student dependent on that stack you are teaching. So, if you''re going to explain Jenkins, take half an hour to explain the pipeline in another tool, so he can see that it''s possible. So he doesn''t come out with the recipe ready. As much as we don''t deliver it, the student creates a recipe in his head, and it won''t fit in all of his daily routines. Then it will generate frustration. So, make it clear, look, can you see what we''re doing? We''re doing it for that reason, at Jenkins. Today we are going to use Bitbucket, for example, which is how we do it. One, as an example, correct?

They said: teacher, I can do it in such language, I can do it in such a platform, can I do it like this? [...] So, I am not going to say that there were, I do not know, six, seven, different environments, right? That there was, but let us put two or three, right, different ones. So, for us, professors, we are often not proficient in all of these, right? So, then the person will have to clarify a doubt, then you say: man, I don''t know. So, you decided to do it there, you kind of jump up, like, you know? The most we can do is try to convey the concepts, right? And when the person has a very big doubt like that, you say, boy, try to explain to me how this technology is there that you are using see if I can at least translate the things that I know, that is it.', 'Show the student that there are several ways and tools to do the task.', false, 'teaching method; knowledge; problem; tool; technology; automation; issue', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (76, 'Use a simple example system made by students.

Students build their own systems during the course in order to increase their understanding of automation.', 'I ask the students to implement a straightforward system, which will serve the entire subject. In this minor system, we''re going to have tested; there''s going to be built, there''s going to be continuous integration, there''s going to be deployment, you know?

This part of the system, which I ask them to do to monitor the discipline [...] When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe for you to understand all the automation and such. However, at the same time, I see that the guys have much difficulty in doing it. Use a simple example system made by students.

Students build their own systems during the course in order to increase their understanding of automation. The students could build their own system during the course. example; application; system; build; automation; sample; technology; strategy; execution', 1, 'Development of systems during discipline by students ', 'I ask the students to implement a straightforward system, which will serve the entire subject. In this minor system, we''re going to have tested; there''s going to be built, there''s going to be continuous integration, there''s going to be deployment, you know?

This part of the system, which I ask them to do to monitor the discipline [...] When you go to configure the tools and such, as you were the one who developed the system, it becomes easier, I believe for you to understand all the automation and such. However, at the same time, I see that the guys have much difficulty in doing it.', 'The students could build their own system during the course.', true, 'example; application; system; build; automation; sample; technology; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (78, 'Use various sources of DevOps study materials, such as gray literature, blog (medium, Nubank, Netflix).

It is necessary to make use of several sources when creating the course.

Information in gray literature is more interesting to illustrate DevOps use cases: posts on INFO2, Metzone, Hacker News, Twitter, Airbnb case studies, Glitch, Orbitz.', 'Because you have to have the mentality that you will have to get materials from different sources, right? ... you''ll have to resort to gray literature, right, which is this literature from the blog, the medium, the Nubank or Netflix blog, which are sensational articles, but that don''t have that scientific rigor, peer review, and such. So, like, I think the DevOps teacher needs to understand that he''s in this environment, right?

Material heterogeneity is the biggest challenge [...] you have to set up a class sewing the fonts. So, sometimes, for example, in my integration course, I have to give several concepts, right? For you to talk about continuous integration, you need to talk about version control. You need to talk about build. You need to talk about testing. There are several things that are part of continuous integration, right? So, git-flow is not in the book, you know? Branch, development models, that''s not in the book.

Most of the references, the most interesting cases that I considered bringing to the room are posts on INFO2, on Metzone, Hacker News, Twitter posts, Airbnb case study, Glitch, Orbitz, and such; other cases of those that are much more interesting than necessarily, books or scientific academic articles. Use various sources of DevOps study materials, such as gray literature, blog (medium, Nubank, Netflix).

It is necessary to make use of several sources when creating the course.

Information in gray literature is more interesting to illustrate DevOps use cases: posts on INFO2, Metzone, Hacker News, Twitter, Airbnb case studies, Glitch, Orbitz. Use various sources of DevOps materials. material; gray literature; blog; diversity; record; preparation; documentation', 2, 'Use of miscellaneous DevOps study materials.', 'Because you have to have the mentality that you will have to get materials from different sources, right? ... you''ll have to resort to gray literature, right, which is this literature from the blog, the medium, the Nubank or Netflix blog, which are sensational articles, but that don''t have that scientific rigor, peer review, and such. So, like, I think the DevOps teacher needs to understand that he''s in this environment, right?

Material heterogeneity is the biggest challenge [...] you have to set up a class sewing the fonts. So, sometimes, for example, in my integration course, I have to give several concepts, right? For you to talk about continuous integration, you need to talk about version control. You need to talk about build. You need to talk about testing. There are several things that are part of continuous integration, right? So, git-flow is not in the book, you know? Branch, development models, that''s not in the book.

Most of the references, the most interesting cases that I considered bringing to the room are posts on INFO2, on Metzone, Hacker News, Twitter posts, Airbnb case study, Glitch, Orbitz, and such; other cases of those that are much more interesting than necessarily, books or scientific academic articles.', 'Use various sources of DevOps materials.', true, 'material; gray literature; blog; diversity; record; preparation; documentation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (79, 'Deliver a ready-made sample system for students to use.

Using an example system designed by the teacher will give more confidence in supporting students during the course.', 'This part of the system, which I ask them to do to follow the discipline, [...] I''m seriously thinking about the idea of ​​simply giving them a system.

If I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such. Deliver a ready-made sample system for students to use.

Using an example system designed by the teacher will give more confidence in supporting students during the course. Deliver a ready-made sample system for students to use. example; sample; application; system; strategy; execution', 1, 'provision of a finalized system for students', 'This part of the system, which I ask them to do to follow the discipline, [...] I''m seriously thinking about the idea of ​​simply giving them a system.

If I make this system, I can pass it on to people in a much simpler way, right? How do they do things and such.', 'Deliver a ready-made sample system for students to use.', false, 'example; sample; application; system; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (80, 'Provide initial environment setup for students.

Give each group a big virtual machine. And on that machine, run three or four Docker images. One with Artifactory, other with Jenkins.', 'Maybe it makes sense for you to provide the environment for the students, right? And this provision, you can use a docker of life, which comes already, right?

I ended up doing was to give each group a big virtual machine. And on that machine, they run three or four Docker images. Uh, one with Artifactory, one with Jenkins. Provide initial environment setup for students.

Give each group a big virtual machine. And on that machine, run three or four Docker images. One with Artifactory, other with Jenkins. Provide initial environment setup for students. environment; setup; virtual machine; docker; artifactory; jenkins; artifact; vm', 2, 'Initial Environment Configuration for Students', 'Maybe it makes sense for you to provide the environment for the students, right? And this provision, you can use a docker of life, which comes already, right?

I ended up doing was to give each group a big virtual machine. And on that machine, they run three or four Docker images. Uh, one with Artifactory, one with Jenkins.', 'Provide initial environment setup for students.', false, 'environment; setup; virtual machine; docker; artifactory; jenkins; artifact; vm', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (81, 'Version control with git feature branch workflow, build, continuous integration, and software testing content should be taught.

Teach git feature branch workflow.

Use git to teach how to manage the code.

Introduce the notion of digital branches and feature branches using small individual tools.', 'You need to talk about version control; you need to talk about build; you need to talk about testing; several things are part of continuous integration. So, git-flow is not in the book, you know? Branch, development models, that''s not in the book. Then you start going to blogs and such, you know? Then, you will talk about software testing; if you were a software engineering book, this part of testing is extremely weak, so it is highly conceptual; there is nothing. Then you can get the articles.

 I teach them about the git feature branch workflow.

Some of this even goes down to git right, because a lot of people coming in know something about git a lot don''t um, in many ways, my opinion, which I realize is, is probably not widely shared is that even if we were restricted from a software engineering department perspective, almost everything we''re teaching should be retooled along devops lines, uh.

We''ve introduced recently is a notion of digital branches and feature branches, for example, uh, linked to stories, but we try to just give them small individual tools. Version control with git feature branch workflow, build, continuous integration, and software testing content should be taught.

Teach git feature branch workflow.

Use git to teach how to manage the code.

Introduce the notion of digital branches and feature branches using small individual tools. Teach version control with git feature branch workflow. versioning; branch; workflow; build; continuous integration; test; git; coding; gradual; curriculum; syllabus; ci', 4, 'Teaching of version control, build, ci, gitflow and software testing.', 'You need to talk about version control; you need to talk about build; you need to talk about testing; several things are part of continuous integration. So, git-flow is not in the book, you know? Branch, development models, that''s not in the book. Then you start going to blogs and such, you know? Then, you will talk about software testing; if you were a software engineering book, this part of testing is extremely weak, so it is highly conceptual; there is nothing. Then you can get the articles.

 I teach them about the git feature branch workflow.

Some of this even goes down to git right, because a lot of people coming in know something about git a lot don''t um, in many ways, my opinion, which I realize is, is probably not widely shared is that even if we were restricted from a software engineering department perspective, almost everything we''re teaching should be retooled along devops lines, uh.

We''ve introduced recently is a notion of digital branches and feature branches, for example, uh, linked to stories, but we try to just give them small individual tools.', 'Teach version control with git feature branch workflow.', true, 'versioning; branch; workflow; build; continuous integration; test; git; coding; gradual; curriculum; syllabus; ci', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (82, 'Document the consulted material, facilitating future access.', 'Something I don''t do. I realize that I will need to do it, but it''s precisely documenting, right? Those fonts, in case you need to revisit, eh, eh, because it''s so easy, right? You open a blog and stuff, you close the tab, and it died like that. So, somehow you, you are always documenting, where you got it, where you got it from, keep these links, if you have to, if you need to revisit there in future versions of the course, I don''t know. Document the consulted material, facilitating future access.  material; documentation; reference; resource; record; preparation', 1, 'Registration of reference material documentation', 'Something I don''t do. I realize that I will need to do it, but it''s precisely documenting, right? Those fonts, in case you need to revisit, eh, eh, because it''s so easy, right? You open a blog and stuff, you close the tab, and it died like that. So, somehow you, you are always documenting, where you got it, where you got it from, keep these links, if you have to, if you need to revisit there in future versions of the course, I don''t know.', NULL, false, 'material; documentation; reference; resource; record; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (89, 'Standardize the teaching material for all classes.', 'During creation [...] Everything is already prepared, and the groups are always the same [...] it is the same booklet, the same content, the same teaching didactics, so there is no preparation for each class, you know? It was just an initial preparation. Standardize the teaching material for all classes.  material; standard; preparation', 1, 'uniformity of the didactic material of the classes', 'During creation [...] Everything is already prepared, and the groups are always the same [...] it is the same booklet, the same content, the same teaching didactics, so there is no preparation for each class, you know? It was just an initial preparation.', NULL, false, 'material; standard; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (83, 'Use Jenkins, Travis CI, Circle CI and Github Actions in teaching continuous integration.

Teach continuous integration using travis to automatically run the test cases.

Use Travis CI for the pipeline.

Do automation with Github actions.

Use Jenkins, GitLab, or Github Actions as pipeline orchestration tools adopted by the course.', 'For this part of continuous integration, [...] When you talk about continuous integration, there are several tools you can use. So, you can use Jenkins; you can use Travis; you can use Circle CI, now Github Actions is here, you know?

And then I teach them, CI continuous integration. I show them how to use Travis to automatically run the test cases.

From a tooling point of view, um, for the pipeline, we, we recommend Travis CI.

There are many checks in this course, we had to make sure that the students had done this and that, and that these, uh, checks could be, uh, automatized by your students. And they had, they added some GitHub actions and to the repository.

I want the code to go through a pipeline. It could be Jenkins. It could be github actions. It could be gitlab workflow. It could be GitHub action. Use Jenkins, Travis CI, Circle CI and Github Actions in teaching continuous integration.

Teach continuous integration using travis to automatically run the test cases.

Use Travis CI for the pipeline.

Do automation with Github actions.

Use Jenkins, GitLab, or Github Actions as pipeline orchestration tools adopted by the course. Teach continuous integration and pipeline automation. jenkins; travis; circle ci; github; actions; continuous integration; gitlab; pipeline; orchestration; tool; technology; automation; gradual; ci', 5, 'Jenkins Tools, Travis Ci, Circle Ci and Github Action in Continuous Integration Teaching', 'For this part of continuous integration, [...] When you talk about continuous integration, there are several tools you can use. So, you can use Jenkins; you can use Travis; you can use Circle CI, now Github Actions is here, you know?

And then I teach them, CI continuous integration. I show them how to use Travis to automatically run the test cases.

From a tooling point of view, um, for the pipeline, we, we recommend Travis CI.

There are many checks in this course, we had to make sure that the students had done this and that, and that these, uh, checks could be, uh, automatized by your students. And they had, they added some GitHub actions and to the repository.

I want the code to go through a pipeline. It could be Jenkins. It could be github actions. It could be gitlab workflow. It could be GitHub action.', 'Teach continuous integration and pipeline automation.', true, 'jenkins; travis; circle ci; github; actions; continuous integration; gitlab; pipeline; orchestration; tool; technology; automation; gradual; ci', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (84, 'The difficulties of configuring CI tools like Jenkins are essential to student learning, facilitating a future transition to cloud CI tools.', 'Jenkins, let''s put it this way, he, even though he''s challenging because he''s not the easiest thing in the world to set up. These pains, I also think it''s essential for the guys [...] Jenkins you don''t pay anything [...] These pains, I also believe it is necessary for the guys when you get something a CI that works in the cloud and such, notice, hey, look how easy. The difficulties of configuring CI tools like Jenkins are essential to student learning, facilitating a future transition to cloud CI tools.  ci; jenkins; cloud; tool; technology; automation; continuous integration', 1, 'CI tools, like Jenkins, during the transition to cloud CI tools.', 'Jenkins, let''s put it this way, he, even though he''s challenging because he''s not the easiest thing in the world to set up. These pains, I also think it''s essential for the guys [...] Jenkins you don''t pay anything [...] These pains, I also believe it is necessary for the guys when you get something a CI that works in the cloud and such, notice, hey, look how easy.', NULL, true, 'ci; jenkins; cloud; tool; technology; automation; continuous integration', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (85, 'Introduce students to minimal relevant tools and their tradeoffs.

Use few key tools.', 'The recommendation would be that it would be to get tools that are minimally relevant, right? And so that you can present the different cost-benefits of each one.

I try to pick a few key ones. Introduce students to minimal relevant tools and their tradeoffs.

Use few key tools. Use few key tools. minimal; relevant; tradeoff; balance; tool; technology; automation', 2, 'Relevant tools and their costs Benefits', 'The recommendation would be that it would be to get tools that are minimally relevant, right? And so that you can present the different cost-benefits of each one.

I try to pick a few key ones.', 'Use few key tools.', true, 'minimal; relevant; tradeoff; balance; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (86, 'Use assessment writing of basic concepts and DevOps culture so that students can express what they understand in their own words.

Keep the exam questions mostly conceptual and about participation in the project in the final exam. 

The exams have more conceptual or philosophical elements.', 'I always pass some written evaluation of the basic concepts [...] I like the students to express in their own words what they understood [...] mainly from the cultural part.

 And the final exam, I keep, I keep the questions mostly conceptual, right. Because let''s face it. If you understand the concepts, you can Google the details, right. But you don''t know the concepts, you don''t know what the Google, right. ... I do put some questions in that they would have only learned had they participated in the project.

The exams are really more the conceptual or philosophical elements stuff, where there is a little more of a, a cut and dry response, or at least I try to structure them that way. Use assessment writing of basic concepts and DevOps culture so that students can express what they understand in their own words.

Keep the exam questions mostly conceptual and about participation in the project in the final exam. 

The exams have more conceptual or philosophical elements. Do exams with more conceptual questions. culture; mindset; writing; concept; theory; skill; assessment; technique; evaluation', 3, 'Written evaluation of the Basic and Culture DevOps concept', 'I always pass some written evaluation of the basic concepts [...] I like the students to express in their own words what they understood [...] mainly from the cultural part.

 And the final exam, I keep, I keep the questions mostly conceptual, right. Because let''s face it. If you understand the concepts, you can Google the details, right. But you don''t know the concepts, you don''t know what the Google, right. ... I do put some questions in that they would have only learned had they participated in the project.

The exams are really more the conceptual or philosophical elements stuff, where there is a little more of a, a cut and dry response, or at least I try to structure them that way.', 'Do exams with more conceptual questions.', true, 'culture; mindset; writing; concept; theory; skill; assessment; technique; evaluation', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (87, 'It is possible to break the teaching of DevOps into various disciplines in a DevOps specialization course.', 'DevOps [...] In the specialization course [...] you can break all this content into more extensive disciplines. It is possible to break the teaching of DevOps into various disciplines in a DevOps specialization course.  discipline; specialization course; curriculum; syllabus', 1, 'Division of the course of DevOps in various disciplines.', 'DevOps [...] In the specialization course [...] you can break all this content into more extensive disciplines.', NULL, true, 'discipline; specialization course; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (88, 'The basics of building, testing, deploying, and monitoring should be present in a DevOps course.

Not just focus on the current, but teach the basics of DevOps and older technologies to a better understanding.', 'So, there are some things that you cannot miss. All, if you see the cute little DevOps cycle figure there, right? All that part of compiling, testing, making, monitoring, and evaluating, I think all of this needs to be charged in some way; it has to come in somehow.

I would have some more, uh, time for, uh, for basics of, uh, basics of DevOps and the old technologies, and not only focus on the things that are, uh, that are very novel and very being developed right now. So, uh, because that would give students a better opportunity to, uh, understand the, uh, the other things as well. The basics of building, testing, deploying, and monitoring should be present in a DevOps course.

Not just focus on the current, but teach the basics of DevOps and older technologies to a better understanding. The basics of building, testing, deploying, and monitoring should be present in a DevOps course. build; test; deployment; monitoring; concept; theory; curriculum; syllabus; supervision', 2, 'Build, test, deployment, and monitoring on a course DevOps', 'So, there are some things that you cannot miss. All, if you see the cute little DevOps cycle figure there, right? All that part of compiling, testing, making, monitoring, and evaluating, I think all of this needs to be charged in some way; it has to come in somehow.

I would have some more, uh, time for, uh, for basics of, uh, basics of DevOps and the old technologies, and not only focus on the things that are, uh, that are very novel and very being developed right now. So, uh, because that would give students a better opportunity to, uh, understand the, uh, the other things as well.', 'The basics of building, testing, deploying, and monitoring should be present in a DevOps course.', true, 'build; test; deployment; monitoring; concept; theory; curriculum; syllabus; supervision', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (90, 'It is necessary to choose which topics and tools are essential as the course time is limited.', 'Training is limited [...] we will have to cut it, right? Focuses on tools, but which tools. So, this was a big challenge, so to think about which themes are essential, which means to teach, within each piece, right? It is necessary to choose which topics and tools are essential as the course time is limited.  time; selection; tool; preparation; choice; adoption', 1, 'Prioritization of teaching more essential tools.', 'Training is limited [...] we will have to cut it, right? Focuses on tools, but which tools. So, this was a big challenge, so to think about which themes are essential, which means to teach, within each piece, right?', NULL, false, 'time; selection; tool; preparation; choice; adoption', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (91, 'Research market tools on Twitter, discussion groups, Google Trends, as they are probably the tools that students are used to using and will take advantage of in their work.

Use the most relevant tools on the market like Docker.

Use popular industry tools.

Teach tools that will help to get a job.

Use representative open source industrial tools.

Use as much as possible relevant industry tools.

Prefer to use open source technologies.', 'the recommendation is to look at the market, search, see on Twitter, discussion groups, see what''s hot on Google Trends. To know how to choose a tool that is more popular, right? That it is used more and that more people can enjoy the content there, right? Because they are tools they are already used to using.

The recommendation is to see what the market is using, right? Moreover, trying to go with what is most used, like, it was no use messing with CRIO if everyone uses Docker.

 I also try to use a set of tools that are popular in the industry.

It is very critical to teach them tools that are relevant and tools that will help them get a job.

Setting up good logging monitoring notifications, some of these other open source tools that provide that kind of those kinds of capabilities. ... So I try to pick a representative sample open source, always cause I don''t want people to be buying things.

 I try to use as much as possible with tools that people use in industry and companies.

I wanted to go with open source technologies so I can explain later how we build the labs. Research market tools on Twitter, discussion groups, Google Trends, as they are probably the tools that students are used to using and will take advantage of in their work.

Use the most relevant tools on the market like Docker.

Use popular industry tools.

Teach tools that will help to get a job.

Use representative open source industrial tools.

Use as much as possible relevant industry tools.

Prefer to use open source technologies. Use relevant industry tools. relevant; industry; open source; research; popular; representative; market; tool; technology; automation; standard', 6, 'industry relevant tools', 'the recommendation is to look at the market, search, see on Twitter, discussion groups, see what''s hot on Google Trends. To know how to choose a tool that is more popular, right? That it is used more and that more people can enjoy the content there, right? Because they are tools they are already used to using.

The recommendation is to see what the market is using, right? Moreover, trying to go with what is most used, like, it was no use messing with CRIO if everyone uses Docker.

 I also try to use a set of tools that are popular in the industry.

It is very critical to teach them tools that are relevant and tools that will help them get a job.

Setting up good logging monitoring notifications, some of these other open source tools that provide that kind of those kinds of capabilities. ... So I try to pick a representative sample open source, always cause I don''t want people to be buying things.

 I try to use as much as possible with tools that people use in industry and companies.

I wanted to go with open source technologies so I can explain later how we build the labs.', 'Use relevant industry tools.', false, 'relevant; industry; open source; research; popular; representative; market; tool; technology; automation; standard', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (94, 'Use the simplest tools chosen by the market as a method of selecting the tools that will be adopted during the course.

Use the tools like Docker and Artifactory in simplest way.', 'Which tool to choose, which one had to see, which was more standard in the market, which was more straightforward, which is even easier to teach, and how to fit it in, right?

You don''t know what is Docker yet, but here''s a common line. Just run it. And then here''s a common line to run. Artifactory you don''t know what it means, just type it like this. Um, it will give you an Artifactory that''s running. Use the simplest tools chosen by the market as a method of selecting the tools that will be adopted during the course.

Use the tools like Docker and Artifactory in simplest way. Use the DevOps tools in simplest way. market; simple; docker; artifactory; container; image; tool; technology; automation', 2, 'simplest devops tools', 'Which tool to choose, which one had to see, which was more standard in the market, which was more straightforward, which is even easier to teach, and how to fit it in, right?

You don''t know what is Docker yet, but here''s a common line. Just run it. And then here''s a common line to run. Artifactory you don''t know what it means, just type it like this. Um, it will give you an Artifactory that''s running.', 'Use the DevOps tools in simplest way.', false, 'market; simple; docker; artifactory; container; image; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (92, 'The assembly of classes should follow the following steps to use DevOps: history, motivation, problems that can be solved, and possible solutions with DevOps.', 'Of first showing the history, showing the motivation, showing the problem, and making some hooks with possible solutions that Devops was bringing, suitable? The assembly of classes should follow the following steps to use DevOps: history, motivation, problems that can be solved, and possible solutions with DevOps.  teaching method; motivation; history; problem; solution; background; preparation; issue; answer; combination', 1, 'class sequence', 'Of first showing the history, showing the motivation, showing the problem, and making some hooks with possible solutions that Devops was bringing, suitable?', NULL, true, 'teaching method; motivation; history; problem; solution; background; preparation; issue; answer; combination', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (93, 'Use a programming language that the teacher knows.', 'So, we ended up choosing Java because it is the greatest strength; ours, that was Java. Use a programming language that the teacher knows.  coding; programming; tool; technology; automation', 1, 'Use of a comfortable programming language for the teacher', 'So, we ended up choosing Java because it is the greatest strength; ours, that was Java.', NULL, true, 'coding; programming; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (95, 'Monitor student progress throughout training by conducting a traditional assessment.', 'We don''t evaluate, [...] but we keep observing, right, the students, and such throughout the training. Monitor student progress throughout training by conducting a traditional assessment.  monitoring; progress; traditional; assessment; evaluation; supervision; evolution', 1, 'Monitoring rather than traditional evaluation', 'We don''t evaluate, [...] but we keep observing, right, the students, and such throughout the training.', NULL, false, 'monitoring; progress; traditional; assessment; evaluation; supervision; evolution', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (96, 'Contextualize the historical aspects and definition of continuous integration, continuous delivery, continuous deployment, and automation concepts.', 'One important thing for me, which became apparent during my studies, is that I had to show the background, the motivation somehow, so I wanted to fit it in any way in the curriculum at the beginning, showing the history of software development [...] include these topics, like, more historical, which are not good, are not technical, right? But in a way that isn''t too boring, you also [...] have to fit this with the technical part [...] With concepts of continuous integration, continuous delivery, continuous deployment, tools, automation, anyway. Contextualize the historical aspects and definition of continuous integration, continuous delivery, continuous deployment, and automation concepts.  history; continuous integration; continuous delivery; continuous deployment; automation; concept; theory; cd; gradual; technique; background; ci', 1, 'Contextualization of historical aspects and definition of concepts Continuous integration, continuous delivery, continuous deployment and automation.', 'One important thing for me, which became apparent during my studies, is that I had to show the background, the motivation somehow, so I wanted to fit it in any way in the curriculum at the beginning, showing the history of software development [...] include these topics, like, more historical, which are not good, are not technical, right? But in a way that isn''t too boring, you also [...] have to fit this with the technical part [...] With concepts of continuous integration, continuous delivery, continuous deployment, tools, automation, anyway.', NULL, true, 'history; continuous integration; continuous delivery; continuous deployment; automation; concept; theory; cd; gradual; technique; background; ci', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (97, 'It is important to show the relationship of DevOps with software development models, notably Agile.

Tie application of DevOps principles, techniques and technologies with Agile approaches.

Help students manage stories and backlog.

Make post mortem with the students to solve problems.

Use storytelling to share experience with the students.', ' I had to show the history somehow... the history of software development, showing about the processes. Cascade, RUP, agile, talk a lot about agile, because it''s related and fit these topics, so, more historical, not sound, not technical... And make a parallel, there, with the agile world with the problems that DevOps came to solve, right?

I''m trying to tie the application of the devops principles and techniques and technologies, and to, and to link that together with agile approaches, for example.

We help them manage stories, backlog. Uh, so it''s more on the front of, we give you requirements.

If you want to be able to experiment and, and to, to, to do the postmortem so that you can learn and you can solve issues and stuff.

I have to do more of this, um, story telling. ... I''m trying to share my experience with the students. It is important to show the relationship of DevOps with software development models, notably Agile.

Tie application of DevOps principles, techniques and technologies with Agile approaches.

Help students manage stories and backlog.

Make post mortem with the students to solve problems.

Use storytelling to share experience with the students. Use Agile approaches in DevOps classes. model; agile; principle; technique; story; backlog; post mortem; sotrytelling; sharing; convention; rule; approach; history', 4, ' Comparison between DevOps and software development models', ' I had to show the history somehow... the history of software development, showing about the processes. Cascade, RUP, agile, talk a lot about agile, because it''s related and fit these topics, so, more historical, not sound, not technical... And make a parallel, there, with the agile world with the problems that DevOps came to solve, right?

I''m trying to tie the application of the devops principles and techniques and technologies, and to, and to link that together with agile approaches, for example.

We help them manage stories, backlog. Uh, so it''s more on the front of, we give you requirements.

If you want to be able to experiment and, and to, to, to do the postmortem so that you can learn and you can solve issues and stuff.

I have to do more of this, um, story telling. ... I''m trying to share my experience with the students.', 'Use Agile approaches in DevOps classes.', true, 'model; agile; principle; technique; story; backlog; post mortem; sotrytelling; sharing; convention; rule; approach; history', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (98, 'Start a class with a pre-organized structure.', 'To get Everything ready to avoid problems and lose the focus and essence of the group. Start a class with a pre-organized structure.  organization; structure; class; environment; planning; setup', 1, 'Infrastructure previously organized', 'To get Everything ready to avoid problems and lose the focus and essence of the group.', NULL, false, 'organization; structure; class; environment; planning; setup', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (100, 'Relate devops to site reliability engineering (sre) for students.

Show the historical importance of DevOps and SRE concepts from the main players in the industry.', 'Working so hard on the theoretical aspects needed to understand why things in DevOps are in SRE as a whole [...] you have to have that.

Thus, DevOps and SRE are concepts that were born much more strongly in practice than in state of the art, that is, much more in the industry than necessarily in the university. So for you to deal with these concepts without making a real explanation, or bringing the main players about how they did it and why they did it, it is essential. Relate devops to site reliability engineering (sre) for students.

Show the historical importance of DevOps and SRE concepts from the main players in the industry. Relate devops to site reliability engineering (sre) for students. site reliability engineering; SRE; industry', 1, 'Historical importance of DevOps and their relationship with SRE', 'Working so hard on the theoretical aspects needed to understand why things in DevOps are in SRE as a whole [...] you have to have that.

Thus, DevOps and SRE are concepts that were born much more strongly in practice than in state of the art, that is, much more in the industry than necessarily in the university. So for you to deal with these concepts without making a real explanation, or bringing the main players about how they did it and why they did it, it is essential.', 'Relate devops to site reliability engineering (sre) for students.', true, 'site reliability engineering; SRE; industry', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (103, 'Make use of the Comprehensive Distance Learning (CDL) teaching methodology.', 'To bring the concept applied, then use a CDL approach, or PBL, that helps a lot, because then you have to present the problem and then show the idea behind the resolution of that problem. Make use of the Comprehensive Distance Learning (CDL) teaching methodology.  cdl; comprehensive distance learning; teaching method; strategy; execution', 1, 'Use of Comprehensive Distance Learning Teaching Methodology (CDL).
 ', 'To bring the concept applied, then use a CDL approach, or PBL, that helps a lot, because then you have to present the problem and then show the idea behind the resolution of that problem.', NULL, false, 'cdl; comprehensive distance learning; teaching method; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (104, 'It takes practice to understand DevOps concepts.

It is necessary to practice DevOps knowledge.

You can''t learn the DevOps culture from a book.

DevOps concepts need to be shown in practice so that students can understand.

Students only understand problems of the environment setup when they experiment in the practice.

Promote a moment to students practice while teachers are around to help them.', 'DevOps comes very close in these quirks of software architecture-like chairs. You can''t just stick to the concepts. In theory, you have to show the realization of these things.

You have to learn by doing.

You can''t learn the DevOps culture from a book.

Once you''ve been to the exercise session, you have to go back to the concept again and display them again because the, some concept only makes sense when you apply them.

I was saying at the beginning is that when you tell them that they''re going to get their hands dirty and things that work one day will not work the other day, they start laughing. They don''t take it seriously. Um, and then when they, when they building and they build a script to, I don''t know, run some integration tests or to magically build Docker images and deploy them, it works on the machine on one guy of the group because they''re working group, right? So they talk together. The one guy actually typing on the keyboard, he commits a script and they go, yes, we''re done for the day. Let''s go to some of the tasks, right? And then the next day somebody else was in the group wants to use it. And it doesn''t work for them because they have a different environment because the script was assuming that the Docker was installed.

If we can have a students together working together and, um, working on the projects and developing projects together at the same time while the teachers are there and they, uh, we can, uh, see what they are doing, that would be better. And I think we will, uh, hopefully do this, uh, next year when grown-up situation gets better. It takes practice to understand DevOps concepts.

It is necessary to practice DevOps knowledge.

You can''t learn the DevOps culture from a book.

DevOps concepts need to be shown in practice so that students can understand.

Students only understand problems of the environment setup when they experiment in the practice.

Promote a moment to students practice while teachers are around to help them. It takes practice to understand DevOps concepts. practice; concept; knowledge; culture; mindset; book; problem; environment; setup; theory; skill; learning; technique; teaching; strategy; execution', 4, 'practice for fixing the concepts', 'DevOps comes very close in these quirks of software architecture-like chairs. You can''t just stick to the concepts. In theory, you have to show the realization of these things.

You have to learn by doing.

You can''t learn the DevOps culture from a book.

Once you''ve been to the exercise session, you have to go back to the concept again and display them again because the, some concept only makes sense when you apply them.

I was saying at the beginning is that when you tell them that they''re going to get their hands dirty and things that work one day will not work the other day, they start laughing. They don''t take it seriously. Um, and then when they, when they building and they build a script to, I don''t know, run some integration tests or to magically build Docker images and deploy them, it works on the machine on one guy of the group because they''re working group, right? So they talk together. The one guy actually typing on the keyboard, he commits a script and they go, yes, we''re done for the day. Let''s go to some of the tasks, right? And then the next day somebody else was in the group wants to use it. And it doesn''t work for them because they have a different environment because the script was assuming that the Docker was installed.

If we can have a students together working together and, um, working on the projects and developing projects together at the same time while the teachers are there and they, uh, we can, uh, see what they are doing, that would be better. And I think we will, uh, hopefully do this, uh, next year when grown-up situation gets better.', 'It takes practice to understand DevOps concepts.', true, 'practice; concept; knowledge; culture; mindset; book; problem; environment; setup; theory; skill; learning; technique; teaching; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (105, 'Study the subject thoroughly before preparing for classes.', 'I usually study the subject to understand and then see the best way to explain that subject. Study the subject thoroughly before preparing for classes.  subject; study; preparation; analyse', 1, 'Study of many subjects before preparing classes.', 'I usually study the subject to understand and then see the best way to explain that subject.', NULL, false, 'subject; study; preparation; analyse', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (106, 'Use dynamics to inspire the class.', 'You propose the dynamics and have these things move the group because otherwise, it gets so dull. Use dynamics to inspire the class.  dynamic; teaching method; motivation; strategy; execution', 1, 'dynamics for inspiration to class', 'You propose the dynamics and have these things move the group because otherwise, it gets so dull.', NULL, false, 'dynamic; teaching method; motivation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (200, 'Make a continuous evaluation of the projects of the students.', 'what we''ve done was first to, um, continuously evaluate the teams are they were working on the project. Make a continuous evaluation of the projects of the students.  continuous; evaluation; project; assessment; activity; task; mission; gradual', 1, 'Continuous evaluation of projects', 'what we''ve done was first to, um, continuously evaluate the teams are they were working on the project.', NULL, false, 'continuous; evaluation; project; assessment; activity; task; mission; gradual', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (108, 'Initially, adopt more straightforward tools such as Mesos, Marathon, and Docker Swarm before using the Kubernetes tool.', 'I try to bring this up: Mesos, Marathon, then Swarm, even to exercise the concepts is more accessible, lighter than Kubernetes, and then after Kubernetes, Rancher, for example. Initially, adopt more straightforward tools such as Mesos, Marathon, and Docker Swarm before using the Kubernetes tool.  mesos; marathon; docker; swarm; kubernetes; cloud; tool; technology; automation', 1, 'Use of Mesos, Marathon and Docker Swarm, before Kubernetes.', 'I try to bring this up: Mesos, Marathon, then Swarm, even to exercise the concepts is more accessible, lighter than Kubernetes, and then after Kubernetes, Rancher, for example.', NULL, true, 'mesos; marathon; docker; swarm; kubernetes; cloud; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (109, 'If possible, have a team of monitors to assist in the assessment process.

Teacher assistants check if students contributions pass all the roles of the course.

Teacher assistants grade the projects and the professors grade the exams with cross validating.', 'Some settings you can have for us to help, like, oh, you have the monitors team, for example, this allows you to go to a more excellent practical line because you''ll have more arms to help you, evaluate and everything else.

We had to do as TAs and other things I think, uh, we, it''s not, uh, only before the lecture, but during the whole, uh, time that this, uh, this course was, uh, going on, we had to check the, uh, check the github. And, um, students had, since they had to make some contributions, uh, we had to make sure that their contributions, uh, could pass all the checks that we had. [...] So we had to check that they were doing what they were supposed to do before the lectures, during the lectures and after it. So that was our, uh, our role in this course.

What we''ve done in this case was to let the TA grade the projects, um, because then it was way more simple. And as the two props, we were, uh, grading the exams and were like cross validating. If possible, have a team of monitors to assist in the assessment process.

Teacher assistants check if students contributions pass all the roles of the course.

Teacher assistants grade the projects and the professors grade the exams with cross validating. Teacher assistants help in the assessment process. monitor; teacher assistant; project; grade; exam; cross validation; quiz; assessment; activity; task; mission; evaluation; test; score; ta', 3, 'Monitor staff helping evaluation', 'Some settings you can have for us to help, like, oh, you have the monitors team, for example, this allows you to go to a more excellent practical line because you''ll have more arms to help you, evaluate and everything else.

We had to do as TAs and other things I think, uh, we, it''s not, uh, only before the lecture, but during the whole, uh, time that this, uh, this course was, uh, going on, we had to check the, uh, check the github. And, um, students had, since they had to make some contributions, uh, we had to make sure that their contributions, uh, could pass all the checks that we had. [...] So we had to check that they were doing what they were supposed to do before the lectures, during the lectures and after it. So that was our, uh, our role in this course.

What we''ve done in this case was to let the TA grade the projects, um, because then it was way more simple. And as the two props, we were, uh, grading the exams and were like cross validating.', 'Teacher assistants help in the assessment process.', false, 'monitor; teacher assistant; project; grade; exam; cross validation; quiz; assessment; activity; task; mission; evaluation; test; score; ta', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (110, 'Instigate students'' critical thinking and encourage the self-taught search for extra-class information.

Promote and evaluate students'' independent decision-making in the learning process.', 'Because it is based on the assumption in all my disciplines that, right, knowledge is an open work, right? I''m not the holder of all knowledge [...] So they learn to curate what is relevant, necessary or not, is part of my teaching and learning processes.

So, in my activities, I always try to put a decision-making Delta that belongs to the team, right? To the students and who will obviously assess their understanding in all the semester''s discussions. So, all decisions are valid, obviously, right? Instigate students'' critical thinking and encourage the self-taught search for extra-class information.

Promote and evaluate students'' independent decision-making in the learning process. Promote students'' independent decision-making in the learning process. critical thinking; self-taught; extra-class; independence; decision-making; learning process; strategy; execution', 1, 'Incentive of critical thinking of students and self-taught search for more information', 'Because it is based on the assumption in all my disciplines that, right, knowledge is an open work, right? I''m not the holder of all knowledge [...] So they learn to curate what is relevant, necessary or not, is part of my teaching and learning processes.

So, in my activities, I always try to put a decision-making Delta that belongs to the team, right? To the students and who will obviously assess their understanding in all the semester''s discussions. So, all decisions are valid, obviously, right?', 'Promote students'' independent decision-making in the learning process.', false, 'critical thinking; self-taught; extra-class; independence; decision-making; learning process; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (111, 'You can use the discipline that the interviewee professor Vinicius elaborated as a reference for the elaboration of other DevOps disciplines.

Use other DevOps courses as a reference.', 'I already have mine that has my discipline ready, right? So the challenge, for those who will start one, is less.

I already have mine that has my discipline ready, right? So the challenge, for those who will start one, is less. You can use the discipline that the interviewee professor Vinicius elaborated as a reference for the elaboration of other DevOps disciplines.

Use other DevOps courses as a reference. Use other DevOps courses as a reference.
 discipline; reference; resource; curriculum; syllabus; schedule', 1, 'Use of discipline elaborated by the interviewee P7 as a reference for other DevOps disciplines.', 'I already have mine that has my discipline ready, right? So the challenge, for those who will start one, is less.

I already have mine that has my discipline ready, right? So the challenge, for those who will start one, is less.', 'Use other DevOps courses as a reference.
', true, 'discipline; reference; resource; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (112, 'Make use of Problem-Based Learning (PBL).

Problem-Based Learning (PBL) is great for teaching DevOps.

Use problem solving questions in DevOps assessment. It pushs student to critically think.

Use problem-based approach on the projects of the students.', 'PBL matches very well with, at least like this, how I see the DevOps signals or architecture, or MicroServices, which is another discipline I have; it''s cool because you can start from the problem and show why people are using what are you using. So I think it matches perfectly.

Bringing the concept applied, then use an approach like CDL, or PBL, that helps a lot because then you have a way to present the problem and then show the concept behind the resolution of that problem.

Most of the time to give a problem solving questions where I put a problem and say, okay, and push a student to critically think. ... , I put a problem and then we''ll come up with the solutions for the problem. And I haven''t been able to find a good way to do that with DevOps, in, uh, in terms of assessment.

We decided to go on a problem-based approach. So having like introductory lecture, giving the context, giving the leads to follow, then getting a problem based on, on, uh, like a long-term project for the whole semester. Make use of Problem-Based Learning (PBL).

Problem-Based Learning (PBL) is great for teaching DevOps.

Use problem solving questions in DevOps assessment. It pushs student to critically think.

Use problem-based approach on the projects of the students. Problem-Based Learning (PBL) is great for teaching DevOps. problem based learning; pbl; teaching method; project; activity; task; mission; strategy; execution', 3, 'Use of Problem-based Learning (PBL) for the teaching of DevOps.', 'PBL matches very well with, at least like this, how I see the DevOps signals or architecture, or MicroServices, which is another discipline I have; it''s cool because you can start from the problem and show why people are using what are you using. So I think it matches perfectly.

Bringing the concept applied, then use an approach like CDL, or PBL, that helps a lot because then you have a way to present the problem and then show the concept behind the resolution of that problem.

Most of the time to give a problem solving questions where I put a problem and say, okay, and push a student to critically think. ... , I put a problem and then we''ll come up with the solutions for the problem. And I haven''t been able to find a good way to do that with DevOps, in, uh, in terms of assessment.

We decided to go on a problem-based approach. So having like introductory lecture, giving the context, giving the leads to follow, then getting a problem based on, on, uh, like a long-term project for the whole semester.', 'Problem-Based Learning (PBL) is great for teaching DevOps.', true, 'problem based learning; pbl; teaching method; project; activity; task; mission; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (121, 'It''d be great if there was a Cloud course before DevOps course.

Prepare students with previous courses.', 'Do they understand what the cloud is? It''d be great if there was a cloud course before mine, but there isn''t.

It''s an option that we give them the year before too preparing them. It''d be great if there was a Cloud course before DevOps course.

Prepare students with previous courses. Prepare students with previous courses that teach related DevOps concepts. cloud; requisite; discipline; curriculum; syllabus; mandatory; prerequisite', 2, 'preparation of the students based on previous courses', 'Do they understand what the cloud is? It''d be great if there was a cloud course before mine, but there isn''t.

It''s an option that we give them the year before too preparing them.', 'Prepare students with previous courses that teach related DevOps concepts.', true, 'cloud; requisite; discipline; curriculum; syllabus; mandatory; prerequisite', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (113, 'Merge good practices of Problem-Based Learning (PBL), inverted class and Agile, through classroom experimentation.', 'Today, I don''t use it; I use not only PBL; there is an inverted classroom, right? I think this translation is into Portuguese; I work with missions, right? So, the execution itself is Agile; we always have a post-mortem for each task. My methodology today, at work, is a combination of a series of different good practices that come from my professional experience and part of what I learned, seeing that it worked and didn''t work while teaching. Merge good practices of Problem-Based Learning (PBL), inverted class and Agile, through classroom experimentation.  problem based learning; pbl; teaching method; inverted class; agile; experimentation; strategy; execution', 1, 'Merges of teaching methodologies Problem-based learning and inverted class with Agile', 'Today, I don''t use it; I use not only PBL; there is an inverted classroom, right? I think this translation is into Portuguese; I work with missions, right? So, the execution itself is Agile; we always have a post-mortem for each task. My methodology today, at work, is a combination of a series of different good practices that come from my professional experience and part of what I learned, seeing that it worked and didn''t work while teaching.', NULL, false, 'problem based learning; pbl; teaching method; inverted class; agile; experimentation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (114, 'Organize the students into teams of five.

Students like to work on team projects.

Students organized by groups.

Put students to work by a team of four to six per group.', 'I break them up into nine teams of five students each.

For this course, I haven''t done as much in terms of team projects, although I''m rolling that around to every, because everybody loves team projects.

 There was something like 17 groups.

I put them by a team of four, six per group, and then we work together and, and that''s good also because it may be working in a team. Organize the students into teams of five.

Students like to work on team projects.

Students organized by groups.

Put students to work by a team of four to six per group. Organize the students into teams. team; group; project; organization; strategy; execution', 4, 'team-based student organization', 'I break them up into nine teams of five students each.

For this course, I haven''t done as much in terms of team projects, although I''m rolling that around to every, because everybody loves team projects.

 There was something like 17 groups.

I put them by a team of four, six per group, and then we work together and, and that''s good also because it may be working in a team.', 'Organize the students into teams.', false, 'team; group; project; organization; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (115, 'I teach my class in sprints. We do five, two weeks sprints in a 15-week course. I give them the requirements for each sprint, what I need them to build and I teach them how to do agile planning. Then they go build an agile plan.

Make students experiment situations where they can learn how to work as a DevOps team, how to work agile.

Use an incremental models with sprints.', 'And then I tell them, I am not going to grade you on what you submit. I''m going to grade you on how you got there because getting there is not the point. It''s the journey, right? That''s the point. It''s how you got there. And so, um, I teach my class in sprints. We do five, two weeks sprints in a 15-week course. And I give them the requirements for each sprint, what I need them to build. And I teach them how to do agile planning. And then they go build an agile plan.

So I try to force them into these situations that really drive home the message of how to work as a DevOps team, how to work agile, but you''ve got to live it.

So we do things in sort of an iterative and incremental model where every week or every sprint, if you will build on the previous one. I teach my class in sprints. We do five, two weeks sprints in a 15-week course. I give them the requirements for each sprint, what I need them to build and I teach them how to do agile planning. Then they go build an agile plan.

Make students experiment situations where they can learn how to work as a DevOps team, how to work agile.

Use an incremental models with sprints. Do agile planning with sprints. agile; planning; sprint; team; group; organization; strategy; execution', 2, 'organization of the course in sprints', 'And then I tell them, I am not going to grade you on what you submit. I''m going to grade you on how you got there because getting there is not the point. It''s the journey, right? That''s the point. It''s how you got there. And so, um, I teach my class in sprints. We do five, two weeks sprints in a 15-week course. And I give them the requirements for each sprint, what I need them to build. And I teach them how to do agile planning. And then they go build an agile plan.

So I try to force them into these situations that really drive home the message of how to work as a DevOps team, how to work agile, but you''ve got to live it.

So we do things in sort of an iterative and incremental model where every week or every sprint, if you will build on the previous one.', 'Do agile planning with sprints.', false, 'agile; planning; sprint; team; group; organization; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (116, 'Teach just enough to get them going so they can learn in the right context.

Do not focus on unnecessary features of tools like avoid administering Jenkins if you want to practice continuous integration.

You cannot possibly get through everything in details.

Teach how to use tools like Docker and Kubernetes but do not much depth.

Do concrete things without necessarily going in depth about all.

Do not teach deeply some hard technologies like Kubernetes.', 'Those are the ones you remember, right? Not just read, right? If you learn in the abstract, you''ll soon forget it. But if you learn in context, then you''ll remember it because you understood why you did it. So I try to teach them just enough to get them going.

 I used to have people stand up during Jenkins instances to do the work, but that just at the end of the day, that''s a distraction. My goal is not to teach them how to administer Jenkins.

I''m having conversations with the university about trying to take the devops course and essentially converting it to a three course sequence one for agile, one for kind of the dev part of devops and one for the ops part of devops.

So second one is about establishing the pipeline and then they finish the second one by, uh, building the Docker images. But it''s not in depth about containers or, or kubernetes, but that''s easily touch it. Okay.

They need to do concrete things ... it''s to be able to traverse the whole thing without necessarily going in depth about all of these things.

I need very solid, uh, research. It''s a sorry, a lab assistance. The people responsible for the labs of course, assistants that that can actually deal with the students. So I''m lucky to have students and have good industrial experience, uh, to do that. Teach just enough to get them going so they can learn in the right context.

Do not focus on unnecessary features of tools like avoid administering Jenkins if you want to practice continuous integration.

You cannot possibly get through everything in details.

Teach how to use tools like Docker and Kubernetes but do not much depth.

Do concrete things without necessarily going in depth about all.

Do not teach deeply some hard technologies like Kubernetes. Teach just enough of DevOps tools to get the students going so they can learn in the right context.  tradeoff; simple; context; focus; jenkins; docker; kubernetes; relation; strategy; execution', 3, 'teach just enough so learn in the right context', 'Those are the ones you remember, right? Not just read, right? If you learn in the abstract, you''ll soon forget it. But if you learn in context, then you''ll remember it because you understood why you did it. So I try to teach them just enough to get them going.

 I used to have people stand up during Jenkins instances to do the work, but that just at the end of the day, that''s a distraction. My goal is not to teach them how to administer Jenkins.

I''m having conversations with the university about trying to take the devops course and essentially converting it to a three course sequence one for agile, one for kind of the dev part of devops and one for the ops part of devops.

So second one is about establishing the pipeline and then they finish the second one by, uh, building the Docker images. But it''s not in depth about containers or, or kubernetes, but that''s easily touch it. Okay.

They need to do concrete things ... it''s to be able to traverse the whole thing without necessarily going in depth about all of these things.

I need very solid, uh, research. It''s a sorry, a lab assistance. The people responsible for the labs of course, assistants that that can actually deal with the students. So I''m lucky to have students and have good industrial experience, uh, to do that.', 'Teach just enough of DevOps tools to get the students going so they can learn in the right context. ', true, 'tradeoff; simple; context; focus; jenkins; docker; kubernetes; relation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (122, 'Use Linux operational system.', 'so I don''t care if you using windows or using Mac or whatever you''re using. We''re all going to learn a bunch of Linux and we''re going to deploy all our stuff, using a bunch of it and use all the tools in a bunch of. Use Linux operational system.  linux; operational system; tool; technology; automation', 1, 'Linux operational system', 'so I don''t care if you using windows or using Mac or whatever you''re using. We''re all going to learn a bunch of Linux and we''re going to deploy all our stuff, using a bunch of it and use all the tools in a bunch of.', NULL, false, 'linux; operational system; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (199, 'DevOps course as elective course have students that wanted to learn about DevOps.', 'And it was selected by 80% of the cohort, which usually an elective course is like 20%. So is it like we had a lot of students inside these insights because they all wanted to learn about devops. DevOps course as elective course have students that wanted to learn about DevOps.  elective; discipline; course; curriculum; syllabus; optional', 1, 'student interest in an elective DevOps course', 'And it was selected by 80% of the cohort, which usually an elective course is like 20%. So is it like we had a lot of students inside these insights because they all wanted to learn about devops.', NULL, true, 'elective; discipline; course; curriculum; syllabus; optional', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (117, 'I teach them how to work as a DevOps team. And they''re all collaborating in their channel. They have 24/7 access to me. They can ping me at any time on slack.

The student''s question should be answered in the moment.

Incentive professor-students interaction, easing fast solving questions.

Take time to hear student''s feedbacks very openly and give them your feedback too.

Separate time to answer students questions, each week, four hours, lectures and answering questions, making some points about the course more clear.', 'I teach them how to work as a DevOps team. And we create a slack channel. , and I create a channel for each one of the teams. And they''re all collaborating in their channel. They have 24/7 access to me. They can ping me at any time on slack.

You have a question, ask me the question in the moment, right? Because that''s when the answer is important to you.

Whenever they have a problem they can come to me. And I tell them, don''t spend too much time Googling stuff. If you don''t understand something, ask me if, if you don''t understand what I presented, then I didn''t present it in a way that you could connect with it. [...] Everybody learns differently.

I''m always asking you the last factor. I''m always taking almost an hour to, as a student. Just give me your feedback. Like, like very openly, right? That''s you should all give me a feedback again.

Each week we had, uh, four hours of, uh, lectures and answering questions from students and, and, uh, making, making some points about the course more clear. I teach them how to work as a DevOps team. And they''re all collaborating in their channel. They have 24/7 access to me. They can ping me at any time on slack.

The student''s question should be answered in the moment.

Incentive professor-students interaction, easing fast solving questions.

Take time to hear student''s feedbacks very openly and give them your feedback too.

Separate time to answer students questions, each week, four hours, lectures and answering questions, making some points about the course more clear. Provide fast feedback to the students. team; collaboration; slack; communication; feedback; interaction; question; time; participation; partnership; conversation; discussion; answer; strategy; execution', 3, 'fast feedback to the student questions', 'I teach them how to work as a DevOps team. And we create a slack channel. , and I create a channel for each one of the teams. And they''re all collaborating in their channel. They have 24/7 access to me. They can ping me at any time on slack.

You have a question, ask me the question in the moment, right? Because that''s when the answer is important to you.

Whenever they have a problem they can come to me. And I tell them, don''t spend too much time Googling stuff. If you don''t understand something, ask me if, if you don''t understand what I presented, then I didn''t present it in a way that you could connect with it. [...] Everybody learns differently.

I''m always asking you the last factor. I''m always taking almost an hour to, as a student. Just give me your feedback. Like, like very openly, right? That''s you should all give me a feedback again.

Each week we had, uh, four hours of, uh, lectures and answering questions from students and, and, uh, making, making some points about the course more clear.', 'Provide fast feedback to the students.', false, 'team; collaboration; slack; communication; feedback; interaction; question; time; participation; partnership; conversation; discussion; answer; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (118, 'Don''t give the solution right away, let them reach it first for themselves.

Teach DevOps giving the content gradually, like first teach compilation and testing, then continuous integration; do not give everything right away so easily.', 'I like to make them feel a little bit of pain before I give them the solution. So I will have them to run their test cases.

The thing I''ve done to try to avoid a little bit of the mess is I want to go gradual. I want to be gradual in the class. So first I teach compilation and testing. Then I teach continuous integration. team A is going to build one piece team B is going to build another piece that depends upon what team is built. Don''t give the solution right away, let them reach it first for themselves.

Teach DevOps giving the content gradually, like first teach compilation and testing, then continuous integration; do not give everything right away so easily. Don''t give the solution right away. solution; independence; gradual; compilation; test; continuous integration; incremental; answer; strategy; execution; ci', 2, 'incrementally DevOps content teaching', 'I like to make them feel a little bit of pain before I give them the solution. So I will have them to run their test cases.

The thing I''ve done to try to avoid a little bit of the mess is I want to go gradual. I want to be gradual in the class. So first I teach compilation and testing. Then I teach continuous integration. team A is going to build one piece team B is going to build another piece that depends upon what team is built.', 'Don''t give the solution right away.', false, 'solution; independence; gradual; compilation; test; continuous integration; incremental; answer; strategy; execution; ci', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (119, 'Write some tests cases manually, do pull requests, do test automation with CI, write all test cases, teach code coverage. Then finally setup CD pipeline to deploy the application in the cloud.', 'I''ll have them run their test cases manually. And then when someone makes a pull request, I''m like, well, you need to clone that, run the test case. [...] And then [.. ] I show them how to [...] automatically run the test cases. [...] And so they write all the test cases. And then, and then I, I teach them about code coverage. I said, it''s not about the test passing. If the code coverage go down, then somebody code it without writing a test case, don''t merge that pull-request, right? So I''m teaching this whole culture, right? This way of working. [...] Then finally we push it to the cloud. We set up CD pipelines to deploy things in the cloud Write some tests cases manually, do pull requests, do test automation with CI, write all test cases, teach code coverage. Then finally setup CD pipeline to deploy the application in the cloud.  test; pull request; test; automation; ci; continuous integration; code coverage; continuous delivery; cd; pipeline; technology; gradual; technique; skill; strategy; execution; continuous deployment', 1, 'test cases manually, pull requests, test automation CI, test cases, code coverage. Setup CD pipeline deploy application in cloud.', 'I''ll have them run their test cases manually. And then when someone makes a pull request, I''m like, well, you need to clone that, run the test case. [...] And then [.. ] I show them how to [...] automatically run the test cases. [...] And so they write all the test cases. And then, and then I, I teach them about code coverage. I said, it''s not about the test passing. If the code coverage go down, then somebody code it without writing a test case, don''t merge that pull-request, right? So I''m teaching this whole culture, right? This way of working. [...] Then finally we push it to the cloud. We set up CD pipelines to deploy things in the cloud', NULL, true, 'test; pull request; test; automation; ci; continuous integration; code coverage; continuous delivery; cd; pipeline; technology; gradual; technique; skill; strategy; execution; continuous deployment', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (120, 'Make the group motivation a responsibility of themselves, students should motivate each other.

Teaching how to students mentor each other is one of the most important things and must be a priority.', 'So sometimes a student will say to me: professor, what do I do if another student is like not pulling their weight on the team?, And I say: when you go to a job interview, you''re going to be asked the question, tell me about a time when a member of your team wasn''t pulling their weight. And what did you do to get them excited and to contribute again, today''s the day to go write that story. Today''s the data to write the answer to that question.

You need to sit together and experience because if you can''t work as a team, you''re not gonna make it right out in industry because we want team players. I don''t want heroes. I don''t want people who saved the day. I want people who mentor each other. Make the group motivation a responsibility of themselves, students should motivate each other.

Teaching how to students mentor each other is one of the most important things and must be a priority. Make the group motivation a responsibility of themselves. group; motivation; responsibility; mentor; organization; coach; engagement; strategy; execution', 1, 'students'' motivation for themselves', 'So sometimes a student will say to me: professor, what do I do if another student is like not pulling their weight on the team?, And I say: when you go to a job interview, you''re going to be asked the question, tell me about a time when a member of your team wasn''t pulling their weight. And what did you do to get them excited and to contribute again, today''s the day to go write that story. Today''s the data to write the answer to that question.

You need to sit together and experience because if you can''t work as a team, you''re not gonna make it right out in industry because we want team players. I don''t want heroes. I don''t want people who saved the day. I want people who mentor each other.', 'Make the group motivation a responsibility of themselves.', false, 'group; motivation; responsibility; mentor; organization; coach; engagement; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (123, 'Vagrant and VirtualBox are useful to create consistent development environment.

I selected Vagrant and virtualbox because they''re free.

Make environment setup consistent between students using Vagrant.', 'We use Vagrant and VirtualBox. And so I don''t care if you using windows or using Mac or whatever you''re using.

I selected Vagrant and virtualbox because they''re both free. ... so I had to change the class for them to use Docker and VirtualBox. 

They call my repo, Vagrant up and they''re up and running. And so that''s how I solve that problem. Bigger. It does a very good job of solving that consistent environments for students. Vagrant and VirtualBox are useful to create consistent development environment.

I selected Vagrant and virtualbox because they''re free.

Make environment setup consistent between students using Vagrant. Vagrant and VirtualBox tools are free and useful to create consistent development environment between students. vagrant; virtualbox; vm; environment; tool; technology; automation; virtual machine', 1, 'vagrant and VirtualBox as a free tool', 'We use Vagrant and VirtualBox. And so I don''t care if you using windows or using Mac or whatever you''re using.

I selected Vagrant and virtualbox because they''re both free. ... so I had to change the class for them to use Docker and VirtualBox. 

They call my repo, Vagrant up and they''re up and running. And so that''s how I solve that problem. Bigger. It does a very good job of solving that consistent environments for students.', 'Vagrant and VirtualBox tools are free and useful to create consistent development environment between students.', true, 'vagrant; virtualbox; vm; environment; tool; technology; automation; virtual machine', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (124, 'I selected docker docker because it is free.

Docker can be chosen as DevOps tool.

Use tools like Docker to have more control on support the deployment.

Use Docker as container deployment tool adopted by the course.', 'I selected Vagrant and virtualbox because they''re both free. ... so I had to change the class for them to use Docker and VirtualBox.

We build Docker images.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff.

I want to be able to deploy it with containers. So it can be, um, through Kubernetes, it can be through Docker. I selected docker docker because it is free.

Docker can be chosen as DevOps tool.

Use tools like Docker to have more control on support the deployment.

Use Docker as container deployment tool adopted by the course. Docker can be chosen as DevOps tool. docker; container; deployment; tool; technology; automation', 3, 'Docker choice as DevOps tool', 'I selected Vagrant and virtualbox because they''re both free. ... so I had to change the class for them to use Docker and VirtualBox.

We build Docker images.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff.

I want to be able to deploy it with containers. So it can be, um, through Kubernetes, it can be through Docker.', 'Docker can be chosen as DevOps tool.', true, 'docker; container; deployment; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (125, 'Use Selenium to automate UI tests.

Use Selenium for test automation.', 'We use selenium to, to work on the, uh, on the UI, as a browser.

We use Selenium for test automation. Use Selenium to automate UI tests.

Use Selenium for test automation. Use Selenium for UI test automation. selenium; automation; test; tool; technology; automation', 2, 'Selenium UI test automation', 'We use selenium to, to work on the, uh, on the UI, as a browser.

We use Selenium for test automation.', 'Use Selenium for UI test automation.', false, 'selenium; automation; test; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (126, 'Students could use other tools non-taught without professor support.

Do not force students to use a single language like Java.

Give students the freedom to choose other tools they want, but make it clear that these tools will not be supported by teachers during the class

The students choose the tools and the projects freely on internet.

Let the students be free about the used tools and technologies.

Give the responsibility to the student to chose the system and also the responsibility of what they are doing.

Do not enforce given tools on a graduate course. The students should justify and defend each step of what''s happening to their code in the context of devops.', 'Students will ask me, can I use a different test suite? Can I use, you know, something different? And I''ll say, well, you can, but then it''s up to you to figure out how it integrates back into everything.

 So it''s rather simple that we, we let them, of course use the programming language. They want to develop the application. So, you know, the department, I think traditional were quite open with respect to that in the department. Yes. Java is still used, but students, these days, don''t like Java. Um, they prefer Python. They prefer different things. So for us, we don''t care, right? The application we give them when we gave them the HVAC application, we give them, uh, I think they have, I should even look myself, but I think we, we created two versions, one, it says Java version.

So we support them to the Travis CI. We support them with a certain number of things, but if they want to choose something else, it''s okay. I mean, but you know, they have to understand that we won''t necessarily support them.

We asked them to choose a tool, uh, on internet and new tool, and then use that tool and show other students how that works. So, uh, we didn''t have some predefined, uh, projects.

Just find whatever they want to find and work on whatever they want to work on and let them be free since that was our goal in this course, uh, we let them choose, um, novel technologies, the technologies and the tools that are being used, uh, today and the tools that are being developed today. 

We decided to let the student choose and said, okay, you have your option and do what you want, but you''re responsible of doing it.

It was a graduate course, I started not to, uh, enforce given tools ... I want you to have a version control system that should be git, but git up, gitlab Bitbucket, Bitbucket on premises. ...  you can justify and defend each step of what''s happening to your code in the context of devops. Students could use other tools non-taught without professor support.

Do not force students to use a single language like Java.

Give students the freedom to choose other tools they want, but make it clear that these tools will not be supported by teachers during the class

The students choose the tools and the projects freely on internet.

Let the students be free about the used tools and technologies.

Give the responsibility to the student to chose the system and also the responsibility of what they are doing.

Do not enforce given tools on a graduate course. The students should justify and defend each step of what''s happening to their code in the context of devops. Do not force the technology stack used by students in their systems. technology; stack; programming; language; java; project; freedom; responsibility; flexibility; tool; technology; automation; engagement', 4, 'No technology stack in students systems', 'Students will ask me, can I use a different test suite? Can I use, you know, something different? And I''ll say, well, you can, but then it''s up to you to figure out how it integrates back into everything.

 So it''s rather simple that we, we let them, of course use the programming language. They want to develop the application. So, you know, the department, I think traditional were quite open with respect to that in the department. Yes. Java is still used, but students, these days, don''t like Java. Um, they prefer Python. They prefer different things. So for us, we don''t care, right? The application we give them when we gave them the HVAC application, we give them, uh, I think they have, I should even look myself, but I think we, we created two versions, one, it says Java version.

So we support them to the Travis CI. We support them with a certain number of things, but if they want to choose something else, it''s okay. I mean, but you know, they have to understand that we won''t necessarily support them.

We asked them to choose a tool, uh, on internet and new tool, and then use that tool and show other students how that works. So, uh, we didn''t have some predefined, uh, projects.

Just find whatever they want to find and work on whatever they want to work on and let them be free since that was our goal in this course, uh, we let them choose, um, novel technologies, the technologies and the tools that are being used, uh, today and the tools that are being developed today. 

We decided to let the student choose and said, okay, you have your option and do what you want, but you''re responsible of doing it.

It was a graduate course, I started not to, uh, enforce given tools ... I want you to have a version control system that should be git, but git up, gitlab Bitbucket, Bitbucket on premises. ...  you can justify and defend each step of what''s happening to your code in the context of devops.', 'Do not force the technology stack used by students in their systems.', false, 'technology; stack; programming; language; java; project; freedom; responsibility; flexibility; tool; technology; automation; engagement', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (127, 'Argo CD is a more current continuous delivery tool than Jenkins.', '   People use an Argo CD to do continuous delivery. They used to be using Jenkins. So do you still teach Jenkins? Do you teach them Argo? Um, so it''s a constant, um, improvement on the tools are what tools are popular, what tools are going to get them a job in the industry, right?  Argo CD is a more current continuous delivery tool than Jenkins.  argo cd; continuous delivery; jenkins; tool; technology; automation; cd; gradual; technique; continuous deployment', 1, 'Argo CD instead of Jenkins in continuous delivery teaching', '   People use an Argo CD to do continuous delivery. They used to be using Jenkins. So do you still teach Jenkins? Do you teach them Argo? Um, so it''s a constant, um, improvement on the tools are what tools are popular, what tools are going to get them a job in the industry, right? ', NULL, true, 'argo cd; continuous delivery; jenkins; tool; technology; automation; cd; gradual; technique; continuous deployment', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (128, 'Teach Kanban board.

You don''t need quizzes if you grade the students continuously watching their Kanban boards.

Create a fictitious company based on experience for students to practice continuous improvement, creating applications, extracting data from Kanban.

Use Kanban to make the work visible in devops.

Make the students realize that the Kanban has certain information for analyzing the overall process.', 'I''m going to watch your Kanban board every week.

 I don''t give quizzes because I''m grading them every day, watching their Kanban boards, seeing how they''re working, interacting with them on slack. 

 I built kind of a fictitious company [...] based on my experience [...]  the students work in groups of three [...]  in the first lab, they have to set up their environment [...] We bring them also to, to build, uh, two small applications that actually extract, um, data from the Kanban, uh, in GitHub using the GitHub APIs, because I want the students to one that very important aspect of DevOps is the continuous improvement. So if you want, you have to apply the same principles to the process that you''re applying to your product.

We enforce the usage of, of the, of the Kanban, because it''s an important practice in devops to make the work visible and stuff.

Make the students realize that the Kanban has certain information for a certain purpose. Um, if I want to analyze my process, I may extract information from the Kanban that will tell me about, you know, the time that I spent in the development phase or in the, in the review phase and things like that. Teach Kanban board.

You don''t need quizzes if you grade the students continuously watching their Kanban boards.

Create a fictitious company based on experience for students to practice continuous improvement, creating applications, extracting data from Kanban.

Use Kanban to make the work visible in devops.

Make the students realize that the Kanban has certain information for analyzing the overall process. Teach Kanban board. kanban; board; quiz; grade; practice; continuous improvement; process; technique; score; management; gradual; skill; strategy; execution', 2, 'Kanban board', 'I''m going to watch your Kanban board every week.

 I don''t give quizzes because I''m grading them every day, watching their Kanban boards, seeing how they''re working, interacting with them on slack. 

 I built kind of a fictitious company [...] based on my experience [...]  the students work in groups of three [...]  in the first lab, they have to set up their environment [...] We bring them also to, to build, uh, two small applications that actually extract, um, data from the Kanban, uh, in GitHub using the GitHub APIs, because I want the students to one that very important aspect of DevOps is the continuous improvement. So if you want, you have to apply the same principles to the process that you''re applying to your product.

We enforce the usage of, of the, of the Kanban, because it''s an important practice in devops to make the work visible and stuff.

Make the students realize that the Kanban has certain information for a certain purpose. Um, if I want to analyze my process, I may extract information from the Kanban that will tell me about, you know, the time that I spent in the development phase or in the, in the review phase and things like that.', 'Teach Kanban board.', false, 'kanban; board; quiz; grade; practice; continuous improvement; process; technique; score; management; gradual; skill; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (129, 'Check if the the labs work well always before start the class.

Verify if labs exercises are working before classes.

Update your exercises often to get everything set up.

Update your exercises frequently.', 'I actually last semester I prepared something on Sunday. And when I got Wednesday, when we had the class and I went to the cloud, the cloud had changed. [...] we''re pushing to the IBM cloud the other night and it said there''s an, there''s a new update available for the tool. Uh, you know, version two, it may have breaking changes. And I said, timeout, nobody press, yes, everybody press no, because that''s not the version I used on the weekend.

I''m usually maybe a couple of weeks out verifying something for an upcoming, an upcoming session.

The second recommendation is update your exercises often. ... you can get everything set up.

So you have to have your stack ready, but you have to update it with the current version of the software that you intend the students to use fairly close to the beginning of the session, if you don''t want to be surprised. Check if the the labs work well always before start the class.

Verify if labs exercises are working before classes.

Update your exercises often to get everything set up.

Update your exercises frequently.  lab; exercise; update; validation; task; mission; preparation', 3, 'Labs accuracy validation  frequently before the classes', 'I actually last semester I prepared something on Sunday. And when I got Wednesday, when we had the class and I went to the cloud, the cloud had changed. [...] we''re pushing to the IBM cloud the other night and it said there''s an, there''s a new update available for the tool. Uh, you know, version two, it may have breaking changes. And I said, timeout, nobody press, yes, everybody press no, because that''s not the version I used on the weekend.

I''m usually maybe a couple of weeks out verifying something for an upcoming, an upcoming session.

The second recommendation is update your exercises often. ... you can get everything set up.

So you have to have your stack ready, but you have to update it with the current version of the software that you intend the students to use fairly close to the beginning of the session, if you don''t want to be surprised.', NULL, false, 'lab; exercise; update; validation; task; mission; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (130, 'Teacher assistence help students over slack managing questions.

Use Google Docs during the lectures so students could add their questions. Teacher Assistants could answer the questions in the doc.', 'So without having, uh, physically having a technical assistance in the class and I do have TA''s on with my zoom and they do help students over slack, uh, to get things going.

We had a long Google doc that the students during the lectures and after the lectures, students could add their questions there. And then we, the TAs could answer the questions, uh, in the doc.  Teacher assistence help students over slack managing questions.

Use Google Docs during the lectures so students could add their questions. Teacher Assistants could answer the questions in the doc. Teacher assistence help students over managing questions. teacher assistant; slack; ta; google docs; lecture; question; answer; solution; justification; strategy; execution', 2, 'managing of the student questions by teacher assistants', 'So without having, uh, physically having a technical assistance in the class and I do have TA''s on with my zoom and they do help students over slack, uh, to get things going.

We had a long Google doc that the students during the lectures and after the lectures, students could add their questions there. And then we, the TAs could answer the questions, uh, in the doc. ', 'Teacher assistence help students over managing questions.', false, 'teacher assistant; slack; ta; google docs; lecture; question; answer; solution; justification; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (131, 'So the team is 40% of their grade. The exams are 60% a midterm that''s 30 and a, and a final that''s 30.', 'Then I give them two exams. So the team is 40% of their grade. The exams are 60% a midterm that''s 30 and a, and a final that''s 30. So the team is 40% of their grade. The exams are 60% a midterm that''s 30 and a, and a final that''s 30.  team; grade; exam; quiz; assessment; evaluation; test; score', 1, 'team 40% of grade. Exam 60%.', 'Then I give them two exams. So the team is 40% of their grade. The exams are 60% a midterm that''s 30 and a, and a final that''s 30.', NULL, false, 'team; grade; exam; quiz; assessment; evaluation; test; score', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (132, 'Try to get the student having fun in order to keep them engaged.', 'I try to get the student more engaged.... If they''re not having fun, then we''re, we''re doing it wrong. So, so I''m making sure they''re having fun. Try to get the student having fun in order to keep them engaged.  motivation; engagement; fun; responsibility; strategy; execution', 1, 'students engage through fun', 'I try to get the student more engaged.... If they''re not having fun, then we''re, we''re doing it wrong. So, so I''m making sure they''re having fun.', NULL, false, 'motivation; engagement; fun; responsibility; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (133, '50 multiple choice questions in one hour each exam if you are remote.

Use quiz in the book to test in the exams with multiple choices.

Multiple-choice format questions about DevOps concepts favor the understanding instead of memorization of the students.

Quizzes forces students to understand the concepts.', 'In that assessment, you know, that they''re, um, there are 50 multiple choice questions in each exam, no partial credit. Um, and, and so, and I give, and it''s an hour, uh, you know, to go do that exam. ...  we''re remote now.

The book I have quiz, uh, again, it could be translated and adjusted, but that''s the way to, to test in the exams. ...  one part is exactly quiz questions. So they have multiple choices.

If I was asking you the question and say, give me the three benefits of this thought of this, uh, concept, then it''s memorization. But if I give them five, if I give you five choices and they could be between zero and five, that are true statements with respect to this concept, it''s not about memorization. It''s about understanding.

If the exam is in presence, then I don''t care that much if, if they do the control that before, because ultimately they have to understand, I think that these quizzes to me have a specific objective. 50 multiple choice questions in one hour each exam if you are remote.

Use quiz in the book to test in the exams with multiple choices.

Multiple-choice format questions about DevOps concepts favor the understanding instead of memorization of the students.

Quizzes forces students to understand the concepts. Use quiz with multiple choices to assess the students. question; exam; remote; quiz; book; test; multiple choice; concept; theory; assessment; evaluation', 2, 'quiz as a student assessment tool', 'In that assessment, you know, that they''re, um, there are 50 multiple choice questions in each exam, no partial credit. Um, and, and so, and I give, and it''s an hour, uh, you know, to go do that exam. ...  we''re remote now.

The book I have quiz, uh, again, it could be translated and adjusted, but that''s the way to, to test in the exams. ...  one part is exactly quiz questions. So they have multiple choices.

If I was asking you the question and say, give me the three benefits of this thought of this, uh, concept, then it''s memorization. But if I give them five, if I give you five choices and they could be between zero and five, that are true statements with respect to this concept, it''s not about memorization. It''s about understanding.

If the exam is in presence, then I don''t care that much if, if they do the control that before, because ultimately they have to understand, I think that these quizzes to me have a specific objective.', 'Use quiz with multiple choices to assess the students.', false, 'question; exam; remote; quiz; book; test; multiple choice; concept; theory; assessment; evaluation', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (134, 'Exams in remote class format are with the open book.', 'the exams are open book, right? I, I, when I''m in the classroom, they''re not open book, but for, for the remote learning, they have to be open book. I just can''t enforce it. Exams in remote class format are with the open book.  exam; remote; book; quiz; assessment; evaluation; test', 1, 'exams with open book', 'the exams are open book, right? I, I, when I''m in the classroom, they''re not open book, but for, for the remote learning, they have to be open book. I just can''t enforce it.', NULL, false, 'exam; remote; book; quiz; assessment; evaluation; test', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (136, 'Cloud computing make easier to stand up virtual machines.', 'we had cloud computing, where can easily stand up virtual machines for people and things like that. Cloud computing make easier to stand up virtual machines.  cloud; virtual machine; vm; environment; setup', 1, 'virtual machine setup facilitated by cloud computing', 'we had cloud computing, where can easily stand up virtual machines for people and things like that.', NULL, false, 'cloud; virtual machine; vm; environment; setup', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (145, 'The basic skeleton of the class does not change significantly because we focus on concepts and we focus on goals.', 'I don''t think the basic skeleton of the class has really changed significantly, maybe a few places, but over the last two or three years, the, the basic structure, the scaffolding I think has held fairly true where we focus on some devops principles. We focus on concepts. We focus on goals. The basic skeleton of the class does not change significantly because we focus on concepts and we focus on goals.  planning; concept; discipline; class; theory; organization; preparation', 1, 'skeleton class without replacement because it focuses on concepts and goals', 'I don''t think the basic skeleton of the class has really changed significantly, maybe a few places, but over the last two or three years, the, the basic structure, the scaffolding I think has held fairly true where we focus on some devops principles. We focus on concepts. We focus on goals.', NULL, true, 'planning; concept; discipline; class; theory; organization; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (137, 'Make clear the importance of the DevOps mindset like continuous improvement in constrast to using the tools.

Continuous improvement is a key DevOps concept.

The mindset of thinking of continuous improvement is so important because the improvement of the daily work is more important than the work itself.

The most importart thing of DevOps is to improve my process continuously through automation of the deployment process.', 'People coming through the programs want to play with technology. That''s half the reason we got into this field in the first place, and it''s a really fun thing to be able to do, but it''s not sufficient. And trying to change that mindset to emphasize more the idea of devops as a means of continuous improvement, as a means of organizational change. As a, to some extent I use this phrase guardedly, but to some extent, a philosophy around how the organization is going to go from concept to implementation, that''s a much harder set of skills to pick up.

The global approach made sure the students not associated with devops with a CI/CD pipeline, because in my opinion, it''s all about continuous improvement.

This mindset of thinking of continuous improvement is so important, right?  ... the improvement of the daily work is more important than the work itself.

What should I improve to make my process more efficient? So to me, this is the most important thing of DevOps. And, and, and then you do it through automation, automation of, of the deployment process, automation of, of, you know, the testing process automation later of the security, uh, thing and so on. Make clear the importance of the DevOps mindset like continuous improvement in constrast to using the tools.

Continuous improvement is a key DevOps concept.

The mindset of thinking of continuous improvement is so important because the improvement of the daily work is more important than the work itself.

The most importart thing of DevOps is to improve my process continuously through automation of the deployment process. Continuous improvement is a key DevOps concept. continuous improvement; mindset; automation; deployment; concept; theory; gradual', 2, 'continuous improvements key DevOps concept', 'People coming through the programs want to play with technology. That''s half the reason we got into this field in the first place, and it''s a really fun thing to be able to do, but it''s not sufficient. And trying to change that mindset to emphasize more the idea of devops as a means of continuous improvement, as a means of organizational change. As a, to some extent I use this phrase guardedly, but to some extent, a philosophy around how the organization is going to go from concept to implementation, that''s a much harder set of skills to pick up.

The global approach made sure the students not associated with devops with a CI/CD pipeline, because in my opinion, it''s all about continuous improvement.

This mindset of thinking of continuous improvement is so important, right?  ... the improvement of the daily work is more important than the work itself.

What should I improve to make my process more efficient? So to me, this is the most important thing of DevOps. And, and, and then you do it through automation, automation of, of the deployment process, automation of, of, you know, the testing process automation later of the security, uh, thing and so on.', 'Continuous improvement is a key DevOps concept.', true, 'continuous improvement; mindset; automation; deployment; concept; theory; gradual', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (138, 'Use imagens that contain everything that the teacher wants to teach to clone virtual machines.', 'I''m starting to do is to just build out images, for example, that contain everything that I want them to have. Uh, and that way I can tell them to spin up a virtual machine.  Use imagens that contain everything that the teacher wants to teach to clone virtual machines.  image; virtual machine; vm; environment; setup', 1, 'virtual machine images with everything needed', 'I''m starting to do is to just build out images, for example, that contain everything that I want them to have. Uh, and that way I can tell them to spin up a virtual machine. ', NULL, true, 'image; virtual machine; vm; environment; setup', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (139, 'Use Github for academic use where you can set up GitHub classrooms.', 'I use GitHub and they have options for professors, you know, for academic use, where you can set up these GitHub classrooms. I use those constantly, um, and they work very, very well because again, I can kind of control who gets what I can see, everything I can help individuals through things works great. Use Github for academic use where you can set up GitHub classrooms.  github; classroom', 1, 'GitHub classroom available on Github academic use', 'I use GitHub and they have options for professors, you know, for academic use, where you can set up these GitHub classrooms. I use those constantly, um, and they work very, very well because again, I can kind of control who gets what I can see, everything I can help individuals through things works great.', NULL, false, 'github; classroom', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (140, 'Compare and contrast the tools before to choice.', 'I will pick one, usually one, although I''ll usually compare and contrast against a couple of others, something in the around of automated builds. Compare and contrast the tools before to choice.  comparison; tool; tool; technology; automation; relation; analogy', 1, 'contrast tools before choose', 'I will pick one, usually one, although I''ll usually compare and contrast against a couple of others, something in the around of automated builds.', NULL, false, 'comparison; tool; tool; technology; automation; relation; analogy', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (141, 'Use cloud SAS providers to avoid spending a lot of time installations and configurations.', 'I try to use cloud providers, you know, kind of cloud SAS providers for that sort of thing, because I don''t want people to spend a lot of time getting the stuff stood up. Use cloud SAS providers to avoid spending a lot of time installations and configurations.  cloud; sas; installation; configuration; environment; setup; service', 1, 'environment setup easier by a cloud provider', 'I try to use cloud providers, you know, kind of cloud SAS providers for that sort of thing, because I don''t want people to spend a lot of time getting the stuff stood up.', NULL, true, 'cloud; sas; installation; configuration; environment; setup; service', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (142, 'Show the evolution of the tools like exposing from ant and maven to gradle tool in build managment.', 'I tend to focus on gradle, but I also will link that to say a comparison against Maven and ant to provide some context for how we got here, why we got here Show the evolution of the tools like exposing from ant and maven to gradle tool in build managment.  evolution; maven; gradle; build; tool; technology; automation; progress; change', 1, 'students understanding evolution of the tools', 'I tend to focus on gradle, but I also will link that to say a comparison against Maven and ant to provide some context for how we got here, why we got here', NULL, false, 'evolution; maven; gradle; build; tool; technology; automation; progress; change', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (143, 'separate the dev and ops part into different courses.', 'I''m having conversations with the university about trying to take the devops course and essentially converting it to a three course sequence one for agile, one for kind of the dev part of devops and one for the ops part of devops. separate the dev and ops part into different courses.  development; operation; discipline; course; curriculum; syllabus', 1, 'dev and ops in different courses', 'I''m having conversations with the university about trying to take the devops course and essentially converting it to a three course sequence one for agile, one for kind of the dev part of devops and one for the ops part of devops.', NULL, true, 'development; operation; discipline; course; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (144, 'Teach students to know how to sell DevOps benefits to their directors who are from the business area. For example, pipeline reduce developers work time and save money. You can also build a new feature or add a new product that the business has.', 'And that level of what you''re trying to do is to build a business case for why you want that at all. And now you''re starting to get a little bit around of the computer science and into around of business and being able to tie those two things together in such a way that you can sell it to an organization that would have to spend resources, people, time, energy, money, building out that kind of a technical pipeline, right? 
 ... you have to somehow sell them on why you should spend your sources doing that versus building a new feature or adding a new product or any one of a number of other competing priorities that the business has. Teach students to know how to sell DevOps benefits to their directors who are from the business area. For example, pipeline reduce developers work time and save money. You can also build a new feature or add a new product that the business has.  promotion; benefit; stackholder; business; pipeline; incremental; product', 1, 'bussinessman understanding devops benefities from the students', 'And that level of what you''re trying to do is to build a business case for why you want that at all. And now you''re starting to get a little bit around of the computer science and into around of business and being able to tie those two things together in such a way that you can sell it to an organization that would have to spend resources, people, time, energy, money, building out that kind of a technical pipeline, right? 
 ... you have to somehow sell them on why you should spend your sources doing that versus building a new feature or adding a new product or any one of a number of other competing priorities that the business has.', NULL, true, 'promotion; benefit; stackholder; business; pipeline; incremental; product', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (153, 'Study the tools more when you go into the concepts. For example, deep Docker when you teach containers.', 'And then as we go into more concept, like what is Jenkins and what is Artifactory and what is Docker, then we can go back on those things. Study the tools more when you go into the concepts. For example, deep Docker when you teach containers.  concept; docker; container; level; jenkins; artifactory; theory; strategy; execution', 1, 'focus more on concepts than tools', 'And then as we go into more concept, like what is Jenkins and what is Artifactory and what is Docker, then we can go back on those things.', NULL, true, 'concept; docker; container; level; jenkins; artifactory; theory; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (146, 'Specify what projects the students will work and provide one or two small projects.

Use small projects with students.

Use a simple application to walk through all DevOps concepts.', 'So I try to give folks one or two small projects.

We will also build a sample, which is on github. I''ll send you the link. If you want. We build a sample that is called a cookie factory. Um, it''s, it''s a system to handle a cookie factory where you can order cookie pay for them, and you get a shopping cart with cookies, et cetera, right? So it''s just a small sample.

We have built a little simulator that is quite simple, but that''s easy to traverse the whole, essentially the main phases of DevOps. Specify what projects the students will work and provide one or two small projects.

Use small projects with students.

Use a simple application to walk through all DevOps concepts. Research small projects for the students. project; application; example; sample; system; preparation', 3, 'small projects', 'So I try to give folks one or two small projects.

We will also build a sample, which is on github. I''ll send you the link. If you want. We build a sample that is called a cookie factory. Um, it''s, it''s a system to handle a cookie factory where you can order cookie pay for them, and you get a shopping cart with cookies, et cetera, right? So it''s just a small sample.

We have built a little simulator that is quite simple, but that''s easy to traverse the whole, essentially the main phases of DevOps.', 'Research small projects for the students.', false, 'project; application; example; sample; system; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (147, 'Provide jump-starting examples of commonly used commands of tools.', 'I will try to provide, uh, some kind of, of jump-starting as far as people learning at technology. So for example, here''s commonly used commands. Here''s why you use them. Here''s how you use them. Provide jump-starting examples of commonly used commands of tools.  example; command; sample; preparation', 1, 'jump-starting example of commonly used commands of tools', 'I will try to provide, uh, some kind of, of jump-starting as far as people learning at technology. So for example, here''s commonly used commands. Here''s why you use them. Here''s how you use them.', NULL, false, 'example; command; sample; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (148, 'Be a little bit more forgivable, understanding that for some people getting all the brand new technologies to work together can be really hard, so make it less stressful', 'So being a little bit more forgiving, a lot of the tools that we''re using are brand new. For many people, getting them all to work together can be particularly challenging. And so making it a little less stressful, uh, can be helpful. Be a little bit more forgivable, understanding that for some people getting all the brand new technologies to work together can be really hard, so make it less stressful  motivation; stress; tool; technology; automation', 1, 'understanding of the student difficulties in new technologies', 'So being a little bit more forgiving, a lot of the tools that we''re using are brand new. For many people, getting them all to work together can be particularly challenging. And so making it a little less stressful, uh, can be helpful.', NULL, true, 'motivation; stress; tool; technology; automation', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (149, 'Our curriculum allows some degree of freedom according to the teacher''s preferences.', 'Our particular curriculum tends to allow out of, some degree of necessity and amount of interest based learning. You know, I care about software architecture. And so that''s where I want to focus. Our curriculum allows some degree of freedom according to the teacher''s preferences.  freedom; discipline; class; flexibility; curriculum; syllabus; schedule', 1, 'curriculum allows degree freedom', 'Our particular curriculum tends to allow out of, some degree of necessity and amount of interest based learning. You know, I care about software architecture. And so that''s where I want to focus.', NULL, false, 'freedom; discipline; class; flexibility; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (150, 'Evaluate the single project of the students on the standpoint of the architecture and also from the angle of continuous integration.', 'We let the students build only one project, one code base, which is evaluated both on the standpoint of the architecture. ... but also from the angle of continuous integration, do they include build plan? Evaluate the single project of the students on the standpoint of the architecture and also from the angle of continuous integration.  project; architecture; continuous integration; evaluation; assessment; structure; gradual; ci', 1, 'evaluation of student projects from architecture and from continuous integration', 'We let the students build only one project, one code base, which is evaluated both on the standpoint of the architecture. ... but also from the angle of continuous integration, do they include build plan?', NULL, true, 'project; architecture; continuous integration; evaluation; assessment; structure; gradual; ci', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (151, 'Built a curriculum with DevOps and Software Architecture classes together, a single project, a single teaching team, but we evaluate on two angles.

The courses of software architecture and DevOps taught in the same day.', 'So we built a curriculum in just very innovative way, the two classes together, a single project, a single teaching team, but we evaluate on two angles.

The course about, uh, software architecture and DevOps, or we''re talking about a different way of architecting software, um, mainly distributed system, because it was easier for the DevOps parts who were triggered challenges was a distributed system.  ... And they had one, one lecture in the morning lecture slash lab and one lecture slash lab in the afternoon. And they were really like Friday was dedicated to DevOps slash uh, architecture. Built a curriculum with DevOps and Software Architecture classes together, a single project, a single teaching team, but we evaluate on two angles.

The courses of software architecture and DevOps taught in the same day. The courses of software architecture and DevOps taught together. architecture; project; team; group; discipline; class; structure; curriculum; syllabus; schedule; organization', 2, 'software architecture and DevOps courses together in the curriculum', 'So we built a curriculum in just very innovative way, the two classes together, a single project, a single teaching team, but we evaluate on two angles.

The course about, uh, software architecture and DevOps, or we''re talking about a different way of architecting software, um, mainly distributed system, because it was easier for the DevOps parts who were triggered challenges was a distributed system.  ... And they had one, one lecture in the morning lecture slash lab and one lecture slash lab in the afternoon. And they were really like Friday was dedicated to DevOps slash uh, architecture.', 'The courses of software architecture and DevOps taught together.', true, 'architecture; project; team; group; discipline; class; structure; curriculum; syllabus; schedule; organization', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (152, 'Show the operational constraints to students like coder will not get access to production environment.', 'And then another team uses in a 13 deploys to environment that the first team cannot get to because it''s a production environment that the coder will not get access to it. So in real life, you have different teams of people that talk only through some channels. Show the operational constraints to students like coder will not get access to production environment.  operation; production; environment; strategy; execution', 1, 'show operational contrains like coder not get access production environment', 'And then another team uses in a 13 deploys to environment that the first team cannot get to because it''s a production environment that the coder will not get access to it. So in real life, you have different teams of people that talk only through some channels.', NULL, true, 'operation; production; environment; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (154, 'Build something that is portable and something that can be broken down into several pieces where one student runs one bit and then another students runs the rest.', 'what helps is to build something that is portable and something that can be broken down into several pieces where one student runs one bit and then another students runs the rest. It''s also good because it forces them to work as a group. Build something that is portable and something that can be broken down into several pieces where one student runs one bit and then another students runs the rest.  portable; modular; architecture; environment; setup; structure', 1, 'project execution composed of several pieces in various student environments', 'what helps is to build something that is portable and something that can be broken down into several pieces where one student runs one bit and then another students runs the rest. It''s also good because it forces them to work as a group.', NULL, false, 'portable; modular; architecture; environment; setup; structure', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (155, 'Force students to use technology stack used on course.

It is necessary to give freedom to student develop their functional solution.

We force tools and tecnology and alert them to avoid too many variation between the groups.

It is important to give flexibility to students to develop their solution although some things are determined.

Give students a rough summary of what their application are supposed to do.', 'In this year, if you do that, it''s too early and it''s going to be too hard for you as a teacher to, to know what''s going on. So by forcing the technology stack and telling them.

I mean, they''re free to do what they want from a functional standpoint in the project.

But from a tools and technology, we force just on them to avoid too many variation between the groups.

We use a very specific language. This is to just make it easy. I mean, sometimes we give it a bit too flexible. So right now we use a Java and Javascript because we are targeting web application. But, uh, when we students are implementing, uh, new features, so we give them the flexibility. We say, okay, parents, if you want to implement in Python, you can do it as long as you can wrap it in, uh, integrated in the new code.

 We give some kind of rough summary of what the application is supposed to do. Force students to use technology stack used on course.

It is necessary to give freedom to student develop their functional solution.

We force tools and tecnology and alert them to avoid too many variation between the groups.

It is important to give flexibility to students to develop their solution although some things are determined.

Give students a rough summary of what their application are supposed to do. Force students to use technology stack used on course. technology; stack; programming; language; java; project; freedom; responsibility; flexibility; tool; technology; automation; engagement', 2, 'forced technology stack', 'In this year, if you do that, it''s too early and it''s going to be too hard for you as a teacher to, to know what''s going on. So by forcing the technology stack and telling them.

I mean, they''re free to do what they want from a functional standpoint in the project.

But from a tools and technology, we force just on them to avoid too many variation between the groups.

We use a very specific language. This is to just make it easy. I mean, sometimes we give it a bit too flexible. So right now we use a Java and Javascript because we are targeting web application. But, uh, when we students are implementing, uh, new features, so we give them the flexibility. We say, okay, parents, if you want to implement in Python, you can do it as long as you can wrap it in, uh, integrated in the new code.

 We give some kind of rough summary of what the application is supposed to do.', 'Force students to use technology stack used on course.', false, 'technology; stack; programming; language; java; project; freedom; responsibility; flexibility; tool; technology; automation; engagement', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (156, 'Build whiteboard free sessions inspired by what students have failed and the two hours exercise.', 'Go gradually. Um, so tha t,that was part of my strategy. The other thing is I''ve built a few, what I called a, um, whiteboard free session. So I go something like every week we have half a day, one hour of, uh, formal teaching. And then two hours exercise and we do that for like three weeks in a row. [...] So I do like three classrooms, one free session inspired by what they fail on and I continue.
 Build whiteboard free sessions inspired by what students have failed and the two hours exercise.  board; failure; exercise; session; task; mission; discussion; strategy; execution', 1, 'free sessions about student problems', 'Go gradually. Um, so tha t,that was part of my strategy. The other thing is I''ve built a few, what I called a, um, whiteboard free session. So I go something like every week we have half a day, one hour of, uh, formal teaching. And then two hours exercise and we do that for like three weeks in a row. [...] So I do like three classrooms, one free session inspired by what they fail on and I continue.
', NULL, true, 'board; failure; exercise; session; task; mission; discussion; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (157, 'The students have something that 20 minutes to describe the architecture of the project, to describe their build strategy, that test strategy and demonstrate it on the screen. That is evaluated by a jury of one representative from the software architecture class and one representative from the DevOps class.

Make students prepare a presentation about topics related to DevOps.

Students can present a tool or do a demo to get some feedback from others during the classes.', 'We''ve done live presentation, where they have something that 20 minutes to describe the architecture, to describe their build strategy, that test strategy and demonstrate it on the screen. Um, and that is evaluated by a jury of one representative from the software architecture class and one representative from the DevOps class.

Students have to choose some topic and say, okay, we want to do a presentation on this topic. And that topic can be anything related to DevOps.

Everyone who wanted to present a tool or to do a demo or anything else they could give, uh, get some feedback from other students. The students have something that 20 minutes to describe the architecture of the project, to describe their build strategy, that test strategy and demonstrate it on the screen. That is evaluated by a jury of one representative from the software architecture class and one representative from the DevOps class.

Make students prepare a presentation about topics related to DevOps.

Students can present a tool or do a demo to get some feedback from others during the classes. Make students prepare a presentation about topics related to DevOps. architecture; project; build; test; seminar; presentation; demonstration; activity; task; mission; exercise; structure; description; strategy; execution', 2, 'presentation of some DevOps topics classes by students', 'We''ve done live presentation, where they have something that 20 minutes to describe the architecture, to describe their build strategy, that test strategy and demonstrate it on the screen. Um, and that is evaluated by a jury of one representative from the software architecture class and one representative from the DevOps class.

Students have to choose some topic and say, okay, we want to do a presentation on this topic. And that topic can be anything related to DevOps.

Everyone who wanted to present a tool or to do a demo or anything else they could give, uh, get some feedback from other students.', 'Make students prepare a presentation about topics related to DevOps.', true, 'architecture; project; build; test; seminar; presentation; demonstration; activity; task; mission; exercise; structure; description; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (158, 'Use MVP (Minimum viable product) evaluation to validate components of the project. Make an evaluation in the middle and the final course.', ' we also do two evaluations, one in the middle and one at the end. So the one in the middle, we call it MVP evaluation. And we tell them, at this point, you should have reached an MVP, which is basically a walking skeleton for your code. We don''t care if when you call the API, the only code of the API is return true, or which are 12, but we care that you have the components in place. You can build them independently and they can talk to each other. Right? So at this, we validate that your componentization and your architecture is good even before you start building algorithms and the functional code. Um, so we do that and that''s, again, that''s to catch early, um, architecture mistakes.
 Use MVP (Minimum viable product) evaluation to validate components of the project. Make an evaluation in the middle and the final course.  mvp; minimum viable product; validation; evaluation; project; course; assessment; activity; task; mission; exercise', 1, 'MVP evaluation', ' we also do two evaluations, one in the middle and one at the end. So the one in the middle, we call it MVP evaluation. And we tell them, at this point, you should have reached an MVP, which is basically a walking skeleton for your code. We don''t care if when you call the API, the only code of the API is return true, or which are 12, but we care that you have the components in place. You can build them independently and they can talk to each other. Right? So at this, we validate that your componentization and your architecture is good even before you start building algorithms and the functional code. Um, so we do that and that''s, again, that''s to catch early, um, architecture mistakes.
', NULL, false, 'mvp; minimum viable product; validation; evaluation; project; course; assessment; activity; task; mission; exercise', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (159, 'Do many evaluations of students project along with the discipline. Use green, yellow or red flags to evaluate the group.', 'we also have a lot of evaluation during the exercise. When group after group, where we, we give them flags if week green, yellow, or red, based on where we think they are, uh, regarding the objectives. Do many evaluations of students project along with the discipline. Use green, yellow or red flags to evaluate the group.  project; evaluation; continuous; assessment; activity; task; mission; gradual', 1, 'evaluation of project students along  the discipline with color flags', 'we also have a lot of evaluation during the exercise. When group after group, where we, we give them flags if week green, yellow, or red, based on where we think they are, uh, regarding the objectives.', NULL, false, 'project; evaluation; continuous; assessment; activity; task; mission; gradual', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (160, 'Do not make assumption about the learning level of the students when you have students with different levels.', 'we cannot make assumption on what they know. So we''re trying to work without any assumption.
 Do not make assumption about the learning level of the students when you have students with different levels.  level; knowledge; strategy; execution', 1, 'without assumption about the level of the students', 'we cannot make assumption on what they know. So we''re trying to work without any assumption.
', NULL, false, 'level; knowledge; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (161, 'Kubernetes can be chosen as DevOps tool.

Use tools like Kubernetes to have more control on support the deployment.

Uses Kubernetes as container deployment tool adopted by the course.', 'We show them Kubernetes.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff.

I want to be able to deploy it with containers. So it can be, um, through Kubernetes, it can be through Docker. Kubernetes can be chosen as DevOps tool.

Use tools like Kubernetes to have more control on support the deployment.

Uses Kubernetes as container deployment tool adopted by the course. Kubernetes can be chosen as DevOps tool. kubernetes; cloud; container; deployment; tool; technology; automation', 2, 'Kubernetes ad DevOps tool', 'We show them Kubernetes.

Let''s go for something that we have more control on, uh, using for tools like Jenkins and and a stuff like Docker or Kubernetes was kind of good in a way to, uh, support the deployment and the, uh, like the building plus deployment stuff.

I want to be able to deploy it with containers. So it can be, um, through Kubernetes, it can be through Docker.', 'Kubernetes can be chosen as DevOps tool.', true, 'kubernetes; cloud; container; deployment; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (162, 'Start with a generic perspective of DevOps, basic concepts, and after a few weeks start to focus on specialized issues.', 'I covered it is a few lectures, like on, on DevOps and, um, which look at DevOps from a kind of generic perspective, like introducing the concept of DevOps and the challenges related to DevOps and, and, and so on. And then introducing them some of the basic tools, like for instance, so using things like continuous integration tools, like Jenkins SIM swollen. And, uh, so I tried to introduce, uh, between maybe spending about a couple of weeks doing that, like the course was about 12 weeks. And so in Zen App there, I focus more on specialized issues. So we spent some time on performance and scalability testing and things like the good testing and so on. Start with a generic perspective of DevOps, basic concepts, and after a few weeks start to focus on specialized issues.  concept; issue; lecture; continuous integration; jenkins; performance; scalability; test; theory; gradual; problem; strategy; execution; ci', 1, 'incremental teaching from DevOps concepts', 'I covered it is a few lectures, like on, on DevOps and, um, which look at DevOps from a kind of generic perspective, like introducing the concept of DevOps and the challenges related to DevOps and, and, and so on. And then introducing them some of the basic tools, like for instance, so using things like continuous integration tools, like Jenkins SIM swollen. And, uh, so I tried to introduce, uh, between maybe spending about a couple of weeks doing that, like the course was about 12 weeks. And so in Zen App there, I focus more on specialized issues. So we spent some time on performance and scalability testing and things like the good testing and so on.', NULL, true, 'concept; issue; lecture; continuous integration; jenkins; performance; scalability; test; theory; gradual; problem; strategy; execution; ci', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (163, 'Introduce a concept and do labs with creating DevOps pipeline, setup A/B tests, and automated tests.', 'what I do is that after introducing a concept and so on, I started really looking at very specific issues ... so in the lab we students learn, uh, in our, to be able to, for instance, to create a pipeline currency, DevOps pipeline, and, and, um, very, uh, set up A B tests, create test cases and do automated test, uh, test automation. Introduce a concept and do labs with creating DevOps pipeline, setup A/B tests, and automated tests.  concept; lab; pipeline; A/B; test; setup; automation; theory; strategy; execution; deployment', 1, 'introduction of theory and realization of labs', 'what I do is that after introducing a concept and so on, I started really looking at very specific issues ... so in the lab we students learn, uh, in our, to be able to, for instance, to create a pipeline currency, DevOps pipeline, and, and, um, very, uh, set up A B tests, create test cases and do automated test, uh, test automation.', NULL, true, 'concept; lab; pipeline; A/B; test; setup; automation; theory; strategy; execution; deployment', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (173, 'We presented as a lab project with five deliverables. The students start by defining the requirements and then after they start a secondary pipeline, and then they do at least a couple of weeks iterations cycle and develop cycle. And then after they go to do performance testing to do a security testing, and for each of these deliverables, we submit something, every report.', 'We presented as a lab project [...] So the students start initially by defining the requirements and then after they start a secondary pipeline, and then they do at least a couple of weeks iterations cycle and develop cycle. And then after they go to do performance testing to do a security testing and all those kinds of things, and for each of these deliverables, we submit something, every report. And, and, uh, so that''s very easy to map because it''s a very practical. We presented as a lab project with five deliverables. The students start by defining the requirements and then after they start a secondary pipeline, and then they do at least a couple of weeks iterations cycle and develop cycle. And then after they go to do performance testing to do a security testing, and for each of these deliverables, we submit something, every report.  lab; project; deliberable; pipeline; requirement; iteration; performance; test; security; report; activity; task; mission; exercise; requisite; strategy; execution', 1, 'Lab projects with deliverables', 'We presented as a lab project [...] So the students start initially by defining the requirements and then after they start a secondary pipeline, and then they do at least a couple of weeks iterations cycle and develop cycle. And then after they go to do performance testing to do a security testing and all those kinds of things, and for each of these deliverables, we submit something, every report. And, and, uh, so that''s very easy to map because it''s a very practical.', NULL, true, 'lab; project; deliberable; pipeline; requirement; iteration; performance; test; security; report; activity; task; mission; exercise; requisite; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (164, 'Students start setting up their own DevOps environment and provide additional feature using simple application in the project.

Let students setup their environment for themselves.

Give students an application that they have to build the pipeline to support it.', 'The students have to do in the projects is to start by coming up with the requirements of the obvious application, and then start setting up their own environment and provide some additional functionalities that we want to implement.

 So they have set up their environment.

The second one is to, we give them an application. It''s an actually an HVAC humidity, air conditioning and ventilation, um, and they don''t develop the application, but they have to build the pipeline to support this existing application. Students start setting up their own DevOps environment and provide additional feature using simple application in the project.

Let students setup their environment for themselves.

Give students an application that they have to build the pipeline to support it. Students setting up their own DevOps environment. setup; environment; application; example; build; pipeline; sample; setup; system', 2, 'students set up their DevOps environment', 'The students have to do in the projects is to start by coming up with the requirements of the obvious application, and then start setting up their own environment and provide some additional functionalities that we want to implement.

 So they have set up their environment.

The second one is to, we give them an application. It''s an actually an HVAC humidity, air conditioning and ventilation, um, and they don''t develop the application, but they have to build the pipeline to support this existing application.', 'Students setting up their own DevOps environment.', true, 'setup; environment; application; example; build; pipeline; sample; setup; system', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (165, 'The project of the class should not be very small and must be challenging.', 'Also making the project interesting is important because it, you can, it''s very easy when you are teaching to just take a very small project, which is not very, uh, challenging in all with students.
 The project of the class should not be very small and must be challenging.  project; size; activity; task; mission; preparation', 1, 'class project not too small but challenging', 'Also making the project interesting is important because it, you can, it''s very easy when you are teaching to just take a very small project, which is not very, uh, challenging in all with students.
', NULL, true, 'project; size; activity; task; mission; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (166, 'For exam can be to use an open source application that we can use.', 'for exam can be to use an open source application that we can use For exam can be to use an open source application that we can use.  exam; application; example; open source; quiz; assessment; sample; evaluation; test; system', 1, 'realization of exam with open source application', 'for exam can be to use an open source application that we can use', NULL, false, 'exam; application; example; open source; quiz; assessment; sample; evaluation; test; system', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (167, 'Use SonarQube to help on the automation.', 'we use also SonarQube to help us on the automation Use SonarQube to help on the automation.  sonarqube; automation; tool; technology; automation', 1, 'SonarQube on automation', 'we use also SonarQube to help us on the automation', NULL, true, 'sonarqube; automation; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (168, 'Use JMeter for performance testing.', 'for performance testing we use JMeter Use JMeter for performance testing.  jmeter; performance; test; tool; technology; automation', 1, 'jmeter as a perfomance testing tool', 'for performance testing we use JMeter', NULL, false, 'jmeter; performance; test; tool; technology; automation', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (169, 'Use OWASP Zap as security platform.', 'we also security platform like, uh, Zap Use OWASP Zap as security platform.  owasp; zap; security; tool; technology; automation; platform', 1, 'owasp zap as a security platform', 'we also security platform like, uh, Zap', NULL, false, 'owasp; zap; security; tool; technology; automation; platform', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (170, 'There are many free DevOps tools available.', 'So in terms of the tools, I feel better. I think one of the good aspect in DevOps is that there are a lot of tools [...] DevOps tools are available and where a lot of them are free and some of them are conscious of those. So a lot of them are free. And, and then, so, so far, I think it has been good. There are many free DevOps tools available.  freedom; market; industry; choice; tool; technology; automation; adoption; selection', 1, 'Free DevOps tools avaliable', 'So in terms of the tools, I feel better. I think one of the good aspect in DevOps is that there are a lot of tools [...] DevOps tools are available and where a lot of them are free and some of them are conscious of those. So a lot of them are free. And, and then, so, so far, I think it has been good.', NULL, true, 'freedom; market; industry; choice; tool; technology; automation; adoption; selection', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (171, 'Someone from teacher staff implements the sample application.', 'Quite often, what we do is have someone in our team to implement the application. Someone from teacher staff implements the sample application.  team; example; application; staff; ta; teacher assistant; sample; system; preparation', 1, 'teacher staff responsible for the implementation of the sample application', 'Quite often, what we do is have someone in our team to implement the application.', NULL, false, 'team; example; application; staff; ta; teacher assistant; sample; system; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (172, 'Divide the course into 80% of concepts and 20% of applications.

Conciliate the experience in labs and the context of lectures.', 'So in the course I split, but so about 80% of presentation is just a regular, uh, concepts and so on and about 20% is about concrete applications.

 And so if we can find a way to be able to, to compress the experience or expertise in the practical experience and expertise in the context of lectures and so on. Divide the course into 80% of concepts and 20% of applications.

Conciliate the experience in labs and the context of lectures. Divide the course into 80% of concepts and 20% of applications. concept; application; discipline; balance; lab; lecture; division; conciliation; theory; system; curriculum; syllabus; schedule; selection; adoption', 1, 'teaching centers more on concepts than application', 'So in the course I split, but so about 80% of presentation is just a regular, uh, concepts and so on and about 20% is about concrete applications.

 And so if we can find a way to be able to, to compress the experience or expertise in the practical experience and expertise in the context of lectures and so on.', 'Divide the course into 80% of concepts and 20% of applications.', true, 'concept; application; discipline; balance; lab; lecture; division; conciliation; theory; system; curriculum; syllabus; schedule; selection; adoption', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (190, 'Predefined project is important for the organization of the course.', 'So, uh, we didn''t have some predefined, uh, projects, and as we can, yes, this was a bigger problem for us. Predefined project is important for the organization of the course.  project; planning; organization; discipline; management; preparation', 1, 'dangers of a not predefined project for the organization of the course', 'So, uh, we didn''t have some predefined, uh, projects, and as we can, yes, this was a bigger problem for us.', NULL, false, 'project; planning; organization; discipline; management; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (175, 'Qualified teacher assistant is important to setup the labs.

It is good to have teacher assistants with labs.', 'I had a different assistant for the labs who was the next student. So the first time, and the labs were quite well received.

If you have lab assistants that are, you know, good, it''s pretty easy to manage. Qualified teacher assistant is important to setup the labs.

It is good to have teacher assistants with labs. Teacher assistants are helpful with labs. teacher assistant; ta; staff; lab; setup; team; strategy; execution', 1, 'labs execution with teacher assistant support', 'I had a different assistant for the labs who was the next student. So the first time, and the labs were quite well received.

If you have lab assistants that are, you know, good, it''s pretty easy to manage.', 'Teacher assistants are helpful with labs.', false, 'teacher assistant; ta; staff; lab; setup; team; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (176, 'The Unicorn project book is a novel which covers the Dev side issues of DevOps.', 'the unicorn [project book] who was just, just published last year is more about the Dev stuff, but it really brings it into the mindset of, of, okay, what are the issues concretely that we face. The Unicorn project book is a novel which covers the Dev side issues of DevOps.  unicorn; project; book; material; novel; development; issue; question; strategy; execution', 1, 'Unicorn Project book for Dev side issues', 'the unicorn [project book] who was just, just published last year is more about the Dev stuff, but it really brings it into the mindset of, of, okay, what are the issues concretely that we face.', NULL, true, 'unicorn; project; book; material; novel; development; issue; question; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (177, 'The Phoenix book by Jean Kim is a novel that covers the Ops side of DevOps.', 'The Phoenix project ...  it''s written also by essentially Jean Kim ... , it''s written as a novel ... you get into the, the life of people that are facing issues that''s are essentially DevOps issues ... he Phoenix project is more about the Ops side of things. The Phoenix book by Jean Kim is a novel that covers the Ops side of DevOps.  phoenix; book; material; novel; operation; strategy; execution', 1, 'teaching of operating activities through phoenix book', 'The Phoenix project ...  it''s written also by essentially Jean Kim ... , it''s written as a novel ... you get into the, the life of people that are facing issues that''s are essentially DevOps issues ... he Phoenix project is more about the Ops side of things.', NULL, true, 'phoenix; book; material; novel; operation; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (178, 'The teacher assistants need to be very qualified.', 'I need very solid, uh, research. It''s a sorry, a lab assistance. The people responsible for the labs of course, assistants that that can actually deal with the students. So I''m lucky to have students and have good industrial experience, uh, to do that. The teacher assistants need to be very qualified.  teacher assistant; ta; staff; level; team; strategy; execution', 1, 'qualified teacher assistants', 'I need very solid, uh, research. It''s a sorry, a lab assistance. The people responsible for the labs of course, assistants that that can actually deal with the students. So I''m lucky to have students and have good industrial experience, uh, to do that.', NULL, false, 'teacher assistant; ta; staff; level; team; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (179, 'Use Tuleap for lifecycle management.', 'So I chose, um, tuleap, which is an open source that was missing in mainly DevOps in France. Use Tuleap for lifecycle management.  tuleap; lifecycle; management; tool; technology; automation; organization', 1, 'Tuleap for lifecycle', 'So I chose, um, tuleap, which is an open source that was missing in mainly DevOps in France.', NULL, true, 'tuleap; lifecycle; management; tool; technology; automation; organization', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (180, 'Try to make the environment setup minimal.', 'We try to make it minimal Try to make the environment setup minimal.  environment; setup; simple', 1, 'environment setup minimal', 'We try to make it minimal', NULL, false, 'environment; setup; simple', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (181, 'You do not need to worry about university infrastruture when the students have Github and AWS accounts and you make the environment as industrial as lightweight as possible in all of the students laptops.', 'initially we were relying the, uh, admin, uh, personnel in our department, not admin, sorry, the, the engineering, uh, the, yeah, the, the infrastructure, the people that are responsible for the labs and so on. And now, since all of the students have their laptop, we try to make it as industrial as possible in lightweight as possible. So we don''t need any internal support. [...] You just need this use to create their, uh, GitHub accounts. And, uh, you have to register to be able to get some AWS, uh, credits so that you can share with the students, but it''s quite, it''s quite easy. You do not need to worry about university infrastruture when the students have Github and AWS accounts and you make the environment as industrial as lightweight as possible in all of the students laptops.  industry; university; infrastructure; github; aws; computing resource; hardware; environment; academy; setup; support', 1, 'environment as industrial as lightweight as possible in all of the student''s laptops through Github and AWS account', 'initially we were relying the, uh, admin, uh, personnel in our department, not admin, sorry, the, the engineering, uh, the, yeah, the, the infrastructure, the people that are responsible for the labs and so on. And now, since all of the students have their laptop, we try to make it as industrial as possible in lightweight as possible. So we don''t need any internal support. [...] You just need this use to create their, uh, GitHub accounts. And, uh, you have to register to be able to get some AWS, uh, credits so that you can share with the students, but it''s quite, it''s quite easy.', NULL, true, 'industry; university; infrastructure; github; aws; computing resource; hardware; environment; academy; setup; support', 'environment setup');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (183, 'Define clearly the objectives of your course and make sure you stick to it.

Constantly remember the students about the objective of the course.

Make sure the students know the rules of the course. For example how many points they get for what they do.', 'First define the objectives of your course and making sure you stick to it.

But with respect to the technologies, I think that knowledge is, will change [...] I think like one of the, uh, not too good to give it giving advices or, but I can share my experience and my thoughts. Um, I think that that''s important to remember one thing as important as what is the objectives of your course.

 I think if we lay the rooms, uh, maybe it''s more clearly and more specifically, I think students, we know better what they will get from what they do. [...]
I think we will have, uh, we will, um, uh, rewrite some of the rules to make sure that, uh, students know how many points they get for what they do, uh, beforehand we should do it because, uh, it will not be perfect because students can choose many different things.  Define clearly the objectives of your course and make sure you stick to it.

Constantly remember the students about the objective of the course.

Make sure the students know the rules of the course. For example how many points they get for what they do. Explain the course objectives to the students. objective; course; rule; strategy; execution', 2, 'understanding of course objectives clear by students', 'First define the objectives of your course and making sure you stick to it.

But with respect to the technologies, I think that knowledge is, will change [...] I think like one of the, uh, not too good to give it giving advices or, but I can share my experience and my thoughts. Um, I think that that''s important to remember one thing as important as what is the objectives of your course.

 I think if we lay the rooms, uh, maybe it''s more clearly and more specifically, I think students, we know better what they will get from what they do. [...]
I think we will have, uh, we will, um, uh, rewrite some of the rules to make sure that, uh, students know how many points they get for what they do, uh, beforehand we should do it because, uh, it will not be perfect because students can choose many different things. ', 'Explain the course objectives to the students.', false, 'objective; course; rule; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (184, 'Give case studies to see if the students can analyze a given situation in the exams.

We use the case studies in theoretical exam. Students have three hours to explain what they do in this situation. We were really grading half of the description and half of the justification.

It is helpful to use the description and the justification of case studies on qualitative grade scale.', 'I give them two case studies, uh, so to see if they can analyze a given situation.

Like theoretical exam point of view, we use the case studies. ... you have three hours explain what you do in this situation. ...  we were really grading half of the description and half of the justification.

He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way. Give case studies to see if the students can analyze a given situation in the exams.

We use the case studies in theoretical exam. Students have three hours to explain what they do in this situation. We were really grading half of the description and half of the justification.

It is helpful to use the description and the justification of case studies on qualitative grade scale. Use case studies in the exams. case study; exam; grade; description; justification; quiz; assessment; answer; solution; evaluation; test; score; demonstration; scale', 2, 'student exams by case studies', 'I give them two case studies, uh, so to see if they can analyze a given situation.

Like theoretical exam point of view, we use the case studies. ... you have three hours explain what you do in this situation. ...  we were really grading half of the description and half of the justification.

He grade scale was half description, half justification, and that''s helped a lot, but it''s always, um, qualitative in this way.', 'Use case studies in the exams.', false, 'case study; exam; grade; description; justification; quiz; assessment; answer; solution; evaluation; test; score; demonstration; scale', 'assessment');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (185, 'Be able to capture your DevOps process in terms of modeling as a flow of activities using value stream mapping technique.', 'we use one of the topics in DevOps that becomes quite important is value stream mapping. So to be able to capture your process is pretty simple in terms of modeling as a flow of activities, value stream mapping is a technique that has been used for quite a long time and in production. Be able to capture your DevOps process in terms of modeling as a flow of activities using value stream mapping technique.  model; flow; activity; value stream; mapping; technique; skill', 1, 'capture DevOps process of modeling, flow activities with value stram mappin technique', 'we use one of the topics in DevOps that becomes quite important is value stream mapping. So to be able to capture your process is pretty simple in terms of modeling as a flow of activities, value stream mapping is a technique that has been used for quite a long time and in production.', NULL, true, 'model; flow; activity; value stream; mapping; technique; skill', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (186, 'constantly try to figure out how to improve the quality of the course', 'it''s not an analysis course, but I tried to bring it back regularly and say, okay, if you want to improve a process, whether you do so, it''s one of the, one of the section in the book. And so it''s okay. [...] you go from there to identify the, the points that could be improved, right. And then how do you want to improve it, then the techniques that are described in the book? constantly try to figure out how to improve the quality of the course  quality; course; improvement; progress; advance; change; evolution; strategy; execution', 1, 'improvement of the quality of the course constantly', 'it''s not an analysis course, but I tried to bring it back regularly and say, okay, if you want to improve a process, whether you do so, it''s one of the, one of the section in the book. And so it''s okay. [...] you go from there to identify the, the points that could be improved, right. And then how do you want to improve it, then the techniques that are described in the book?', NULL, false, 'quality; course; improvement; progress; advance; change; evolution; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (187, 'Try to bring industrial speakers to share their experience.

Invite people to show students what''s going on in practice, not only in theoretical problems.

The lectures could be presented by people who were from the industry.

It is important to have industrial partnership to share skills to contribute to the course.

You need to have DevOps practitioners interacting with the students.

Discuss the course with industrial partners and practitioners.

You should be careful about selecting guest lectures. Prefer industrial practitioners.

Do not invite a DevOps coach to do DevOps lectures.', 'I''m thinking of bringing a couple of, um, industrial speakers as well to share their experience.

We can have people, uh, there, there are, uh, there are everywhere that we can invite and, uh, let the students know what is going on in practice, not just some, uh, theoretical, uh, problem.

The lectures were not, uh, were not presented by the teachers. They were presented by the people who are, who were from the industry and invited to the, uh, to the course to present something for students.

I think the course we''ve built in France was successful because we''ve done it with a software architect from IBM or the guy who was building, um, like as part of his industrial practice, he was building huge, uh, systems.

You need to have people interacting with the students that are practitioners and that really, uh, well know their in a way.

So we thought we were doing right, but after having discussed with industrial partners and practitioners, like not just discussed, you know, conference or attending a meetup, like really discussing for hours.

To carefully select the, um, I, I have a lot of industrial, uh, practitioners, guest lectures. Uh, we, we, we had the one prof that wasn''t industrial.

The bigger mistake I''ve made was to, uh, use a coach. Uh, and we invited him and the guy was, uh, setting himself running himself as a DevOps coach, but the guy just had written books and, uh, had no idea what he was talking about. Try to bring industrial speakers to share their experience.

Invite people to show students what''s going on in practice, not only in theoretical problems.

The lectures could be presented by people who were from the industry.

It is important to have industrial partnership to share skills to contribute to the course.

You need to have DevOps practitioners interacting with the students.

Discuss the course with industrial partners and practitioners.

You should be careful about selecting guest lectures. Prefer industrial practitioners.

Do not invite a DevOps coach to do DevOps lectures. Select industrial speakers carefully to share their experience with the students. industry; speaker; partnership; skill; practice; interaction; lecture; coach; technique; mentor; collaboration; preparation', 3, 'careful selection of industrial guests for the course', 'I''m thinking of bringing a couple of, um, industrial speakers as well to share their experience.

We can have people, uh, there, there are, uh, there are everywhere that we can invite and, uh, let the students know what is going on in practice, not just some, uh, theoretical, uh, problem.

The lectures were not, uh, were not presented by the teachers. They were presented by the people who are, who were from the industry and invited to the, uh, to the course to present something for students.

I think the course we''ve built in France was successful because we''ve done it with a software architect from IBM or the guy who was building, um, like as part of his industrial practice, he was building huge, uh, systems.

You need to have people interacting with the students that are practitioners and that really, uh, well know their in a way.

So we thought we were doing right, but after having discussed with industrial partners and practitioners, like not just discussed, you know, conference or attending a meetup, like really discussing for hours.

To carefully select the, um, I, I have a lot of industrial, uh, practitioners, guest lectures. Uh, we, we, we had the one prof that wasn''t industrial.

The bigger mistake I''ve made was to, uh, use a coach. Uh, and we invited him and the guy was, uh, setting himself running himself as a DevOps coach, but the guy just had written books and, uh, had no idea what he was talking about.', 'Select industrial speakers carefully to share their experience with the students.', false, 'industry; speaker; partnership; skill; practice; interaction; lecture; coach; technique; mentor; collaboration; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (188, 'It''s important to communicate with students that DevOps is not buzzword, it is extremely serious.', 'So that, I think it''s one of our job to, to, to communicate with the student that it''s not about the buzzword, this is something extremely serious. It''s important to communicate with students that DevOps is not buzzword, it is extremely serious.  communication; buzzword; mindset; culture; conversation; skill; technique; discussion', 1, 'serious communication with the student about DevOps', 'So that, I think it''s one of our job to, to, to communicate with the student that it''s not about the buzzword, this is something extremely serious.', NULL, true, 'communication; buzzword; mindset; culture; conversation; skill; technique; discussion', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (189, 'Do some research about DevOps topic, write an essay, and if the tool is open source, contribute to that tool and fix some issues and report it to the teachers.

The students should contribute and engage in the development process of the large projects with more than a hundred stars on Github.

Students could contribute to some open source projects that are large and being used and had more than one hundred stars.', 'Then do, um, do some research about it, write an essay or, uh, or if there is, um, there is a tool available, uh, on GitHub it''s, if it''s open source, they can contribute to that, uh, to that tool and maybe fix some issues and report it to the teachers.

Many of them did was to engage in the, uh, in the development process of the, uh, of the large projects that other people are working on. And, uh, they could choose a project, I think with more than a hundred stars. ...  And they had to make sure that they pass all the, uh, all the steps and they had to do some contributions, but to there, to those for repositories. And, uh, and they had to also engage in a conversation with other people from other teams, uh, in the process that, uh, they were, uh, making those contributions.

They could contribute to some open source projects that are large projects and they are being used. So it''s something that I''m looking for. Something we had some stats, uh, on github. Do some research about DevOps topic, write an essay, and if the tool is open source, contribute to that tool and fix some issues and report it to the teachers.

The students should contribute and engage in the development process of the large projects with more than a hundred stars on Github.

Students could contribute to some open source projects that are large and being used and had more than one hundred stars. Do some research about DevOps topic, write an essay, and if the tool is open source, contribute to that tool and fix some issues and report it to the teachers. The open source project should have more than a hundred stars on Github. github; open source; project; research; essay; issue; contribution; engagement; star; activity; task; mission; exercise; problem; preparation', 1, 'participation of the students in GitHub open source projects', 'Then do, um, do some research about it, write an essay or, uh, or if there is, um, there is a tool available, uh, on GitHub it''s, if it''s open source, they can contribute to that, uh, to that tool and maybe fix some issues and report it to the teachers.

Many of them did was to engage in the, uh, in the development process of the, uh, of the large projects that other people are working on. And, uh, they could choose a project, I think with more than a hundred stars. ...  And they had to make sure that they pass all the, uh, all the steps and they had to do some contributions, but to there, to those for repositories. And, uh, and they had to also engage in a conversation with other people from other teams, uh, in the process that, uh, they were, uh, making those contributions.

They could contribute to some open source projects that are large projects and they are being used. So it''s something that I''m looking for. Something we had some stats, uh, on github.', 'Do some research about DevOps topic, write an essay, and if the tool is open source, contribute to that tool and fix some issues and report it to the teachers. The open source project should have more than a hundred stars on Github.', true, 'github; open source; project; research; essay; issue; contribution; engagement; star; activity; task; mission; exercise; problem; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (191, 'Use the Katacoda website to students create tutorials about tools.

Change the requirements and the tools to solve the issues in environment setup on Katacoda.

The students write a tutorial about a DevOps tool on katacoda to describe the course automation.', 'In fact, some of them, we asked them to, um, to, if they wanted to do a tutorial on a tool, we ask them to upload that tutorial on, uh, Katacoda.

So we asked the students, uh, to, uh, use another tool if they want to present something that doesn''t work on katacoda. So, uh, the way that we solved it was to change the requirements and to change the, uh, change the environment and the tools that they had to use.

So that''s the course automation and executable tutorial was, uh, chatter, katacoda, um, website. They use the katacoda that website to, uh, to write a tutorial on a tool for them DevOps. Use the Katacoda website to students create tutorials about tools.

Change the requirements and the tools to solve the issues in environment setup on Katacoda.

The students write a tutorial about a DevOps tool on katacoda to describe the course automation. Use the Katacoda website to students create tutorials about tools. Change the requirements and the tools to solve the issues on Katacoda. katacoda; tutorial; issue; environment; setup; automation; tool; technology; automation; problem', 1, 'Katacoda website to tutorials about tools.', 'In fact, some of them, we asked them to, um, to, if they wanted to do a tutorial on a tool, we ask them to upload that tutorial on, uh, Katacoda.

So we asked the students, uh, to, uh, use another tool if they want to present something that doesn''t work on katacoda. So, uh, the way that we solved it was to change the requirements and to change the, uh, change the environment and the tools that they had to use.

So that''s the course automation and executable tutorial was, uh, chatter, katacoda, um, website. They use the katacoda that website to, uh, to write a tutorial on a tool for them DevOps.', 'Use the Katacoda website to students create tutorials about tools. Change the requirements and the tools to solve the issues on Katacoda.', false, 'katacoda; tutorial; issue; environment; setup; automation; tool; technology; automation; problem', 'tool / technology');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (192, 'Make students engage with people from other teams in the classes.

Engage in a conversation with teacher assistants and other students to make sure everything''s more work well.', 'And they had to also engage in a conversation with other people from other teams, uh, in the process that, uh, they were, uh, making those contributions.

Other task that we ask them to do something for our own course, and, uh, then, uh, engage in a conversation with TAs and other students to make sure everything''s more work well.
 Make students engage with people from other teams in the classes.

Engage in a conversation with teacher assistants and other students to make sure everything''s more work well. Make students engage with people from other teams in the classes. engagement; motivation; team; conversation; teacher assistant; ta; staff; discussion; responsibility', 1, 'students collaboration between different teams', 'And they had to also engage in a conversation with other people from other teams, uh, in the process that, uh, they were, uh, making those contributions.

Other task that we ask them to do something for our own course, and, uh, then, uh, engage in a conversation with TAs and other students to make sure everything''s more work well.
', 'Make students engage with people from other teams in the classes.', true, 'engagement; motivation; team; conversation; teacher assistant; ta; staff; discussion; responsibility', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (193, 'Teacher assistants help students with basics of DevOps concepts and tools.', 'if it was up to me, I would put some time to laying the background. And I''m talking about basics of DevOps and basics of some tools that are mainly used by everyone. Teacher assistants help students with basics of DevOps concepts and tools.  teacher assistant; ta; staff; concept; theory; team; strategy; execution', 1, 'improvement of knowledge of students in DevOps concepts and tools by a teacher assistant', 'if it was up to me, I would put some time to laying the background. And I''m talking about basics of DevOps and basics of some tools that are mainly used by everyone.', NULL, true, 'teacher assistant; ta; staff; concept; theory; team; strategy; execution', 'strategies in course execution');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (194, 'Two months with four hours in each week is enough to students with some background about software engineering.', 'I think the time that we had was actually enough, it was, I think about two months ... Students had, uh, four hours in each week and they had to work on the projects, um, as well.  ...  they had some information, some background about software engineering. Two months with four hours in each week is enough to students with some background about software engineering.  time; background; level; discipline; course; history; experience; curriculum; syllabus; schedule', 1, 'backgroun about software engenieeting', 'I think the time that we had was actually enough, it was, I think about two months ... Students had, uh, four hours in each week and they had to work on the projects, um, as well.  ...  they had some information, some background about software engineering.', NULL, false, 'time; background; level; discipline; course; history; experience; curriculum; syllabus; schedule', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (195, 'Look for a dying course to include a DevOps one in the curriculum.', 'So I had to find one that was dying and, uh, hopefully the colleague who was handling his dying course forgot to answer to an email. Look for a dying course to include a DevOps one in the curriculum.  discipline; course; curriculum; syllabus', 1, 'inclusion of DevOps discipline on curriculum', 'So I had to find one that was dying and, uh, hopefully the colleague who was handling his dying course forgot to answer to an email.', NULL, true, 'discipline; course; curriculum; syllabus', 'curriculum');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (196, 'Constantly discuss and share the DevOps teaching in an open way.', 'So it''s constantly discussing and constantly sharing in an open way, uh, what''s happening, how it''s teach, uh, how it''s story telling and how, how things are going. Constantly discuss and share the DevOps teaching in an open way.  discussion; sharing; teaching; training; learning; conversation; participation', 1, 'discussion and share of DevOps teaching in an open way', 'So it''s constantly discussing and constantly sharing in an open way, uh, what''s happening, how it''s teach, uh, how it''s story telling and how, how things are going.', NULL, true, 'discussion; sharing; teaching; training; learning; conversation; participation', 'devops concepts');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (197, 'Teachers could be half time industrial and half time faculty.', 'So this guy was really half time IBM and half time in the faculty of engineering. Teachers could be half time industrial and half time faculty.  industry; time; preparation', 1, 'half time industrial nd half time faculty', 'So this guy was really half time IBM and half time in the faculty of engineering.', NULL, false, 'industry; time; preparation', 'class preparation');
INSERT INTO public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) VALUES (198, 'DevOps tools are well integrated in Bluemix platform from IBM.', 'we use the bluemix, uh, platform from, uh, IBM, that was really, everything was integrated and those kinds of things that was really good in a way, DevOps tools are well integrated in Bluemix platform from IBM.  bluemix; platform; ibm; cloud; tool; technology; automation', 1, 'Bluemix platform as a DevOps tool', 'we use the bluemix, uh, platform from, uh, IBM, that was really, everything was integrated and those kinds of things that was really good in a way,', NULL, true, 'bluemix; platform; ibm; cloud; tool; technology; automation', 'tool / technology');


--
-- TOC entry 3379 (class 0 OID 16612)
-- Dependencies: 223
-- Data for Name: recommendation_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3380 (class 0 OID 16619)
-- Dependencies: 224
-- Data for Name: recommendation_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 22);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 240);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 101);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (1, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 291);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (2, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (4, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (4, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 139);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (5, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (7, 129);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (7, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (7, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (7, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 10);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 352);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 143);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 151);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (8, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 147);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 67);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 139);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 40);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (9, 68);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 139);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (10, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 335);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 213);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 257);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 383);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (11, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 85);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 150);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 153);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 367);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 333);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 2);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (12, 338);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 92);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 39);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (13, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 254);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 214);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 333);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (14, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (15, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (16, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (16, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (16, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (16, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 52);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 230);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 232);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (17, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 206);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 338);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 241);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (18, 337);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 5);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 197);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 43);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (19, 297);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 383);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (20, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 312);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 168);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 51);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 228);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (21, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (22, 255);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (22, 13);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (22, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (22, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (22, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (23, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 263);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 229);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 53);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 275);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 154);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 384);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (24, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 54);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 236);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (25, 123);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 296);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (26, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 296);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 14);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 213);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (27, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 293);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 23);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 256);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 333);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 360);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 112);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (29, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 147);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 195);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 169);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 13);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (30, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 87);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (32, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 305);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 370);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 321);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 39);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (33, 308);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 88);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 248);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (34, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 291);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 88);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 325);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (35, 248);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 291);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 22);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 169);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 183);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (36, 338);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 271);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 223);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 112);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 281);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (37, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 210);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 296);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (38, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (39, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 8);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 291);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 56);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 272);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (40, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 219);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 304);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 55);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 282);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 230);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (41, 232);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 55);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 223);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 80);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 23);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 176);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 112);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (43, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 140);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (44, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 352);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 262);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 143);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (45, 151);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 233);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 19);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 34);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (46, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 28);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 362);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 172);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 233);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 380);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 19);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 34);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 171);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (48, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 152);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 168);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 179);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 284);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (49, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 304);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 247);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 6);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 99);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 279);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (51, 185);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 364);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 138);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 99);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (52, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 307);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 291);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 35);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (53, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (54, 338);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (54, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (54, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (54, 150);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (54, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 82);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 237);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 333);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 231);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (55, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 357);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 362);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 215);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (56, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 330);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 386);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 131);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 381);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 274);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (57, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 215);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 188);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 374);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 99);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 54);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (58, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 276);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 128);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 127);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 374);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 264);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (59, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (60, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 215);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 362);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 55);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 118);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 125);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (61, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (62, 386);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (62, 274);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (62, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (62, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (62, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 132);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 202);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 115);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 93);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 51);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 294);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (63, 164);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 217);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 118);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 116);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (64, 212);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 360);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 171);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (66, 380);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 25);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (67, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 165);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 172);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 7);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (68, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 252);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 206);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 147);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 258);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 337);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 107);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (69, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 67);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 63);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 40);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (70, 68);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 135);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 260);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 206);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (71, 337);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 122);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (72, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 51);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 81);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 374);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 126);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 10);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 87);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (73, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 274);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 20);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 375);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (74, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 168);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (75, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (76, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (77, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 136);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 29);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 96);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (78, 99);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (79, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 17);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 16);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (80, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 374);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 33);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 382);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 126);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 51);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (81, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 99);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 271);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 281);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 270);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (82, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 361);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 45);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 127);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 3);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 128);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 225);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (83, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (84, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 199);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 273);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 358);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 25);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (85, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 384);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (86, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (87, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (87, 318);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (87, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (87, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 206);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (88, 337);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (89, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (89, 325);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (89, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 355);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 297);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 43);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (90, 5);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 273);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 220);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 280);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 242);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 277);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 189);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (91, 325);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 189);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 306);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 17);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 63);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 145);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (94, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 23);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (92, 53);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (93, 51);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (93, 257);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (93, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (93, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (93, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 206);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 258);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 359);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 337);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (95, 107);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 67);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 68);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 40);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 23);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (96, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 203);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 7);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 249);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 328);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 24);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 244);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 316);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 304);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 72);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 285);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 13);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (97, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 46);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 240);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (98, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (100, 308);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (100, 321);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (100, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (103, 41);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (103, 58);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (103, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (103, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (103, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 168);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 173);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 346);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (104, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (105, 335);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (105, 334);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (105, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (105, 9);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (106, 100);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (106, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (106, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (106, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (106, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 194);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 187);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 339);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 169);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (108, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 205);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 132);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 77);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 294);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (109, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 76);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 299);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 114);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 148);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 84);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 174);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (110, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 271);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 281);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (111, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 251);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 234);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (112, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 251);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 234);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 347);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 157);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 7);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 113);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (113, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (114, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 7);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 240);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 320);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (115, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 358);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 306);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 65);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 121);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 169);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 272);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (116, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 52);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 311);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 55);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 118);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 355);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 230);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 232);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (117, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 148);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 57);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 147);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (118, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 264);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 50);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 67);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 40);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (119, 68);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 283);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 192);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 49);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (120, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 279);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 185);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (121, 247);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (122, 181);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (122, 222);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (122, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (122, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (122, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 371);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 377);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (123, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 63);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (124, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (125, 298);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (125, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (125, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (125, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (125, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 322);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 257);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 171);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 160);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 123);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 283);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 119);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (126, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 15);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 67);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 40);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (127, 68);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 166);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 31);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 132);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 69);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 252);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 294);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 184);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (128, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 369);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 372);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (129, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 311);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 130);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 164);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (130, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 132);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (131, 294);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 124);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 283);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (132, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 274);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 209);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (133, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 274);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (134, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (136, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (136, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (136, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (136, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (136, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 69);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (137, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (138, 145);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (138, 376);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (138, 379);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (138, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (138, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (139, 127);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (139, 47);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 56);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 272);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (140, 8);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 288);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 152);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 62);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (141, 301);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 107);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 191);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 133);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 258);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (142, 42);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (143, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 261);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 27);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 323);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 37);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 147);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (144, 253);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 240);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 46);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (145, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (146, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (147, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (147, 54);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (147, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (147, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (148, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (148, 331);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (148, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (148, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (148, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 123);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 46);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 119);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (149, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 14);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (150, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 14);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 137);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 46);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (151, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (152, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (152, 254);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (152, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (152, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (152, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 98);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 63);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 176);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 17);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (153, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 243);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 204);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 14);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (154, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 322);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 257);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 171);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 160);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 123);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 283);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 119);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (155, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 31);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 115);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 302);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (156, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 14);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 300);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 248);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 88);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 332);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 90);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (157, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 211);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 200);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 372);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (158, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 66);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (159, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (160, 176);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (160, 168);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (160, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (160, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 169);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 63);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (161, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 70);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 161);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 235);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 289);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 134);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (162, 44);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 1);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (163, 89);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 36);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (164, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 309);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (165, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 220);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (166, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (167, 315);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (167, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (167, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (167, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 163);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 235);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (168, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 227);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 385);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 296);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (169, 241);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 123);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 189);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 43);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 5);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (170, 297);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 109);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 324);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 287);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (171, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 12);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 25);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 97);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 61);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 341);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 297);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (172, 5);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 86);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 239);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 278);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 159);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 235);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 296);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 275);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 279);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (173, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 324);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 170);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (175, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 366);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 216);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 91);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 267);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (176, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 238);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 32);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 190);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 216);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 221);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (177, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 324);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 176);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (178, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 363);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 178);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 184);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (179, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (180, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (180, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (180, 306);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 367);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 150);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 127);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 22);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 59);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 140);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 2);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (181, 338);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (183, 218);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (183, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (183, 285);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (183, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (183, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 39);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 108);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 132);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 90);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 164);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 268);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 11);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 314);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 353);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 294);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 88);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (184, 290);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 203);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 120);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 373);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 186);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (185, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 265);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 146);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 258);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 6);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 42);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 107);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (186, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 317);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 232);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 245);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 155);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 175);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 49);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 192);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 52);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (187, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 55);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 38);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 198);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 78);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 310);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 349);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (188, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 127);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 220);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 280);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 105);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 71);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 326);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 111);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (189, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 240);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 226);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 184);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (190, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 167);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 364);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 158);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 104);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 303);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (191, 250);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 103);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 207);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 324);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (192, 283);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 345);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 342);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 324);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 60);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 354);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 348);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 329);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (193, 110);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 355);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 23);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 176);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 142);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 112);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (194, 292);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (195, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (195, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (195, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (195, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 95);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 304);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 346);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 360);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 173);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 73);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (196, 230);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (197, 149);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (197, 355);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (197, 246);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 30);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 241);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 144);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 48);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 356);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 350);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (198, 21);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 102);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 94);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 74);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 79);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 340);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (199, 224);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 66);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 106);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 259);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 18);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 4);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 343);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 201);
INSERT INTO public.recommendation_tag (recommendation, tag) VALUES (200, 134);


--
-- TOC entry 3373 (class 0 OID 16533)
-- Dependencies: 217
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tag (id, descricao) VALUES (1, 'A/B');
INSERT INTO public.tag (id, descricao) VALUES (2, 'academy');
INSERT INTO public.tag (id, descricao) VALUES (3, 'actions');
INSERT INTO public.tag (id, descricao) VALUES (4, 'activity');
INSERT INTO public.tag (id, descricao) VALUES (5, 'adoption');
INSERT INTO public.tag (id, descricao) VALUES (6, 'advance');
INSERT INTO public.tag (id, descricao) VALUES (7, 'agile');
INSERT INTO public.tag (id, descricao) VALUES (8, 'analogy');
INSERT INTO public.tag (id, descricao) VALUES (9, 'analyse');
INSERT INTO public.tag (id, descricao) VALUES (10, 'ansible');
INSERT INTO public.tag (id, descricao) VALUES (11, 'answer');
INSERT INTO public.tag (id, descricao) VALUES (12, 'application');
INSERT INTO public.tag (id, descricao) VALUES (13, 'approach');
INSERT INTO public.tag (id, descricao) VALUES (14, 'architecture');
INSERT INTO public.tag (id, descricao) VALUES (15, 'argo cd');
INSERT INTO public.tag (id, descricao) VALUES (16, 'artifact');
INSERT INTO public.tag (id, descricao) VALUES (17, 'artifactory');
INSERT INTO public.tag (id, descricao) VALUES (18, 'assessment');
INSERT INTO public.tag (id, descricao) VALUES (19, 'attention');
INSERT INTO public.tag (id, descricao) VALUES (20, 'audio');
INSERT INTO public.tag (id, descricao) VALUES (21, 'automation');
INSERT INTO public.tag (id, descricao) VALUES (22, 'aws');
INSERT INTO public.tag (id, descricao) VALUES (23, 'background');
INSERT INTO public.tag (id, descricao) VALUES (24, 'backlog');
INSERT INTO public.tag (id, descricao) VALUES (25, 'balance');
INSERT INTO public.tag (id, descricao) VALUES (26, 'bamboo');
INSERT INTO public.tag (id, descricao) VALUES (27, 'benefit');
INSERT INTO public.tag (id, descricao) VALUES (28, 'block');
INSERT INTO public.tag (id, descricao) VALUES (29, 'blog');
INSERT INTO public.tag (id, descricao) VALUES (30, 'bluemix');
INSERT INTO public.tag (id, descricao) VALUES (31, 'board');
INSERT INTO public.tag (id, descricao) VALUES (32, 'book');
INSERT INTO public.tag (id, descricao) VALUES (33, 'branch');
INSERT INTO public.tag (id, descricao) VALUES (34, 'break');
INSERT INTO public.tag (id, descricao) VALUES (35, 'bug');
INSERT INTO public.tag (id, descricao) VALUES (36, 'build');
INSERT INTO public.tag (id, descricao) VALUES (37, 'business');
INSERT INTO public.tag (id, descricao) VALUES (38, 'buzzword');
INSERT INTO public.tag (id, descricao) VALUES (39, 'case study');
INSERT INTO public.tag (id, descricao) VALUES (40, 'cd');
INSERT INTO public.tag (id, descricao) VALUES (41, 'cdl');
INSERT INTO public.tag (id, descricao) VALUES (42, 'change');
INSERT INTO public.tag (id, descricao) VALUES (43, 'choice');
INSERT INTO public.tag (id, descricao) VALUES (44, 'ci');
INSERT INTO public.tag (id, descricao) VALUES (45, 'circle ci');
INSERT INTO public.tag (id, descricao) VALUES (46, 'class');
INSERT INTO public.tag (id, descricao) VALUES (47, 'classroom');
INSERT INTO public.tag (id, descricao) VALUES (48, 'cloud');
INSERT INTO public.tag (id, descricao) VALUES (49, 'coach');
INSERT INTO public.tag (id, descricao) VALUES (50, 'code coverage');
INSERT INTO public.tag (id, descricao) VALUES (51, 'coding');
INSERT INTO public.tag (id, descricao) VALUES (52, 'collaboration');
INSERT INTO public.tag (id, descricao) VALUES (53, 'combination');
INSERT INTO public.tag (id, descricao) VALUES (54, 'command');
INSERT INTO public.tag (id, descricao) VALUES (55, 'communication');
INSERT INTO public.tag (id, descricao) VALUES (56, 'comparison');
INSERT INTO public.tag (id, descricao) VALUES (57, 'compilation');
INSERT INTO public.tag (id, descricao) VALUES (58, 'comprehensive distance learning');
INSERT INTO public.tag (id, descricao) VALUES (59, 'computing resource');
INSERT INTO public.tag (id, descricao) VALUES (60, 'concept');
INSERT INTO public.tag (id, descricao) VALUES (61, 'conciliation');
INSERT INTO public.tag (id, descricao) VALUES (62, 'configuration');
INSERT INTO public.tag (id, descricao) VALUES (63, 'container');
INSERT INTO public.tag (id, descricao) VALUES (64, 'content');
INSERT INTO public.tag (id, descricao) VALUES (65, 'context');
INSERT INTO public.tag (id, descricao) VALUES (66, 'continuous');
INSERT INTO public.tag (id, descricao) VALUES (67, 'continuous delivery');
INSERT INTO public.tag (id, descricao) VALUES (68, 'continuous deployment');
INSERT INTO public.tag (id, descricao) VALUES (69, 'continuous improvement');
INSERT INTO public.tag (id, descricao) VALUES (70, 'continuous integration');
INSERT INTO public.tag (id, descricao) VALUES (71, 'contribution');
INSERT INTO public.tag (id, descricao) VALUES (72, 'convention');
INSERT INTO public.tag (id, descricao) VALUES (73, 'conversation');
INSERT INTO public.tag (id, descricao) VALUES (74, 'course');
INSERT INTO public.tag (id, descricao) VALUES (75, 'criteria');
INSERT INTO public.tag (id, descricao) VALUES (76, 'critical thinking');
INSERT INTO public.tag (id, descricao) VALUES (77, 'cross validation');
INSERT INTO public.tag (id, descricao) VALUES (78, 'culture');
INSERT INTO public.tag (id, descricao) VALUES (79, 'curriculum');
INSERT INTO public.tag (id, descricao) VALUES (80, 'customization');
INSERT INTO public.tag (id, descricao) VALUES (81, 'database');
INSERT INTO public.tag (id, descricao) VALUES (82, 'dealing');
INSERT INTO public.tag (id, descricao) VALUES (83, 'debug');
INSERT INTO public.tag (id, descricao) VALUES (84, 'decision-making');
INSERT INTO public.tag (id, descricao) VALUES (85, 'delegation');
INSERT INTO public.tag (id, descricao) VALUES (86, 'deliberable');
INSERT INTO public.tag (id, descricao) VALUES (87, 'delivery');
INSERT INTO public.tag (id, descricao) VALUES (88, 'demonstration');
INSERT INTO public.tag (id, descricao) VALUES (89, 'deployment');
INSERT INTO public.tag (id, descricao) VALUES (90, 'description');
INSERT INTO public.tag (id, descricao) VALUES (91, 'development');
INSERT INTO public.tag (id, descricao) VALUES (92, 'DevOps Handbook');
INSERT INTO public.tag (id, descricao) VALUES (93, 'difficulty');
INSERT INTO public.tag (id, descricao) VALUES (94, 'discipline');
INSERT INTO public.tag (id, descricao) VALUES (95, 'discussion');
INSERT INTO public.tag (id, descricao) VALUES (96, 'diversity');
INSERT INTO public.tag (id, descricao) VALUES (97, 'division');
INSERT INTO public.tag (id, descricao) VALUES (98, 'docker');
INSERT INTO public.tag (id, descricao) VALUES (99, 'documentation');
INSERT INTO public.tag (id, descricao) VALUES (100, 'dynamic');
INSERT INTO public.tag (id, descricao) VALUES (101, 'educational');
INSERT INTO public.tag (id, descricao) VALUES (102, 'elective');
INSERT INTO public.tag (id, descricao) VALUES (103, 'engagement');
INSERT INTO public.tag (id, descricao) VALUES (104, 'environment');
INSERT INTO public.tag (id, descricao) VALUES (105, 'essay');
INSERT INTO public.tag (id, descricao) VALUES (106, 'evaluation');
INSERT INTO public.tag (id, descricao) VALUES (107, 'evolution');
INSERT INTO public.tag (id, descricao) VALUES (108, 'exam');
INSERT INTO public.tag (id, descricao) VALUES (109, 'example');
INSERT INTO public.tag (id, descricao) VALUES (110, 'execution');
INSERT INTO public.tag (id, descricao) VALUES (111, 'exercise');
INSERT INTO public.tag (id, descricao) VALUES (112, 'experience');
INSERT INTO public.tag (id, descricao) VALUES (113, 'experimentation');
INSERT INTO public.tag (id, descricao) VALUES (114, 'extra-class');
INSERT INTO public.tag (id, descricao) VALUES (115, 'failure');
INSERT INTO public.tag (id, descricao) VALUES (116, 'fear');
INSERT INTO public.tag (id, descricao) VALUES (117, 'feature');
INSERT INTO public.tag (id, descricao) VALUES (118, 'feedback');
INSERT INTO public.tag (id, descricao) VALUES (119, 'flexibility');
INSERT INTO public.tag (id, descricao) VALUES (120, 'flow');
INSERT INTO public.tag (id, descricao) VALUES (121, 'focus');
INSERT INTO public.tag (id, descricao) VALUES (122, 'forum');
INSERT INTO public.tag (id, descricao) VALUES (123, 'freedom');
INSERT INTO public.tag (id, descricao) VALUES (124, 'fun');
INSERT INTO public.tag (id, descricao) VALUES (125, 'gist');
INSERT INTO public.tag (id, descricao) VALUES (126, 'git');
INSERT INTO public.tag (id, descricao) VALUES (127, 'github');
INSERT INTO public.tag (id, descricao) VALUES (128, 'gitlab');
INSERT INTO public.tag (id, descricao) VALUES (129, 'gns3');
INSERT INTO public.tag (id, descricao) VALUES (130, 'google docs');
INSERT INTO public.tag (id, descricao) VALUES (131, 'google meet');
INSERT INTO public.tag (id, descricao) VALUES (132, 'grade');
INSERT INTO public.tag (id, descricao) VALUES (133, 'gradle');
INSERT INTO public.tag (id, descricao) VALUES (134, 'gradual');
INSERT INTO public.tag (id, descricao) VALUES (135, 'grafana');
INSERT INTO public.tag (id, descricao) VALUES (136, 'gray literature');
INSERT INTO public.tag (id, descricao) VALUES (137, 'group');
INSERT INTO public.tag (id, descricao) VALUES (138, 'guideline');
INSERT INTO public.tag (id, descricao) VALUES (139, 'hands-on');
INSERT INTO public.tag (id, descricao) VALUES (140, 'hardware');
INSERT INTO public.tag (id, descricao) VALUES (141, 'hierarchy');
INSERT INTO public.tag (id, descricao) VALUES (142, 'history');
INSERT INTO public.tag (id, descricao) VALUES (143, 'iac');
INSERT INTO public.tag (id, descricao) VALUES (144, 'ibm');
INSERT INTO public.tag (id, descricao) VALUES (145, 'image');
INSERT INTO public.tag (id, descricao) VALUES (146, 'improvement');
INSERT INTO public.tag (id, descricao) VALUES (147, 'incremental');
INSERT INTO public.tag (id, descricao) VALUES (148, 'independence');
INSERT INTO public.tag (id, descricao) VALUES (149, 'industry');
INSERT INTO public.tag (id, descricao) VALUES (150, 'infrastructure');
INSERT INTO public.tag (id, descricao) VALUES (151, 'infrastructure as code');
INSERT INTO public.tag (id, descricao) VALUES (152, 'installation');
INSERT INTO public.tag (id, descricao) VALUES (153, 'institution');
INSERT INTO public.tag (id, descricao) VALUES (154, 'integration');
INSERT INTO public.tag (id, descricao) VALUES (155, 'interaction');
INSERT INTO public.tag (id, descricao) VALUES (156, 'interconnection');
INSERT INTO public.tag (id, descricao) VALUES (157, 'inverted class');
INSERT INTO public.tag (id, descricao) VALUES (158, 'issue');
INSERT INTO public.tag (id, descricao) VALUES (159, 'iteration');
INSERT INTO public.tag (id, descricao) VALUES (160, 'java');
INSERT INTO public.tag (id, descricao) VALUES (161, 'jenkins');
INSERT INTO public.tag (id, descricao) VALUES (162, 'jira');
INSERT INTO public.tag (id, descricao) VALUES (163, 'jmeter');
INSERT INTO public.tag (id, descricao) VALUES (164, 'justification');
INSERT INTO public.tag (id, descricao) VALUES (165, 'kaisen');
INSERT INTO public.tag (id, descricao) VALUES (166, 'kanban');
INSERT INTO public.tag (id, descricao) VALUES (167, 'katacoda');
INSERT INTO public.tag (id, descricao) VALUES (168, 'knowledge');
INSERT INTO public.tag (id, descricao) VALUES (169, 'kubernetes');
INSERT INTO public.tag (id, descricao) VALUES (170, 'lab');
INSERT INTO public.tag (id, descricao) VALUES (171, 'language');
INSERT INTO public.tag (id, descricao) VALUES (172, 'lean');
INSERT INTO public.tag (id, descricao) VALUES (173, 'learning');
INSERT INTO public.tag (id, descricao) VALUES (174, 'learning process');
INSERT INTO public.tag (id, descricao) VALUES (175, 'lecture');
INSERT INTO public.tag (id, descricao) VALUES (176, 'level');
INSERT INTO public.tag (id, descricao) VALUES (177, 'licence');
INSERT INTO public.tag (id, descricao) VALUES (178, 'lifecycle');
INSERT INTO public.tag (id, descricao) VALUES (179, 'limitation');
INSERT INTO public.tag (id, descricao) VALUES (180, 'linking');
INSERT INTO public.tag (id, descricao) VALUES (181, 'linux');
INSERT INTO public.tag (id, descricao) VALUES (182, 'literature');
INSERT INTO public.tag (id, descricao) VALUES (183, 'local machine');
INSERT INTO public.tag (id, descricao) VALUES (184, 'management');
INSERT INTO public.tag (id, descricao) VALUES (185, 'mandatory');
INSERT INTO public.tag (id, descricao) VALUES (186, 'mapping');
INSERT INTO public.tag (id, descricao) VALUES (187, 'marathon');
INSERT INTO public.tag (id, descricao) VALUES (188, 'markdown');
INSERT INTO public.tag (id, descricao) VALUES (189, 'market');
INSERT INTO public.tag (id, descricao) VALUES (190, 'material');
INSERT INTO public.tag (id, descricao) VALUES (191, 'maven');
INSERT INTO public.tag (id, descricao) VALUES (192, 'mentor');
INSERT INTO public.tag (id, descricao) VALUES (193, 'merge');
INSERT INTO public.tag (id, descricao) VALUES (194, 'mesos');
INSERT INTO public.tag (id, descricao) VALUES (195, 'methodology');
INSERT INTO public.tag (id, descricao) VALUES (196, 'metric');
INSERT INTO public.tag (id, descricao) VALUES (197, 'migration');
INSERT INTO public.tag (id, descricao) VALUES (198, 'mindset');
INSERT INTO public.tag (id, descricao) VALUES (199, 'minimal');
INSERT INTO public.tag (id, descricao) VALUES (200, 'minimum viable product');
INSERT INTO public.tag (id, descricao) VALUES (201, 'mission');
INSERT INTO public.tag (id, descricao) VALUES (202, 'mistake');
INSERT INTO public.tag (id, descricao) VALUES (203, 'model');
INSERT INTO public.tag (id, descricao) VALUES (204, 'modular');
INSERT INTO public.tag (id, descricao) VALUES (205, 'monitor');
INSERT INTO public.tag (id, descricao) VALUES (206, 'monitoring');
INSERT INTO public.tag (id, descricao) VALUES (207, 'motivation');
INSERT INTO public.tag (id, descricao) VALUES (208, 'multidisciplinary');
INSERT INTO public.tag (id, descricao) VALUES (209, 'multiple choice');
INSERT INTO public.tag (id, descricao) VALUES (210, 'mutation');
INSERT INTO public.tag (id, descricao) VALUES (211, 'mvp');
INSERT INTO public.tag (id, descricao) VALUES (212, 'net promoter score');
INSERT INTO public.tag (id, descricao) VALUES (213, 'network');
INSERT INTO public.tag (id, descricao) VALUES (214, 'non-functional');
INSERT INTO public.tag (id, descricao) VALUES (215, 'notion');
INSERT INTO public.tag (id, descricao) VALUES (216, 'novel');
INSERT INTO public.tag (id, descricao) VALUES (217, 'nps');
INSERT INTO public.tag (id, descricao) VALUES (218, 'objective');
INSERT INTO public.tag (id, descricao) VALUES (219, 'observability');
INSERT INTO public.tag (id, descricao) VALUES (220, 'open source');
INSERT INTO public.tag (id, descricao) VALUES (221, 'operation');
INSERT INTO public.tag (id, descricao) VALUES (222, 'operational system');
INSERT INTO public.tag (id, descricao) VALUES (223, 'opinion');
INSERT INTO public.tag (id, descricao) VALUES (224, 'optional');
INSERT INTO public.tag (id, descricao) VALUES (225, 'orchestration');
INSERT INTO public.tag (id, descricao) VALUES (226, 'organization');
INSERT INTO public.tag (id, descricao) VALUES (227, 'owasp');
INSERT INTO public.tag (id, descricao) VALUES (228, 'pair programming');
INSERT INTO public.tag (id, descricao) VALUES (229, 'paper');
INSERT INTO public.tag (id, descricao) VALUES (230, 'participation');
INSERT INTO public.tag (id, descricao) VALUES (231, 'particular');
INSERT INTO public.tag (id, descricao) VALUES (232, 'partnership');
INSERT INTO public.tag (id, descricao) VALUES (233, 'pause');
INSERT INTO public.tag (id, descricao) VALUES (234, 'pbl');
INSERT INTO public.tag (id, descricao) VALUES (235, 'performance');
INSERT INTO public.tag (id, descricao) VALUES (236, 'permission');
INSERT INTO public.tag (id, descricao) VALUES (237, 'personalization');
INSERT INTO public.tag (id, descricao) VALUES (238, 'phoenix');
INSERT INTO public.tag (id, descricao) VALUES (239, 'pipeline');
INSERT INTO public.tag (id, descricao) VALUES (240, 'planning');
INSERT INTO public.tag (id, descricao) VALUES (241, 'platform');
INSERT INTO public.tag (id, descricao) VALUES (242, 'popular');
INSERT INTO public.tag (id, descricao) VALUES (243, 'portable');
INSERT INTO public.tag (id, descricao) VALUES (244, 'post mortem');
INSERT INTO public.tag (id, descricao) VALUES (245, 'practice');
INSERT INTO public.tag (id, descricao) VALUES (246, 'preparation');
INSERT INTO public.tag (id, descricao) VALUES (247, 'prerequisite');
INSERT INTO public.tag (id, descricao) VALUES (248, 'presentation');
INSERT INTO public.tag (id, descricao) VALUES (249, 'principle');
INSERT INTO public.tag (id, descricao) VALUES (250, 'problem');
INSERT INTO public.tag (id, descricao) VALUES (251, 'problem based learning');
INSERT INTO public.tag (id, descricao) VALUES (252, 'process');
INSERT INTO public.tag (id, descricao) VALUES (253, 'product');
INSERT INTO public.tag (id, descricao) VALUES (254, 'production');
INSERT INTO public.tag (id, descricao) VALUES (255, 'professional');
INSERT INTO public.tag (id, descricao) VALUES (256, 'profile');
INSERT INTO public.tag (id, descricao) VALUES (257, 'programming');
INSERT INTO public.tag (id, descricao) VALUES (258, 'progress');
INSERT INTO public.tag (id, descricao) VALUES (259, 'project');
INSERT INTO public.tag (id, descricao) VALUES (260, 'prometheus');
INSERT INTO public.tag (id, descricao) VALUES (261, 'promotion');
INSERT INTO public.tag (id, descricao) VALUES (262, 'provisioning');
INSERT INTO public.tag (id, descricao) VALUES (263, 'publication');
INSERT INTO public.tag (id, descricao) VALUES (264, 'pull request');
INSERT INTO public.tag (id, descricao) VALUES (265, 'quality');
INSERT INTO public.tag (id, descricao) VALUES (266, 'quantitative');
INSERT INTO public.tag (id, descricao) VALUES (267, 'question');
INSERT INTO public.tag (id, descricao) VALUES (268, 'quiz');
INSERT INTO public.tag (id, descricao) VALUES (269, 'realistic');
INSERT INTO public.tag (id, descricao) VALUES (270, 'record');
INSERT INTO public.tag (id, descricao) VALUES (271, 'reference');
INSERT INTO public.tag (id, descricao) VALUES (272, 'relation');
INSERT INTO public.tag (id, descricao) VALUES (273, 'relevant');
INSERT INTO public.tag (id, descricao) VALUES (274, 'remote');
INSERT INTO public.tag (id, descricao) VALUES (275, 'report');
INSERT INTO public.tag (id, descricao) VALUES (276, 'repository');
INSERT INTO public.tag (id, descricao) VALUES (277, 'representative');
INSERT INTO public.tag (id, descricao) VALUES (278, 'requirement');
INSERT INTO public.tag (id, descricao) VALUES (279, 'requisite');
INSERT INTO public.tag (id, descricao) VALUES (280, 'research');
INSERT INTO public.tag (id, descricao) VALUES (281, 'resource');
INSERT INTO public.tag (id, descricao) VALUES (282, 'respect');
INSERT INTO public.tag (id, descricao) VALUES (283, 'responsibility');
INSERT INTO public.tag (id, descricao) VALUES (284, 'restriction');
INSERT INTO public.tag (id, descricao) VALUES (285, 'rule');
INSERT INTO public.tag (id, descricao) VALUES (286, 'running');
INSERT INTO public.tag (id, descricao) VALUES (287, 'sample');
INSERT INTO public.tag (id, descricao) VALUES (288, 'sas');
INSERT INTO public.tag (id, descricao) VALUES (289, 'scalability');
INSERT INTO public.tag (id, descricao) VALUES (290, 'scale');
INSERT INTO public.tag (id, descricao) VALUES (291, 'scenario');
INSERT INTO public.tag (id, descricao) VALUES (292, 'schedule');
INSERT INTO public.tag (id, descricao) VALUES (293, 'scope');
INSERT INTO public.tag (id, descricao) VALUES (294, 'score');
INSERT INTO public.tag (id, descricao) VALUES (295, 'script');
INSERT INTO public.tag (id, descricao) VALUES (296, 'security');
INSERT INTO public.tag (id, descricao) VALUES (297, 'selection');
INSERT INTO public.tag (id, descricao) VALUES (298, 'selenium');
INSERT INTO public.tag (id, descricao) VALUES (299, 'self-taught');
INSERT INTO public.tag (id, descricao) VALUES (300, 'seminar');
INSERT INTO public.tag (id, descricao) VALUES (301, 'service');
INSERT INTO public.tag (id, descricao) VALUES (302, 'session');
INSERT INTO public.tag (id, descricao) VALUES (303, 'setup');
INSERT INTO public.tag (id, descricao) VALUES (304, 'sharing');
INSERT INTO public.tag (id, descricao) VALUES (305, 'silo');
INSERT INTO public.tag (id, descricao) VALUES (306, 'simple');
INSERT INTO public.tag (id, descricao) VALUES (307, 'simulation');
INSERT INTO public.tag (id, descricao) VALUES (308, 'site reliability engineering');
INSERT INTO public.tag (id, descricao) VALUES (309, 'size');
INSERT INTO public.tag (id, descricao) VALUES (310, 'skill');
INSERT INTO public.tag (id, descricao) VALUES (311, 'slack');
INSERT INTO public.tag (id, descricao) VALUES (312, 'social');
INSERT INTO public.tag (id, descricao) VALUES (313, 'software');
INSERT INTO public.tag (id, descricao) VALUES (314, 'solution');
INSERT INTO public.tag (id, descricao) VALUES (315, 'sonarqube');
INSERT INTO public.tag (id, descricao) VALUES (316, 'sotrytelling');
INSERT INTO public.tag (id, descricao) VALUES (317, 'speaker');
INSERT INTO public.tag (id, descricao) VALUES (318, 'specialization course');
INSERT INTO public.tag (id, descricao) VALUES (319, 'spring');
INSERT INTO public.tag (id, descricao) VALUES (320, 'sprint');
INSERT INTO public.tag (id, descricao) VALUES (321, 'SRE');
INSERT INTO public.tag (id, descricao) VALUES (322, 'stack');
INSERT INTO public.tag (id, descricao) VALUES (323, 'stackholder');
INSERT INTO public.tag (id, descricao) VALUES (324, 'staff');
INSERT INTO public.tag (id, descricao) VALUES (325, 'standard');
INSERT INTO public.tag (id, descricao) VALUES (326, 'star');
INSERT INTO public.tag (id, descricao) VALUES (327, 'state of the art');
INSERT INTO public.tag (id, descricao) VALUES (328, 'story');
INSERT INTO public.tag (id, descricao) VALUES (329, 'strategy');
INSERT INTO public.tag (id, descricao) VALUES (330, 'streaming');
INSERT INTO public.tag (id, descricao) VALUES (331, 'stress');
INSERT INTO public.tag (id, descricao) VALUES (332, 'structure');
INSERT INTO public.tag (id, descricao) VALUES (333, 'student');
INSERT INTO public.tag (id, descricao) VALUES (334, 'study');
INSERT INTO public.tag (id, descricao) VALUES (335, 'subject');
INSERT INTO public.tag (id, descricao) VALUES (336, 'subjectivity');
INSERT INTO public.tag (id, descricao) VALUES (337, 'supervision');
INSERT INTO public.tag (id, descricao) VALUES (338, 'support');
INSERT INTO public.tag (id, descricao) VALUES (339, 'swarm');
INSERT INTO public.tag (id, descricao) VALUES (340, 'syllabus');
INSERT INTO public.tag (id, descricao) VALUES (341, 'system');
INSERT INTO public.tag (id, descricao) VALUES (342, 'ta');
INSERT INTO public.tag (id, descricao) VALUES (343, 'task');
INSERT INTO public.tag (id, descricao) VALUES (344, 'taxonomy');
INSERT INTO public.tag (id, descricao) VALUES (345, 'teacher assistant');
INSERT INTO public.tag (id, descricao) VALUES (346, 'teaching');
INSERT INTO public.tag (id, descricao) VALUES (347, 'teaching method');
INSERT INTO public.tag (id, descricao) VALUES (348, 'team');
INSERT INTO public.tag (id, descricao) VALUES (349, 'technique');
INSERT INTO public.tag (id, descricao) VALUES (350, 'technology');
INSERT INTO public.tag (id, descricao) VALUES (351, 'telemetry');
INSERT INTO public.tag (id, descricao) VALUES (352, 'terraform');
INSERT INTO public.tag (id, descricao) VALUES (353, 'test');
INSERT INTO public.tag (id, descricao) VALUES (354, 'theory');
INSERT INTO public.tag (id, descricao) VALUES (355, 'time');
INSERT INTO public.tag (id, descricao) VALUES (356, 'tool');
INSERT INTO public.tag (id, descricao) VALUES (357, 'tracking');
INSERT INTO public.tag (id, descricao) VALUES (358, 'tradeoff');
INSERT INTO public.tag (id, descricao) VALUES (359, 'traditional');
INSERT INTO public.tag (id, descricao) VALUES (360, 'training');
INSERT INTO public.tag (id, descricao) VALUES (361, 'travis');
INSERT INTO public.tag (id, descricao) VALUES (362, 'trello');
INSERT INTO public.tag (id, descricao) VALUES (363, 'tuleap');
INSERT INTO public.tag (id, descricao) VALUES (364, 'tutorial');
INSERT INTO public.tag (id, descricao) VALUES (365, 'understanding');
INSERT INTO public.tag (id, descricao) VALUES (366, 'unicorn');
INSERT INTO public.tag (id, descricao) VALUES (367, 'university');
INSERT INTO public.tag (id, descricao) VALUES (368, 'up-to-date');
INSERT INTO public.tag (id, descricao) VALUES (369, 'update');
INSERT INTO public.tag (id, descricao) VALUES (370, 'use case');
INSERT INTO public.tag (id, descricao) VALUES (371, 'vagrant');
INSERT INTO public.tag (id, descricao) VALUES (372, 'validation');
INSERT INTO public.tag (id, descricao) VALUES (373, 'value stream');
INSERT INTO public.tag (id, descricao) VALUES (374, 'versioning');
INSERT INTO public.tag (id, descricao) VALUES (375, 'video');
INSERT INTO public.tag (id, descricao) VALUES (376, 'virtual machine');
INSERT INTO public.tag (id, descricao) VALUES (377, 'virtualbox');
INSERT INTO public.tag (id, descricao) VALUES (378, 'virtualization');
INSERT INTO public.tag (id, descricao) VALUES (379, 'vm');
INSERT INTO public.tag (id, descricao) VALUES (380, 'voice');
INSERT INTO public.tag (id, descricao) VALUES (381, 'webex');
INSERT INTO public.tag (id, descricao) VALUES (382, 'workflow');
INSERT INTO public.tag (id, descricao) VALUES (383, 'workload');
INSERT INTO public.tag (id, descricao) VALUES (384, 'writing');
INSERT INTO public.tag (id, descricao) VALUES (385, 'zap');
INSERT INTO public.tag (id, descricao) VALUES (386, 'zoom');


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 215
-- Name: seq_link_feedback; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_link_feedback', 1, false);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 216
-- Name: seq_recommendation_feedback; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_recommendation_feedback', 1, false);


--
-- TOC entry 3208 (class 2606 OID 16587)
-- Name: challenge challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16592)
-- Name: challenge_tag challenge_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT challenge_tag_pkey PRIMARY KEY (challenge, tag);


--
-- TOC entry 3214 (class 2606 OID 16604)
-- Name: link_feedback link_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_feedback
    ADD CONSTRAINT link_feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16597)
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (challenge, recommendation);


--
-- TOC entry 3218 (class 2606 OID 16618)
-- Name: recommendation_feedback recommendation_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation_feedback
    ADD CONSTRAINT recommendation_feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16611)
-- Name: recommendation recommendation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation
    ADD CONSTRAINT recommendation_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16623)
-- Name: recommendation_tag recommendation_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT recommendation_tag_pkey PRIMARY KEY (recommendation, tag);


--
-- TOC entry 3204 (class 2606 OID 16537)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16539)
-- Name: tag uk_58u775g08wj3bi8lpkjoorlfj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT uk_58u775g08wj3bi8lpkjoorlfj UNIQUE (descricao);


--
-- TOC entry 3221 (class 2606 OID 16624)
-- Name: challenge_tag fk_challengetag_challenge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT fk_challengetag_challenge FOREIGN KEY (challenge) REFERENCES public.challenge(id);


--
-- TOC entry 3222 (class 2606 OID 16629)
-- Name: challenge_tag fk_challengetag_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT fk_challengetag_tag FOREIGN KEY (tag) REFERENCES public.tag(id);


--
-- TOC entry 3223 (class 2606 OID 16634)
-- Name: link fk_link_challenge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_link_challenge FOREIGN KEY (challenge) REFERENCES public.challenge(id);


--
-- TOC entry 3224 (class 2606 OID 16639)
-- Name: link fk_link_recommendation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_link_recommendation FOREIGN KEY (recommendation) REFERENCES public.recommendation(id);


--
-- TOC entry 3226 (class 2606 OID 16649)
-- Name: recommendation_feedback fk_recommendationfeedback_recommendation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation_feedback
    ADD CONSTRAINT fk_recommendationfeedback_recommendation FOREIGN KEY (recommendation_id) REFERENCES public.recommendation(id);


--
-- TOC entry 3227 (class 2606 OID 16654)
-- Name: recommendation_tag fk_recommendationtag_recommendation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT fk_recommendationtag_recommendation FOREIGN KEY (recommendation) REFERENCES public.recommendation(id);


--
-- TOC entry 3228 (class 2606 OID 16659)
-- Name: recommendation_tag fk_recommendationtag_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT fk_recommendationtag_tag FOREIGN KEY (tag) REFERENCES public.tag(id);


--
-- TOC entry 3225 (class 2606 OID 16644)
-- Name: link_feedback fkkckr1mj07fxhhxsfmbvhv307u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_feedback
    ADD CONSTRAINT fkkckr1mj07fxhhxsfmbvhv307u FOREIGN KEY (link_challenge, link_recommendation) REFERENCES public.link(challenge, recommendation);


-- Completed on 2023-04-29 01:57:55

--
-- PostgreSQL database dump complete
--

