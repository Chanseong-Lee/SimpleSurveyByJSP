create table "SURVEY"(
    "NUM" number,
    "FOODNAME" varchar2(20) unique not null,
    "COUNTVOTE" number default 0 not null,
    constraint "SURVEY_PK" primary key("NUM")
);

select * from survey;

create sequence "SURVEY_SEQ" start with 1 increment by 1 noorder nocache nocycle nomaxvalue;

--test query
insert into "SURVEY" values("SURVEY_SEQ".nextval, '한식', 0);
insert into "SURVEY" values("SURVEY_SEQ".nextval, '중식', 1);
update "SURVEY" set "COUNTVOTE"="COUNTVOTE"+1 where "FOODNAME"='중식';
select "FOODNAME", "COUNTVOTE" from "SURVEY";
select count(*) from "SURVEY";
commit;