/** 3.informat method  -> telling SAS how to read the given data**/

/*
1. char: $informatw. ex) $16. 16 -> column
2. num: informatw.d ex) 3. -> column range
ex) 4.1-> 4 is range of column and .1 is the decimal
3. informatw. ex) MMDDYY10. -> 2 column for month, 2 col for D ... 10.->column range is 10
+1: skip a column

*/

data contest;
input name $16. Age 3. +1 Type $1. +1 Date MMDDYY10. (Score1 Score2 Score3 Score4)(4.1);
format date MMDDYY10.;  /**how it shows**/
datalines;
Licia Grossman  13  c 10-28-2003   7.8   6.5   7.2   8.0
Matthew Lee     9   D 10-30-2003   6.5   5.9   6.8   6.0
;
proc print data = contest;
title 'Pumpkin carving contest';
run;

/** 4. Mixing input**/
/*list input, column input, and informate method*/

data nationalparks;
input parkname $ 1-22 /*column input*/ state $ /*list input*/ year @40 /*@:move to col 40*/ acreage COMMA9.;
datalines;
yellowstone           ID/MT/WY 1872    4,065,493
everglaves            FL 1934          1,398,800
;

proc print data = nationalparks;
title 'selected national parks';
run;

/** 5. multiple lines per obs**/
data highlow;
input city $ state $ / normalhigh normallow / recordhigh recordlow;
/**input city $ state $ #2 normalhigh normallow #3 recordhigh recordlow; **/
datalines;
nome ak
55 44
88 29
miami fl
90 75
97 65
;
proc print data = highlow;
run;

/**proc export data = highlow
outfile= "/home/u58575113/highlow.dat"
dbms=csv
replace;
run; **/
proc export data = highlow
outfile= "/home/u63433433/highlow.dat"
dbms=csv
replace;
run;

/** 6. multiple obs per line**/
data rainfall;
input city $ state $ normalrain meandaysrain @@; /*@@:stop reading the obervation and go to the next one*/
datalines;
nome ak 2.5 15 miami fl 6.75
18
;
proc print data = rainfall;
run;
