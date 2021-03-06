USE [ExaminationSystem]
GO
/****** Object:  Schema [QEX]    Script Date: 24/04/2020 11:31:29 م ******/
CREATE SCHEMA [QEX]
GO
/****** Object:  Schema [STU]    Script Date: 24/04/2020 11:31:29 م ******/
CREATE SCHEMA [STU]
GO
/****** Object:  Table [dbo].[InstructorManger]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorManger](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_InstructorManger] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MangerID] [int] NULL,
	[username] [nvarchar](30) NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  View [dbo].[GetManager]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[GetManager]
as

select name from [dbo].[Instructor] i
join [dbo].[InstructorManger] im
on i.[ID]=im.InstructorID
GO
/****** Object:  Table [dbo].[Course]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Max-Degree] [int] NOT NULL,
	[Min-Degree] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
/****** Object:  View [dbo].[GetCourse]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetCourse]
as 
select [name] from [dbo].[Course]
GO
/****** Object:  Table [dbo].[TrueFalse]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrueFalse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[CourseID] [int] NULL,
	[Answer] [char](1) NULL,
 CONSTRAINT [PK_TrueFalse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
/****** Object:  View [dbo].[GetQuestionA]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetQuestionA]
as
select [QuestionText] ,[Answer] from [dbo].[TrueFalse]
GO
/****** Object:  Table [dbo].[TextQuestions]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_TextQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
/****** Object:  View [dbo].[GetQuestionT]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetQuestionT]
as
select [QuestionText] ,[Answer] from [dbo].[TextQuestions]
GO
/****** Object:  Table [dbo].[MSQ]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[CourseID] [int] NULL,
 CONSTRAINT [PK_MSQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
/****** Object:  View [dbo].[GetQuestionC]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetQuestionC]
as
select [QuestionText] ,[Choices] from [dbo].[MSQ] ms
join[dbo].[Choice] c
on ms.ID=c.McqID
where c.IsTrue='T';
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[BTI]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTI](
	[BranchID] [int] NOT NULL,
	[TrackID] [int] NOT NULL,
	[IntakeID] [int] NOT NULL,
 CONSTRAINT [PK_BTI] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC,
	[TrackID] ASC,
	[IntakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](15) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[TotalTime] [int] NOT NULL,
	[EndTime]  AS (dateadd(hour,[TotalTime],[StartTime])),
	[AllowanceOption] [nchar](10) NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Instructorcourse]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructorcourse](
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_Instructorcourse] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[LoginAccount]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginAccount](
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LoginAccount] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[McqAnswer]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[McqAnswer](
	[StudentID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[McqID] [int] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_McqAnswer] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ExamID] ASC,
	[McqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
/****** Object:  Table [dbo].[McqExam]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[McqExam](
	[ExamID] [int] NOT NULL,
	[McqID] [int] NOT NULL,
	[Mark] [float] NOT NULL,
 CONSTRAINT [PK_McqExam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[McqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BranchID] [int] NOT NULL,
	[TrackID] [int] NOT NULL,
	[IntakeID] [int] NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[StudenID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[Result] [float] NULL,
 CONSTRAINT [PK_StudentExam] PRIMARY KEY CLUSTERED 
(
	[StudenID] ASC,
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[StudentMcqAnswer]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentMcqAnswer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[McqID] [int] NOT NULL,
	[ChoiceID] [int] NOT NULL,
 CONSTRAINT [PK_StudentMcqAnswer] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ExamID] ASC,
	[McqID] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[TextExam]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextExam](
	[ExamID] [int] NOT NULL,
	[TextID] [int] NOT NULL,
	[Mark] [float] NOT NULL,
 CONSTRAINT [PK_TextExam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[TextID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[TextQAnswer]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextQAnswer](
	[StudentID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[TextID] [int] NOT NULL,
	[Answer] [nvarchar](50) NULL,
 CONSTRAINT [PK_TextQAnswer] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ExamID] ASC,
	[TextID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[TFAnswer]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TFAnswer](
	[StudentID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[TFID] [int] NOT NULL,
	[Answer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TFAnswer] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ExamID] ASC,
	[TFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[TFExam]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TFExam](
	[ExamID] [int] NOT NULL,
	[TFID] [int] NOT NULL,
	[Mark] [float] NOT NULL,
 CONSTRAINT [PK_TFExam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[TFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student]
GO
/****** Object:  Table [QEX].[Choice]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [QEX].[Choice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Choices] [nvarchar](max) NOT NULL,
	[IsTrue] [char](1) NOT NULL,
	[McqID] [int] NOT NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student]
) ON [Student] TEXTIMAGE_ON [Student]
GO
ALTER TABLE [dbo].[BTI]  WITH CHECK ADD  CONSTRAINT [FK_BTI_BTI] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BTI] CHECK CONSTRAINT [FK_BTI_BTI]
GO
ALTER TABLE [dbo].[BTI]  WITH CHECK ADD  CONSTRAINT [FK_BTI_Intake] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [dbo].[BTI] CHECK CONSTRAINT [FK_BTI_Intake]
GO
ALTER TABLE [dbo].[BTI]  WITH CHECK ADD  CONSTRAINT [FK_BTI_Track] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[BTI] CHECK CONSTRAINT [FK_BTI_Track]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Branch]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_LoginAccount] FOREIGN KEY([username])
REFERENCES [dbo].[LoginAccount] ([username])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_LoginAccount]
GO
ALTER TABLE [dbo].[Instructorcourse]  WITH CHECK ADD  CONSTRAINT [FK_Instructorcourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Instructorcourse] CHECK CONSTRAINT [FK_Instructorcourse_Course]
GO
ALTER TABLE [dbo].[InstructorManger]  WITH CHECK ADD  CONSTRAINT [FK_InstructorManger_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[InstructorManger] CHECK CONSTRAINT [FK_InstructorManger_Instructor]
GO
ALTER TABLE [dbo].[McqAnswer]  WITH CHECK ADD  CONSTRAINT [FK_McqAnswer_McqExam] FOREIGN KEY([ExamID], [McqID])
REFERENCES [dbo].[McqExam] ([ExamID], [McqID])
GO
ALTER TABLE [dbo].[McqAnswer] CHECK CONSTRAINT [FK_McqAnswer_McqExam]
GO
ALTER TABLE [dbo].[McqAnswer]  WITH CHECK ADD  CONSTRAINT [FK_McqAnswer_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[McqAnswer] CHECK CONSTRAINT [FK_McqAnswer_Student]
GO
ALTER TABLE [dbo].[McqExam]  WITH CHECK ADD  CONSTRAINT [FK_McqExam_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[McqExam] CHECK CONSTRAINT [FK_McqExam_Exam]
GO
ALTER TABLE [dbo].[McqExam]  WITH CHECK ADD  CONSTRAINT [FK_McqExam_MSQ] FOREIGN KEY([McqID])
REFERENCES [dbo].[MSQ] ([ID])
GO
ALTER TABLE [dbo].[McqExam] CHECK CONSTRAINT [FK_McqExam_MSQ]
GO
ALTER TABLE [dbo].[MSQ]  WITH CHECK ADD  CONSTRAINT [FK_MSQ_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[MSQ] CHECK CONSTRAINT [FK_MSQ_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Branch]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Intake]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_LoginAccount] FOREIGN KEY([username])
REFERENCES [dbo].[LoginAccount] ([username])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_LoginAccount]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Track] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Track]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exam]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Student] FOREIGN KEY([StudenID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Student]
GO
ALTER TABLE [dbo].[StudentMcqAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentMcqAnswer_McqAnswer] FOREIGN KEY([StudentID], [ExamID], [McqID])
REFERENCES [dbo].[McqAnswer] ([StudentID], [ExamID], [McqID])
GO
ALTER TABLE [dbo].[StudentMcqAnswer] CHECK CONSTRAINT [FK_StudentMcqAnswer_McqAnswer]
GO
ALTER TABLE [dbo].[TextExam]  WITH CHECK ADD  CONSTRAINT [FK_TextExam_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[TextExam] CHECK CONSTRAINT [FK_TextExam_Exam]
GO
ALTER TABLE [dbo].[TextExam]  WITH CHECK ADD  CONSTRAINT [FK_TextExam_TextQuestions] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextQuestions] ([ID])
GO
ALTER TABLE [dbo].[TextExam] CHECK CONSTRAINT [FK_TextExam_TextQuestions]
GO
ALTER TABLE [dbo].[TextQAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TextQAnswer_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[TextQAnswer] CHECK CONSTRAINT [FK_TextQAnswer_Student]
GO
ALTER TABLE [dbo].[TextQAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TextQAnswer_TextExam] FOREIGN KEY([ExamID], [TextID])
REFERENCES [dbo].[TextExam] ([ExamID], [TextID])
GO
ALTER TABLE [dbo].[TextQAnswer] CHECK CONSTRAINT [FK_TextQAnswer_TextExam]
GO
ALTER TABLE [dbo].[TextQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TextQuestions_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[TextQuestions] CHECK CONSTRAINT [FK_TextQuestions_Course]
GO
ALTER TABLE [dbo].[TFAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TFAnswer_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[TFAnswer] CHECK CONSTRAINT [FK_TFAnswer_Student]
GO
ALTER TABLE [dbo].[TFAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TFAnswer_TFExam] FOREIGN KEY([ExamID], [TFID])
REFERENCES [dbo].[TFExam] ([ExamID], [TFID])
GO
ALTER TABLE [dbo].[TFAnswer] CHECK CONSTRAINT [FK_TFAnswer_TFExam]
GO
ALTER TABLE [dbo].[TFExam]  WITH CHECK ADD  CONSTRAINT [FK_TFExam_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[TFExam] CHECK CONSTRAINT [FK_TFExam_Exam]
GO
ALTER TABLE [dbo].[TFExam]  WITH CHECK ADD  CONSTRAINT [FK_TFExam_TrueFalse] FOREIGN KEY([TFID])
REFERENCES [dbo].[TrueFalse] ([ID])
GO
ALTER TABLE [dbo].[TFExam] CHECK CONSTRAINT [FK_TFExam_TrueFalse]
GO
ALTER TABLE [dbo].[TrueFalse]  WITH CHECK ADD  CONSTRAINT [FK_TrueFalse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[TrueFalse] CHECK CONSTRAINT [FK_TrueFalse_Course]
GO
ALTER TABLE [QEX].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_MSQ] FOREIGN KEY([McqID])
REFERENCES [dbo].[MSQ] ([ID])
GO
ALTER TABLE [QEX].[Choice] CHECK CONSTRAINT [FK_Choice_MSQ]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [CK__Exam__type__3E52440B] CHECK  (([type]='Exam' OR [type]='corrective'))
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [CK__Exam__type__3E52440B]
GO
ALTER TABLE [dbo].[LoginAccount]  WITH CHECK ADD  CONSTRAINT [CK_LoginAccount] CHECK  ((len([username])>(5)))
GO
ALTER TABLE [dbo].[LoginAccount] CHECK CONSTRAINT [CK_LoginAccount]
GO
ALTER TABLE [dbo].[TrueFalse]  WITH CHECK ADD  CONSTRAINT [CK_TrueFalse] CHECK  (([Answer]='T' OR [Answer]='F'))
GO
ALTER TABLE [dbo].[TrueFalse] CHECK CONSTRAINT [CK_TrueFalse]
GO
ALTER TABLE [QEX].[Choice]  WITH CHECK ADD  CONSTRAINT [CK__Choice__IsTrue__4222D4EF] CHECK  (([IsTrue]='T' OR [IsTrue]='F'))
GO
ALTER TABLE [QEX].[Choice] CHECK CONSTRAINT [CK__Choice__IsTrue__4222D4EF]
GO
/****** Object:  StoredProcedure [dbo].[AddBranch]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[AddBranch] @username nvarchar(30),@namebranch nvarchar(50)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  insert into [dbo].[Branch] values (@namebranch)

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Branch'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[AddCourse] @username nvarchar(30),@namecourse nvarchar(50),@disc nvarchar(50),@maxdegree int,@mindegree int
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 	
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	   if not exists(select[ID] from Course where [Name]=@namecourse) 
	   begin
		  insert into  [dbo].[Course] values (@namecourse,@disc,@maxdegree,@mindegree)	  
	  end
	  else
	  begin
	  print 'This exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add Course'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddIntake]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  	CREATE proc [dbo].[AddIntake] @username nvarchar(30),@nameintake nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  insert into [dbo].[Intake] values (@nameintake)

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Intake'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[Addmcq]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Addmcq] @username nvarchar(30),@ID int,@questionid int,@choice nvarchar(Max),@true char(1)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ID and [InstructorID]= @ADD)
	  begin
	  insert into [dbo].[Choice] values (@choice,@true,@questionid)
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Question'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddQuestion]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[AddQuestion] @username nvarchar(30),@ID int,@question nvarchar(Max)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ID and [InstructorID]= @ADD)
	  begin
	  insert into [dbo].[MSQ] values (@question,@ID)
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Question'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddQuestionText]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[AddQuestionText] @username nvarchar(30),@ID int,@question nvarchar(Max),@answer nvarchar(Max)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ID and [InstructorID]= @ADD)
	  begin
	  insert into [dbo].[TextQuestions] values (@question,@ID,@answer)

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Question'
 end
 end
 else 
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddQuestionTF]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddQuestionTF] @username nvarchar(30),@ID int,@question nvarchar(Max),@answer char(1)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ID and [InstructorID]= @ADD)
	  begin
	  insert into [dbo].[TrueFalse] values (@question,@ID,@answer)
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Question'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddStudent] @username nvarchar(30),@namestudent nvarchar(50),@branchname nvarchar(50), @trackname nvarchar(50),@intakename nvarchar(50),@usernamestd nvarchar(30),@passwordStd nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	Declare @ADD1 int 
	Declare @ADD2 int 
	Declare @ADD3 int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	   if( exists (select [ID] from [dbo].[Intake] where [Name]=@intakename) and 
	exists  (select [ID] from [dbo].[Branch] where [Name]=@branchname)and 	
	exists(select  [ID] from [dbo].Track where [Name]=@trackname) )
	   begin
	   set @ADD1=(select [ID] from [dbo].[Intake] where [Name]=@intakename)
	  set @ADD2=(select [ID] from [dbo].[Branch] where [Name]=@branchname)
	  set @ADD3=(select  [ID] from [dbo].Track where [Name]=@trackname)
	   insert into [dbo].[LoginAccount] values(@usernamestd,@passwordStd)
	  insert into  [dbo].[Student] values (@namestudent,@ADD2,@ADD3,@ADD1,@usernamestd)
	  end
	  else
	  begin
	  print 'This do not exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add student'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[AddTrack]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	   	CREATE proc [dbo].[AddTrack] @username nvarchar(30),@nametrack nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  insert into [dbo].[Track] values (@nametrack)

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Add a Track'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[checklogin]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[checklogin] @username nvarchar(30)
   as 
   begin
   
     if exists ( select username from Student where username=@username)
	 begin
	     print 'Student'
	end
 else  if exists ( select username from Instructor where username=@username)
 begin
 print 'Instructor'
  end
  else
  begin
  print 'You Do not Hava Account'
  end
 end
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[DeleteBranch] @username nvarchar(30),@namebranch nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  if exists (select [Name]from [dbo].[Branch] where  [Name]=@namebranch)
	   begin
	  delete from  [dbo].[Branch] where Name=@namebranch
	  end
	  else
	  begin
	  print 'This do not exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Delete a Branch'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[DeleteIntake]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[DeleteIntake] @username nvarchar(30),@nameintake nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	   if exists (select [Name]from [dbo].[Intake] where  [Name]=@nameintake)
	   begin
	  delete from  [dbo].[Intake] where Name=@nameintake
	  end
	  else
	  begin
	  print 'This do not exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Delete a Intake'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteStudent] @username nvarchar(30),@namestudent nvarchar(50)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	Declare @ADD1 nvarchar(30) 
	
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	   if exists(select[ID] from Student where [Name]=@namestudent ) 
	   begin
	  set @ADD1=(select [username] from Student where [Name]=@namestudent)
	   delete from  [dbo].[Student] where [Name]=@namestudent
	   delete from [dbo].[LoginAccount] where [username]=@ADD1
	 
	  end
	  else
	  begin
	  print 'This do not exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Delete student'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTrack]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteTrack] @username nvarchar(30),@nametrack nvarchar(30)
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	   if exists (select [Name]from [dbo].[Track] where  [Name]=@nametrack)
	   begin
	  delete from  [dbo].[Track] where Name=@nametrack
	  end
	  else
	  begin
	  print 'This do not exists'
	  end

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Delete a Track'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[generatequestionmcq]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[generatequestionmcq] @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques ) [QuestionText] from [dbo].[MSQ]	  order by CHECKSUM(NEWID())
	  end	  endend
GO
/****** Object:  StoredProcedure [dbo].[generatequestiontext]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[generatequestiontext] @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques )  [QuestionText] from [dbo].[TextQuestions]	  order by CHECKSUM(NEWID())
	  end	  endend
GO
/****** Object:  StoredProcedure [dbo].[generatequestiontf]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[generatequestiontf] @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques )  [QuestionText] from [dbo].[TextQuestions]	  order by CHECKSUM(NEWID())
	  end	  endend
GO
/****** Object:  StoredProcedure [dbo].[generaterandommoques]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[generaterandommoques] @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques )[QuestionText]  from [dbo].[TrueFalse] 	  order by CHECKSUM(NEWID())
	  end	  endend
GO
/****** Object:  StoredProcedure [dbo].[getstudentcoures]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc  [dbo].[getstudentcoures] @coursename nvarchar(30)
 as
 begin 
 Declare @addc int
 set @addc = (select ID from [dbo].[Course] where Name=@coursename)
 select Name from  [dbo].[Student] s
 join  [dbo].[StudentCourse] sc 
  on  s.ID = sc.StudentID
  where sc.CourseID = @addc
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    	Create proc [dbo].[UpdateBranch] @username nvarchar(30),@namebranch nvarchar(30),@id int
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  update  [dbo].[Branch] set Name=@namebranch where ID = @id

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Update a Branch'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateIntake]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create proc [dbo].[UpdateIntake] @username nvarchar(30),@nameintake nvarchar(30),@id int
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  update  [dbo].[Intake] set Name=@nameintake where ID = @id

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Update a Intake'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTrack]    Script Date: 24/04/2020 11:31:29 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[UpdateTrack] @username nvarchar(30),@nametrack nvarchar(30),@id int
  as 
   begin
   
     if exists ( select username from Instructor where username=@username)
	 begin
	
	Declare @ADD int 
	
	 set @ADD=(select [ID] from Instructor where username=@username)
	  if exists (select [InstructorID]from [dbo].[InstructorManger] where  [InstructorID]=@ADD)
	  begin
	  update  [dbo].[Track] set Name=@nametrack where ID = @id

	
 end 
 else 
 begin
 print 'You Do Not Have a Permission to Update a Track'
 end
 end
 else
 begin
 print 'You Do not hava Acount'
 end
 end
GO
