/**Linear Regression and Correlation Analysis**/
data cars;
input x y;
datalines;
0 394.44
4 329.50
8 291.00
12 255.17
16 229.33
20 204.83
24 179.00
18 163.83
32 150.33
;
run;

proc reg data = cars;
model y=x;
run;

/**Company data**/
data company;
input x y;
datalines;
2.4 225
1.6 184
2.0 220
2.6 240
1.4 180
1.6 184
2.0 186
2.2 215
;
run;

proc corr data = company outp = corr;
var x y;
run;
proc reg data=company alpha = .01;
model y = x;
run;