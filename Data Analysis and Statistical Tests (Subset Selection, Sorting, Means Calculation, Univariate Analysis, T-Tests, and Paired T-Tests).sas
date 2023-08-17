***Data Analysis and Statistical Tests (Subset Selection, Sorting, Means Calculation, Univariate Analysis, T-Tests, and Paired T-Tests)***

/*Exploring Data Attributes and Descriptive Analysis: Subset Selection, Sorting, Summary Statistics, and Dataset Comparison*/
data class;
input Name $ Sex $ Date_of_birth : date9. Height Weight;
format Date_of_birth mmddyy10.;
datalines;
Alfred M 25OCT2001 72.0 122.5
Alice F 06APR2000 63.5 112.0
Carol F 14MAY1998 62.8 99.5
James M 21MAR2000 66.3 99.5
Jane F 02DEC2000 61.8 94.5
Janet F 15JUL1999 68.5 118.5
;
run;

data selected_class;
set class;
if Date_of_birth < '01JAN2001'd;
run;
title 'Class Data';
proc print data=selected_class;
run;

title 'Selected Observations';
proc print data=class;
where Weight < 100;
format Date_of_birth mmddyy10.;
run;


data class;
input Name $ Sex $ Date_of_birth : date9. Height Weight;
format Date_of_birth mmddyy10.;
datalines;
Alfred M 25OCT2001 72.0 122.5
Alice F 06APR2000 63.5 112.0
Carol F 14MAY1998 62.8 99.5
James M 21MAR2000 66.3 99.5
Jane F 02DEC2000 61.8 94.5
Janet F 15JUL1999 68.5 118.5
;
run;
title 'Whole Dataset - Descending Order';
proc sort data=class;
by descending Weight descending Name;
proc print data=class;
var Name Sex Date_of_birth Height Weight;
run;


data class;
input Name $ Sex $ Date_of_birth : date9. Height Weight;
format Date_of_birth mmddyy10.;
datalines;
Alfred M 25OCT2001 72.0 122.5
Alice F 06APR2000 63.5 112.0
Carol F 14MAY1998 62.8 99.5
James M 21MAR2000 66.3 99.5
Jane F 02DEC2000 61.8 94.5
Janet F 15JUL1999 68.5 118.5
;
run;
proc means data=class noprint;
class Sex;
var Height Weight;
output out=newclass(drop=_type_ _freq_) mean=;
run;
title 'Mean Height and Mean Weight';
proc print data=newclass;
run;

/*Statistical Analysis of Gasoline Octane Ratings: Descriptive Statistics and T-Test*/
data gasoline;
input octane_rating;
diff = octane_rating-87;
datalines;
87.5 
86.9 
86.6 
87.3 
87.9 
88.0 
86.7 
87.5 
87.2 
87.0 
88.1 
87.5 
86.5 
87.7 
88.0 
87.1 
87.0 
87.6 
87.5 
88.3
;
run;

proc univariate data=gasoline normal alpha=0.5;
var diff;
run;

proc ttest data=gasoline alpha=0.1 ;
var diff;
run;

/*Comparing Virus Effects on Tobacco Leaves: Paired T-Test Analysis*/
data tobacco;
input leaf virus1 virus2;
datalines;
1 31 18
2 20 17
3 18 14
4 17 11
5 9 10
6 8 7
7 10 5
8 7 6
9 11 9
;
run;

proc ttest data=tobacco;
paired virus1* virus2;
run;



/*Comparative Analysis of Reading Speeds: Independent T-Test by Program*/
data reading;
input program $ reading_speed;
datalines;
Cody 500
Cody 450
Cody 505
Cody 404
Cody 555
Cody 567
Cody 588
Cody 577
Cody 566
Cody 644
Smith 355
Smith 388
Smith 440
Smith 600
Smith 510
Smith 501
Smith 502
Smith 489
Smith 499
Smith 489
;
run;

proc ttest data=reading alpha = 0.01;
class program;
var reading_speed;
run;

