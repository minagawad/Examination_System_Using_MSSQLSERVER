insert into LoginAccount values('marioo','123456'),
('boless' , '654321') ,('minaaa' , '147852') , ('Ahmedd' , '198745') , ('Aymann','159753'), ('Saraaa','1456987')

insert into Branch values('Branch Assuit'),
('Branch Menia') ,('Branch Luxor') , ('Branch Cairo') 

insert into Intake values('Intake 1'),
('Intake 2') ,('Intake 3')

insert into Track values('Track .Net'),
('Track OpenSource') ,('Track Marketing')

insert into Track values('Track .Net'),
('Track OpenSource') ,('Track Marketing')

insert into Student values('Mario Hemaya',1,2,3,'marioo'),
('Boles Gamil',1,1,2,'boless') ,('Mina Gerges',3,2,1,'minaaa')

insert into Instructor values ('Ahmed Hassan' ,  null , 'Ahmedd' , 1)
insert into Instructor values ('Ayman Shwaky' ,  null , 'Aymann' , 2),('Sara Ali' ,  null , 'Saraaa' , 1)

insert into InstructorManger values (1)

update Instructor set MangerID = 1  where ID=2
update Instructor set MangerID = 1  where ID=3

insert into Course values('C#','Object Oriented Programming',100,60),
('HTML5','Hype Text Markup Language',100,60) ,('SQl','Sturcture Query Language',100,60)

insert into Course values('C#','Object Oriented Programming',100,60),
('HTML5','Hype Text Markup Language',100,60) ,('SQl','Sturcture Query Language',100,60)

Select Name From Instructor i
join  [dbo].[InstructorManger] im 
on im.InstructorID=i.[ID]

insert into Exam values('Exam','2020-06-12 10:00:00 AM',2,null),
('corrective','2020-07-15 12:00:00 PM',3,null)

insert into StudentCourse values(1,1),
(2,1),(3,2),(1,3),(3,1),(2,2)

insert into [dbo].[Instructorcourse] values(1,2),
(2,1),(3,3),(1,3),(3,1),(2,2)

insert into [dbo].[StudentExam] values(1,1,null),
(2,1,null),(3,2,null)

insert into [dbo].[MSQ] values ('Choose the symbol which begins a preprocessor directive in C#.NET?' ),
('Select the defined preprocessor in C#.NET?') , ('Which among the following is not a preprocessor directive?')

insert into [dbo].[Choice] values ('#','T',1),('**','F',1),('*','F',1) ,('&','F',1) ,
('#define','T',1),('#elif','T',2),('#else','T',1) ,('#if','F',2),
('#ifdef','F',3),('#pragma','F',3),('#Or','T',3) ,('#undef','F',3)

insert into [dbo].[McqExam] values (1,1 ,35), (1,2 ,35),(1,3,30)

insert into [dbo].[BTI] values (1,2 ,3), (2,1 ,1),(3,3,1),(2,2 ,3), (1,1 ,1),(3,3,3)

insert into [dbo].[TrueFalse] values ('To add a caption to a table, you use the caption attribute in the opening table tag.'),
('By default, relative-width frames are resizable.') , ('Radio buttons are small, round buttons that enable users to select a single option from a list of')

insert into [dbo].[TFExam] values (2,1,30),(2,2,30),(2,3,40)

update [dbo].[MSQ] set CourseID = 1  where ID=1
update [dbo].[MSQ] set CourseID = 1  where ID=2
update [dbo].[MSQ] set CourseID = 1  where ID=3

update [dbo].[TrueFalse] set CourseID = 2  where ID=1
update [dbo].[TrueFalse] set CourseID = 2  where ID=2
update [dbo].[TrueFalse] set CourseID = 2  where ID=3

insert into [dbo].[TextQuestions] values ('Which TCP/IP port does SQL Server run on?',3),
('List the different index configurations possible for a table?',3) , ('What are the different backups available in SQL Server?',3)


update [dbo].[TextQuestions] set Answer='By default SQL Server runs on port 1433.' where ID=1
update [dbo].[TextQuestions] set Answer='A table can have one of the following index configurations:No indexes.' where ID=2
update [dbo].[TextQuestions] set Answer='Different possible backups are:Full backup.' where ID=3

update [dbo].[TextQuestions] set Answer='By default SQL Server runs on port 1433.' where ID=1
update [dbo].[TextQuestions] set Answer='A table can have one of the following index configurations:No indexes.' where ID=2
update [dbo].[TextQuestions] set Answer='Different possible backups are:Full backup.' where ID=3




update [dbo].[TrueFalse] set Answer='F' where ID=1
update [dbo].[TrueFalse] set Answer='T' where ID=2
update [dbo].[TrueFalse] set Answer='T' where ID=3

insert into [dbo].[TextExam] values (2,1,30),(2,2,30),(2,3,40)

alter view GetManager
as

select name from [dbo].[Instructor] i
join [dbo].[InstructorManger] im
on i.[ID]=im.InstructorID

select *from GetManager;

create view GetCourse
as 
select [name] from [dbo].[Course]

select *from GetCourse

create view GetQuestionA
as
select [QuestionText] ,[Answer] from [dbo].[TrueFalse]

select * from GetQuestionA

create view GetQuestionT
as
select [QuestionText] ,[Answer] from [dbo].[TextQuestions]

select * from GetQuestionT

create view GetQuestionC
as
select [QuestionText] ,[Choices] from [dbo].[MSQ] ms
join[dbo].[Choice] c
on ms.ID=c.McqID
where c.IsTrue='T';

select * from GetQuestionC
 /*-----------------------------select Course Student---------------------------*/
 alter proc  getstudentcoures @coursename nvarchar(30)
 as
 begin 
 Declare @addc int
 set @addc = (select ID from [dbo].[Course] where Name=@coursename)
 select Name from  [dbo].[Student] s
 join  [dbo].[StudentCourse] sc 
  on  s.ID = sc.StudentID
  where sc.CourseID = @addc
 end

 exec getstudentcoures @coursename='HTML5';
   
   /*-----------------------------Check user Student or Instructor---------------------------*/
 alter proc checklogin @username nvarchar(30)
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
 exec checklogin  @username='marioo';

 /*----------------Check Instructor can add mcq question and add qusetion to his course-----------------------*/
  Alter proc AddQuestion @username nvarchar(30),@ID int,@question nvarchar(Max)
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

  exec AddQuestion  @username='ahmed', @ID=1 ,@question='Which of the following is correct about dynamic Type in C#?';

   /*----------------Check Instructor can add mcq choices and add choices to question-----------------------*/

  Alter proc Addmcq @username nvarchar(30),@ID int,@questionid int,@choice nvarchar(Max),@true char(1)
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

 exec Addmcq  @username='Ahmedd', @ID=1 ,@questionid=4, @choice='ToString',@true='T';
 exec Addmcq  @username='Ahmedd', @ID=1 ,@questionid=4, @choice='ToSingle',@true='F';
 exec Addmcq  @username='Ahmedd', @ID=1 ,@questionid=4, @choice='ToSbyte',@true='F';
 exec Addmcq  @username='minaaa', @ID=1 ,@questionid=4, @choice='ToInt64',@true='F';

    /*----------------Check Instructor can add True&False questions --------------------*/
	Alter proc AddQuestionTF @username nvarchar(30),@ID int,@question nvarchar(Max),@answer char(1)
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

  exec AddQuestionTF  @username='saraaa', @ID=1 ,@question='XHTML is case insensitive and HTML is case sensitive.', @answer='F';

     /*----------------Check Instructor can add Text questions --------------------*/
	Alter proc AddQuestionText @username nvarchar(30),@ID int,@question nvarchar(Max),@answer nvarchar(Max)
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


  exec AddQuestionText  @username='Saraaa', @ID=3 ,@question='How To Update yes To no And Viceversa In A Query?',
  @answer='Update tablename set ColumnName1 ';

       /*----------------Check Admin Instructor To add A branch --------------------*/
	   	Alter proc AddBranch @username nvarchar(30),@namebranch nvarchar(50)
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

  exec AddBranch  @username='ali' ,@namebranch='Giza';

        /*----------------Check Admin Instructor To add A Intake --------------------*/
	   	alter proc AddIntake @username nvarchar(30),@nameintake nvarchar(30)
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

  exec AddIntake  @username='Ahmedd' ,@nameintake='Intake 4';

    /*----------------Check Admin Instructor To add A Track --------------------*/
	   	alter proc AddTrack @username nvarchar(30),@nametrack nvarchar(30)
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

  exec AddTrack  @username='Ahmedd' ,@nametrack='Laravel';

  
    /*----------------Check Admin Instructor To Update A Track --------------------*/
	   	alter proc UpdateTrack @username nvarchar(30),@nametrack nvarchar(30),@id int
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

  exec UpdateTrack  @username='Ahmedd' ,@nametrack='Laravel Program' ,@id=4;

      /*----------------Check Admin Instructor To Update A Intake --------------------*/

     	Create proc UpdateIntake @username nvarchar(30),@nameintake nvarchar(30),@id int
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

  exec UpdateIntake @username='Ahmedd' ,@nameintake='Intake Four' ,@id=4;

        /*----------------Check Admin Instructor To Update A Branch --------------------*/

     	Create proc UpdateBranch @username nvarchar(30),@namebranch nvarchar(30),@id int
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

  exec UpdateBranch @username='Ahmedd' ,@namebranch='Brach Giza' ,@id=5;

          /*----------------Check Admin Instructor To Delete A Branch --------------------*/

     	alter proc DeleteBranch @username nvarchar(30),@namebranch nvarchar(30)
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

  exec DeleteBranch @username='Ahmedd' ,@namebranch='Brach Giza';

            /*----------------Check Admin Instructor To Delete A Track --------------------*/

     	alter proc DeleteTrack @username nvarchar(30),@nametrack nvarchar(30)
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

   exec DeleteTrack @username='Ahmedd' ,@nametrack='Laravel Program';

             /*----------------Check Admin Instructor To Delete A Intake --------------------*/

     	alter proc DeleteIntake @username nvarchar(30),@nameintake nvarchar(30)
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

   exec DeleteIntake @username='Ahmedd' ,@nameintake='Intake Fours';

    /*----------------Check Admin Instructor To add A student --------------------*/
	   	alter proc AddStudent @username nvarchar(30),@namestudent nvarchar(50),@branchname nvarchar(50), @trackname nvarchar(50),@intakename nvarchar(50),@usernamestd nvarchar(30),@passwordStd nvarchar(30)
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

  exec AddStudent  @username='Ahmedd' ,@namestudent='tony Emad', @branchname ='Branch Assuit', @trackname ='Track .Net',@intakename='Intake 1' ,@usernamestd ='tonyyy',@passwordStd='22';
    exec AddStudent  @username='Ahmedd' ,@namestudent='ahmed Emad', @branchname ='Branch Assuit', @trackname ='Track .Net',@intakename='Intake 1' ,@usernamestd ='ahmwdd',@passwordStd='22';

	/*----------------Delete Student by Manger Instructor--------------*/

  	alter proc DeleteStudent @username nvarchar(30),@namestudent nvarchar(50)
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

  exec DeleteStudent @username='Ahmedd' ,@namestudent='Ahmed Mohamed';


  	/*----------------Add Course by Manger Instructor--------------*/

  	create proc AddCourse @username nvarchar(30),@namecourse nvarchar(50),@disc nvarchar(50),@maxdegree int,@mindegree int
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

  exec AddCourse @username='Ahmedd' ,@namecourse='Photoshop',@disc=null ,@maxdegree=100,@mindegree=60; 

  /*--------Create Index-------------*/
  create Index Studentindex on Student (Name)
    create Index Courseindex on Course (Name)
	  create Index Instructorindex on Instructor (Name)
	  /*------Create Schema -----*/
	  create schema STU;
	   create schema QEX;
	  alter schema STU transfer [dbo].[Student]
alter schema  dbotransfer [QEX].[TextQuestions]alter schema QEX transfer [dbo].[TextQuestions]alter schema dbo transfer [QEX].[MSQ]alter schema QEX transfer [dbo].[Choice]alter schema dbo transfer [STU].[Student]---------------------alter  proc generaterandommoques @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques )[QuestionText]  from [dbo].[TrueFalse] 	  order by CHECKSUM(NEWID())
	  end	  endendexec generaterandommoques @numberofques=2 , @username='Ahmedd',@coursename='C#';create proc generatequestiontext @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques )  [QuestionText] from [dbo].[TextQuestions]	  order by CHECKSUM(NEWID())
	  end	  endendexec generatequestiontext @numberofques=2 , @username='Ahmedd',@coursename='C#';create proc generatequestionmcq @numberofques int, @username nvarchar(30),@coursename nvarchar(30)asbegin   if exists ( select username from Instructor where username=@username)  begin Declare @ADD int 
	Declare @ADDid int
	 set @ADD=(select [ID] from Instructor where username=@username)
	 set @ADDid=(select [ID] from Course where Name=@coursename)
	  if exists (select [CourseID] from [dbo].[Instructorcourse] where [CourseID]=@ADDid and [InstructorID]= @ADD)
	  begin	  select top( @numberofques ) [QuestionText] from [dbo].[MSQ]	  order by CHECKSUM(NEWID())
	  end	  endendexec generatequestionmcq @numberofques=2 , @username='Ahmedd',@coursename='C#';