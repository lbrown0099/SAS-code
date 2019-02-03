DATA furniture;
	INPUT Item $ Quantity $ Purchased $ Cost $;
	PurchaseAmount = Quantity * Cost;
	DATALINES;
Sofa 1 YES 1300.00
Chair 2 YES 250.00
Table 3 YES 750.00
Cabinet 2 YES 450.00
Chaise 0 NO 325.00
Loveseat 1 YES 800.00
Bookcase 2 YES 200.00
Recliner 0 NO 1000.00
Ottoman 0 NO 375.00
Armoire 1 YES 4000.00
;

RUN;

PROC PRINT DATA = furniture;
	SUM PurchaseAmount;
	VAR Item Quantity Purchased Cost PurchaseAmount;
	TITLE 'Furniture Purchase Order Homework 01';
	FOOTNOTE 'CSC-152 SAS Online Submitted By Leigha Brown';
RUN;
	

