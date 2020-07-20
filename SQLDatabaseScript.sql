CREATE Database RecruitmentDB

select * from Candidate
CREATE TABLE [dbo].[Candidate]
(
[CandidateID] [int] Identity(1,1) NOT NULL Primary key,
[FirstName] [varchar](100) NULL,
[LastName] [varchar](100) NULL,
[EmailID] [varchar](300) NULL,
[PhoneCode] [varchar](300) NULL,
[Mobileno] [varchar](15) NULL,
[City] [varchar](300) NULL,
[State] [varchar](300) NULL,
[Country] [varchar](300) NULL,
[Pincode] [int] NULL,
[ProfilePic] [varchar](300) NULL,

)

ALTER PROCEDURE Usp_InsertUpdateDelete_Candidate
@CandidateID BIGINT = 0
,@FirstName NVARCHAR(100) = NULL
,@LastName NVARCHAR(100) = NULL
,@EmailID NVARCHAR(300) = NULL
,@PhoneCode NVARCHAR(300) = NULL
,@Mobileno NVARCHAR(15) = NULL
,@City NVARCHAR(300) = 0
,@State NVARCHAR(300) = 0
,@Country NVARCHAR(300) = 0
,@Pincode INT = 0
,@ProfilePic NVARCHAR(300) = 0

,@Query INT
AS
BEGIN
IF (@Query = 1)
BEGIN
INSERT INTO Candidate(
FirstName
,LastName
,EmailID
,PhoneCode
,Mobileno
,City
,State
,Country
,Pincode
,ProfilePic
)
VALUES (
@FirstName
,@LastName
,@EmailID
,@PhoneCode
,@Mobileno
,@City
,@State
,@Country
,@Pincode
,@ProfilePic
)
 
IF (@@ROWCOUNT > 0)
BEGIN
SELECT 'Insert'
END
END
 
IF (@Query = 2)
BEGIN
UPDATE Candidate
SET FirstName = @FirstName
,LastName = @LastName
,EmailID = @EmailID
,PhoneCode = @PhoneCode
,Mobileno = @Mobileno
,City = @City
,State = @State
,Country = @Country
,Pincode = @Pincode
,ProfilePic = @ProfilePic
WHERE Candidate.CandidateID = @CandidateID
 
SELECT 'Update'
END
 
IF (@Query = 3)
BEGIN
DELETE
FROM Candidate
WHERE Candidate.CandidateID = @CandidateID
 
SELECT 'Deleted'
END
 
IF (@Query = 4)
BEGIN
SELECT *
FROM Candidate
END
END
 
IF (@Query = 5)
BEGIN
SELECT *
FROM Candidate
WHERE Candidate.CandidateID = @CandidateID
END