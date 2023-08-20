/**t test and nonparametric comparison**/

/**two sample t test**/
data response;
input group $ time;
datalines;
c 80
c 93
c 83
c 98
c 89
t 100
t 103
t 104
t 99
t 102
;
proc ttest data = response;
title 't-test1';
class group;
var time;
run;

proc univariate data = response normal;
title 't-test2';
class group;
var time;
run;

/**wilcoxon rank sum test**/
data tumor;
input group $ mass @@;
datalines;
a 3.1 a 2.2 a 1.7 a 2.7 a 2.5
b 0.0 b 0.0 b 1.0 b 2.3
;
proc npar1way data=tumor wilcoxon;
title 'nonparametric test';
class group;
var mass;
exact wilcoxon;
run;
