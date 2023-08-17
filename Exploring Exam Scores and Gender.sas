data test;   *'data' statement(giving name);
input gender $ exam1;   *'$' characteristics or num;
datalines;
M 80
F 90
M 86
F 78
;
proc print data = test;   * print, sort, means;
run;

*Every SAS statment ends with a semicolon ;
/* comment */


*proc=procedure
*data & proc is the two step of SAS

* Create a file test then print it
my names is Ian
by the way, todays is hot;
Data test2;
input gender$exam2;
datalines;
M 80
F 90
M 86
F 78
;
*
* above is the data
*;
proc print data = test2; /* Print the test data */
run;
/*******************************************
proc corr data = test;
run;
********************************************/

proc corr data = test2;
run;

