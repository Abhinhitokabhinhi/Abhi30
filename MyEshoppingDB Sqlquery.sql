
create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100)Null,
Password nvarchar(100)Null,
Email nvarchar(100)Null,
Name nvarchar(100)Null,
)


select * from tblUsers






create table Forgotpass
(
Id nvarchar (500) not null,
Uid int null,
RequestDateTime DATETIME null,
Constraint [FK_FOrgotPass_tblUsers] FOREIGN KEY ([Uid]) REFERENCES [tblUsers] ([Uid])
)


select * from ForgotPass


create table tblBrands
(
BrandID int identity(1,1) primary key,
Name nvarchar(500)

)




create table tblCategory
(
CatID int identity(1,1) primary key,
CatName nvarchar(Max)

)

create table tblProducts
(
PID int identity(1,1) primary key,
PName nvarchar(Max),
PPrice money,
PSellPrice money,
PBrandID int,
PCategoryID int,
PDescription nvarchar(MAX),
PProductDetails nvarchar(MAX),
FreeDelivery int,
[30DayRet] int,
COD int 




)


create table tblProductImages
(
PIMGID int identity(1,1) primary key,
PID int,
Name nvarchar (MAX),
Extension nvarchar (500),
 
)


select * from tblBrands




select * from tblCategory




Create procedure sp_InsertProduct
(
@PName nvarchar (MAX),
@PPrice money,
@PSellPrice money,
@PBrandID int,
@PCategoryID int,
@PDescription nvarchar(MAX),
@PProductDetails nvarchar(MAX),
@FreeDelivery int,
@30DayRet int,
@COD int
)
As
Insert into tblProducts values(@PName,@PPrice,@PSellPrice,@PBrandID,@PCategoryID,
@PDescription,@PProductDetails,@FreeDelivery,@30DayRet,@COD)
select SCOPE_IDENTITY()
Return 0

select * from tblProductImages
select * from tblProducts

Create procedure tprocBindAllProducts
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSellPrice as DiscAmount,B.Name as ImageName,A.PID as tpid, C.Name as BrandName from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
cross apply(
select top 1 * from tblProductImages B where B.PID = A.PID order by B.PID desc
)B
order by A.PID desc

Return 0

Delete from tblProductImages
Delete from tblProducts


