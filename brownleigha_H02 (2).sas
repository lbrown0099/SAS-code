
DATA info;
	INPUT OScardate $ 1-8 Oscaryear $ 9-13 Budget $ 15-26 Gross $ 27-39 Title $ 40-62 Asofdate $ 63-73 
	Rating $ 75-78 Profit $ 80-90  PBPercent $ 91-101  Message1 $ 102 - 122  Message2 $ 123-143 ;	 
	Profit = Gross - Budget;
	PBPercent = Profit / Budget;
	PBPercent = PBPercent * 100;
	IF PBPercent < 100 THEN do; Message1 = 'Less Than 100%';  Message2 = 'Impressive' ; end;
		ELSE IF  99 < PBPercent < 1000 THEN do Message1 = 'Between 100% and 1000%'; Message2 = 'More Impressive'; end;
		ELSE do Message1 = 'More Than 100%'; Message2 = 'More Impressive'; end;
	PBPercent = PBPercent / 100;
	DATALINES;
27Feb11 2011  $15,000,000 $373,700,000 The Kings Speech       02/26/2012  8.2            
07Mar10 2010  $11,000,000  $12,647,089 The Hurt Locker        02/26/2012  7.2
22Feb09 2009  $15,000,000 $141,319,195 Slumdog Millionaire    02/26/2012  8.2
24Feb08 2008  $25,000,000  $74,273,505 No Country for Old Men 02/26/2012  8.2
25Feb07 2007  $90,000,000 $289,800,000 The Departed           02/26/2012  8.5
05Mar06 2006   $6,500,000  $98,410,061 Crash                  02/26/2012  8.0
;

RUN;

PROC PRINT DATA = info;
	TITLE 'Oscar Winners  Program Exercise 02 ';
	FOOTNOTE 'CSC-152 SAS Online Submitted By Leigha Brown';
	
	
RUN;