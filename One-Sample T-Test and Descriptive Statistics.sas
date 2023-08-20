/**one sample t test**/
data htwt;
input subject gender $ height weight;
diff = height-68;
/**H0: height = 68**/
/** either or H0: diff = 0**/
datalines;
1 M 68 155
2 F 61 99
3 F 63 115
4 M 70 205
5 M 68 170
6 F 65 125
7 M 72 220
8 F 66 150
;
run;

/**1. proc means**/
proc means data = htwt;
title 'simple descriptive statistics';
run;
proc means data = htwt;
var height;
title 'simple descriptive statistics for height';
run;
proc means data = htwt t prt;
var diff;
title 'one sample t test whether the average height is 68 inches';
title2 'that is, whether diff equals to 0';
run;
proc means data = htwt n mean stderr t prt maxdec=2;
var diff;
title 'one sample t test with more options';
run;

/**2. proc ttest**/
proc ttest data=htwt;
var diff;
run;

/**3. proc univariate**/
proc univariate data=htwt;
var diff;
title 'more descriptive statistics and one sample t test';
run;

proc univariate data=htwt normal plot;
var diff;
title 'normality tests and plots';
run;