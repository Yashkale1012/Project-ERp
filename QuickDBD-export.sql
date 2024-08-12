-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Student` (
    `StudentID` int  NOT NULL ,
    `Name` varchar(50)  NOT NULL ,
    `Email` varchar(50)  NOT NULL ,
    `PhoneNum` int  NOT NULL ,
    `UserId` varchar(50)  NOT NULL ,
    `Password` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `StudentID`
    ),
    CONSTRAINT `uc_Student_UserId` UNIQUE (
        `UserId`
    )
);

CREATE TABLE `Faculty` (
    `TeacherID` int  NOT NULL ,
    `Name` varchar(50)  NOT NULL ,
    `Mail` varchar(50)  NOT NULL ,
    `PhoneNum` int  NOT NULL ,
    `UserId` varchar(50)  NOT NULL ,
    `Password` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `TeacherID`
    ),
    CONSTRAINT `uc_Faculty_UserId` UNIQUE (
        `UserId`
    )
);

CREATE TABLE `Subject` (
    `SubjectID` int  NOT NULL ,
    `SubjectName` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `SubjectID`
    )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE `QuestionPapers` (
    `ExamID` int  NOT NULL ,
    -- composite key (ExamID,PaperID)
    `Question` varchar(200)  NOT NULL ,
    `OptionA` char  NOT NULL ,
    `OptionB` char  NOT NULL ,
    `OptionC` char  NOT NULL ,
    `OptionD` char  NOT NULL ,
    `Answer` char  NOT NULL ,

    CONSTRAINT `uc_QuestionPapers_Question` UNIQUE (
        `Question`
    )
);

CREATE TABLE `Result` (
    `StudentID` int  NOT NULL ,
    `ExamID` int  NOT NULL ,
    `Name` varchar(50)  NOT NULL ,
    `Score` int  NOT NULL ,
    `Result` enum(Pass,Fail)  NOT NULL ,

    CONSTRAINT `uc_Result_Name` UNIQUE (
        `Name`
    )
);

CREATE TABLE `Student_Subject` (
    `StudentID` int  NOT NULL ,
    `SubjectID` int  NOT NULL 
);

CREATE TABLE `Faculty_Subject` (
    `TeacherID` int  NOT NULL ,
    `SubjectID` int  NOT NULL 
);

CREATE TABLE `Exams` (
    `ExamID` int  NOT NULL ,
    `SubjectID` int  NOT NULL ,
    `Time` time  NOT NULL ,
    `Date` date  NOT NULL ,
    PRIMARY KEY (
        `ExamID`
    )
);

ALTER TABLE `Result` ADD CONSTRAINT `fk_Result_StudentID` FOREIGN KEY(`StudentID`)
REFERENCES `Student` (`StudentID`);

ALTER TABLE `Result` ADD CONSTRAINT `fk_Result_ExamID` FOREIGN KEY(`ExamID`)
REFERENCES `Exams` (`ExamID`);

ALTER TABLE `Student_Subject` ADD CONSTRAINT `fk_Student_Subject_StudentID` FOREIGN KEY(`StudentID`)
REFERENCES `Student` (`StudentID`);

ALTER TABLE `Student_Subject` ADD CONSTRAINT `fk_Student_Subject_SubjectID` FOREIGN KEY(`SubjectID`)
REFERENCES `Subject` (`SubjectID`);

ALTER TABLE `Faculty_Subject` ADD CONSTRAINT `fk_Faculty_Subject_TeacherID` FOREIGN KEY(`TeacherID`)
REFERENCES `Faculty` (`TeacherID`);

ALTER TABLE `Faculty_Subject` ADD CONSTRAINT `fk_Faculty_Subject_SubjectID` FOREIGN KEY(`SubjectID`)
REFERENCES `Subject` (`SubjectID`);

ALTER TABLE `Exams` ADD CONSTRAINT `fk_Exams_ExamID` FOREIGN KEY(`ExamID`)
REFERENCES `QuestionPapers` (`ExamID`);

ALTER TABLE `Exams` ADD CONSTRAINT `fk_Exams_SubjectID` FOREIGN KEY(`SubjectID`)
REFERENCES `Subject` (`SubjectID`);

