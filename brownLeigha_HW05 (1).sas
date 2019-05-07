*Female College Data;
DATA femaleds;
INFILE DATALINES FIRSTOBS= 3;
INPUT Name $1-15 School $16-20 Gender $21-23 Major $24-30 GPA 31-34 Degree $35-39 Stipend comma10.2 Graduation MMDDYY10.;



DATALINES;
Variables: Name School Gender Major GPA Degree Stipend Graduation
----+----1----+----2----+----3----+----4----+----5----+----6
Lisa Adams      PSU  F MATH   2.50 BS  $1,500.00 08/01/2009
Sharon Boone    PSU  F MATH   3.20 BS  $1,500.00 12/15/2010
Tanya Redding   UNC  F CHEM   1.50 BS  $1,000.00 08/01/2012
Denise Austin   NCSU F BUSADM 2.00 MBA     $0.00 08/01/2008
Julia Mann      LSU  F COMPSC 2.74 PHD     $0.00 12/15/2009
Joyce Johnson   YALE F MATH   3.65 PHD $3,000.00 12/15/2012
Tanya Jacks     LSU  F BUSADM 3.10 MBA   $500.00 08/01/2012
Beverly Hook    YALE F MATH   4.00 BA      $0.00 08/01/2008
Elise Booker    PSU  F COMPSC 2.77 BS      $0.00 12/15/2008
;
RUN;


options nodate nonumber pagesize=20 orientation=landscape;
        TITLE1 'Female College Data';
	TITLE2 'Program Exercise 05';
	FOOTNOTE1 'SAS Programming (Online)';
	FOOTNOTE2 'Verify Input Data';
	FOOTNOTE3 'CSC-152 SAS Online Submitted By Leigha Brown';
	
	
PROC PRINT DATA = femaleds;
FORMAT Stipend DOLLAR10.2 Graduation MMDDYY10.;
RUN;


DATA maleds;
INFILE DATALINES FIRSTOBS= 3;
INPUT Name $1-15 School $16-20 Gender $21-23 Major $24-30 GPA 31-34 Degree $35-39 Stipend comma10.2 Graduation MMDDYY10.;

DATALINES;
Variables: Name School Gender Major GPA Degree Stipend Graduation
----+----1----+----2----+----3----+----4----+----5----+----6
George Harvest  NCSU M CHEM   3.60 BS  $2,200.00 12/15/2009
Gregory Daniels NCSU M COMPSC 2.80 BS      $0.00 12/15/2009
Harold Doggs    YALE M PSYCH  3.60 BA      $0.00 12/15/2010 
Aaron Jones     UNC  M PSYCH  3.95 BA      $0.00 08/01/2008
Carl Franks     PSU  M MATH   2.94 PHD $1,500.00 12/15/2010
Henry Todd      PSU  M PSYCH  3.09 BA    $250.00 12/15/2008
;


RUN;


options nodate nonumber pagesize=20 orientation=landscape;
        TITLE1 'Male College Data';
	TITLE2 'Program Exercise 05';
	FOOTNOTE1 'SAS Programming (Online)';
	FOOTNOTE2 'Verify Input Data';
	FOOTNOTE3 'CSC-152 SAS Online Submitted By Leigha Brown';
	
	
PROC PRINT DATA = maleds;
FORMAT Stipend DOLLAR10.2 Graduation MMDDYY10.;
RUN;


PROC SORT DATA = maleds;
By GPA;
RUN;

PROC SORT DATA = femaleds;
By GPA;
RUN;


DATA AllStudentsds;
set maleds femaleds;


RUN;

PROC PRINT DATA= AllStudentsds;
TITLE1 'All College Student Data';
TITLE2 'Program Exercise 05';
	FOOTNOTE1 'SAS Programming (Online)';
	FOOTNOTE2 'Combine Maleds and Femaleds Data Sets';
	FOOTNOTE3 'CSC-152 SAS Online Submitted By Leigha Brown';
IF Gender = 'M' THEN GenderDesc = 'Male';
	ELSE IF Gender = 'F' GenderDesc = 'Female';
	ELSE GenderDesc = 'Missing';
FORMAT BA = Bachelor of Arts BS = Bachelor of Science MBA = Master of Business Administration PHD = Doctor of Philosophy;

RUN;

PROC MEANS NOPRINT DATA= AllStudentsds;
class Gender;
var stipend;


output out = staticticsds sum(Stipend) = SUMSTIPEND;
RUN;

PROC PRINT DATA = staticticsds;
RUN;


PROC SORT DATA = AllStudentsds;
By Gender;
RUN;

PROC SORT DATA = staticticsds;
By Gender;
RUN;

DATA Stutotsds;
MERGE AllStudentsds staticticsds;
BY Gender;
WHERE Gender = 'M ' OR 'F';
DELETE _TYPE_ and _FREQ_;
output out = Stutotsds Stipend/ SUMSTIPEND = PCTStipend;
RUN;

PROC Print Data=Stutotsds;
Options nodate nonumber;
TITLE1 'Stipend Report for Males and Females';
TITLE2 'Program Exercise 05';
	FOOTNOTE1 'SAS Programming (Online)';
	FOOTNOTE2 'Final Results';
	FOOTNOTE3 'CSC-152 SAS Online Submitted By Leigha Brown';
RUN;



