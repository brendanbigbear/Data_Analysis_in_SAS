/**format of output**/
data sales;
input name $ 1-11 class @15 datereturned mmddyy10. candytype $
quantity;
profit = quantity * 1.25;
/**format datereturned date9. profit dollar6.2;**/
datalines;
Adriana    21 3/21/2000 MP 7
Nathan     14 3/21/2000 CD 19
Matthew    14 3/22/2000 CD 14
Clarie     14 3/24/2000 CD 11
Caitlin    21 3/24/2000 CD 9
;
proc print data = sales;
var name datereturned candytype profit;
format datereturned date9. profit dollar6.2;
title 'candy sale data using formates';
run;



/**summarizing by using proc means**/
/**not only the average**/
data sales;
input customerid $ @9 saledate mmddyy10. petunia snapdragon marigold;
month = month(saledate);
datalines;
765-01  05/04/2001 120 80 110
834-01  05/12/2001 90 160 60
901-02  05/18/2001 50 100 75
834-01  06/01/2001 80 60 100
756-01  06/11/2001 100 160 75
;
proc sort data = sales;
by month;
proc means data = sales;
by month;
var petunia snapdragon marigold;
title 'summary of flower sales by month';
run;

/**Summary statistics**/
data sales;
input customerid $ @9 saledate mmddyy10. petunia snapdragon marigold;
month = month(saledate);
datalines;
765-01  05/04/2001 120 80 110
834-01  05/12/2001 90 160 60
901-02  05/18/2001 50 100 75
834-01  06/01/2001 80 60 100
756-01  06/11/2001 100 160 75
;
proc sort data = sales;
by customerid;
proc means noprint data = sales;
by customerid;
var petunia snapdragon marigold;
output out = totals mean(petunia snapdragon marigold)
= meanpetunia meansnapdragon meanmarigold
sum(petunia snapdragon marigold) = petunia snapdragon marigold;

proc print data = totals;
title 'sum of flower data over customer id';
format meanpetunia meansnapdragon meanmarigold 3.;
run;