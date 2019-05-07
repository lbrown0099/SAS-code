
DATA nflds;
	INFILE DATALINES FIRSTOBS=3;
	INPUT FootballString $ 1-25;
	City=SUBSTR(FootballString, 1, ANYDIGIT(FootballString)-1);
	Year=SUBSTR(FootballString, ANYDIGIT(FootballString), 4);
	Team=SUBSTR(FootballString, ANYDIGIT(FootballString)+5, 
		 LENGTH(FootballString) - ANYDIGIT(FootballString)+5);
	Spacec=ANYSPACE(City, -LENGTH(City));
	Spacet=ANYSPACE(Team, -LENGTH(Team));
	Numbert=ANYDIGIT(Team);
	
	ARRAY numericArray (3) Spacec Spacet Numbert;
	ARRAY characterArray (3) $ SpacecC SpacetC NumbertC;
	DO i=1 TO 3;
		IF numericArray (i)=0 THEN
			characterArray (i)='No';
		ELSE
			characterArray (i)='Yes';
	END;
	
	CityTeam=CATX('-', City, Team);


DATALINES;
----+----1----+----2----+----3
Variable: FootballString
Baltimore 2012 Ravens
Cincinnati 2012 Bengals
Cleveland 2012 Browns
Pittsburgh 2012 Steelers
Chicago 2012 Bears
Detroit 2012 Lions
Green Bay 2012 Packers
Minnesota 2012 Vikings
Houston 2012 Texans
Indianapolis 2012 Colts
Jacksonville 2012 Jaguars
Tennessee 2012 Titans
Atlanta 2012 Falcons
Carolina 2012 Panthers
New Orleans 2012 Saints
Tampa Bay 2012 Buccaneers
Buffalo 2012 Bills
Miami 2012 Dolphins
New England 2012 Patriots
New York 2012 Jets
Dallas 2012 Cowboys
New York 2012 Giants
Philadelphia 2012 Eagles
Washington 2012 Redskins
Denver 2012 Broncos
Kansas City 2012 Chiefs
Oakland 2012 Raiders
San Diego 2012 Chargers
Arizona 2012 Cardinals
San Francisco 2012 49ers
Seattle 2012 Seahawks
St. Louis 2012 Rams
;


RUN;

PROC PRINT DATA = nflds;
	TITLE1 'NFL Team Analysis Report ';
	TITLE2 ' Program Exercise 03  ';
	FOOTNOTE 'CSC-152 SAS Online Submitted By Leigha Brown';

	
RUN;