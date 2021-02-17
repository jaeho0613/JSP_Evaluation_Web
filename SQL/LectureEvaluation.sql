-- 데이터 베이스 생성
create database LectureEvaluation;
use LectureEvaluation;

-- 유저 테이블 
create table user (
	userID varchar(20),
    userPassword varchar(64),
    userEmail varchar(50),
    userEmailHash varchar(64),
    userEmailChecked boolean
);

-- 강의 평가 테이블
create table evaluation (
	evaluationID int primary key auto_increment,
    userID varchar(20),
    lectureName varchar(50),
    professorName varchar(20),
    lectureYear int,
    semesterDivide varchar(20),
    lectureDivide varchar(10),
    evaluationTitle varchar(50),
    evaluationContent varchar(2048),
    totalScore varchar(5),
    creditScore varchar(5),
    comfortableScroe varchar(5),
    lectureScroe varchar(5),
    likeCount int
);

-- 게시물에 좋아요를 누른 사용자를 저장
create table likey(
	userID varchar(20),
    evaluationID int,
    userIP varchar(50)
);

alter table user add primary key (userID);

desc user;
desc evaluation;
desc likey;