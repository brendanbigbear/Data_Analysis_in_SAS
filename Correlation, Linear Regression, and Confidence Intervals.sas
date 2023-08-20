/**Correlation, Linear Regression, and Confidence Intervals**/

data corr_eg;
input gender $ height weight age;
datalines;
m 68 155 23
f 61 99 20
f 63 115 20
m 70 205 45
m 69 170 .
f 65 125 30
m 72 220 48
;
proc corr data=corr_eg;
title 'example of a correlation matrix';
var height weight age;
run;

/** partial correlations **/
proc corr data = corr_eg nosimple;
title 'example of a partial correlation';
var height weight;
partial age;
run;

/**linear regression**/
proc reg data=corr_eg;
title 'regression line for weight~height';
model weight = height;
plot weight*height; 
plot predicted.*height weight*height/overlay;
run;

/**CI's**/
goptions
csymbol=black;
symbol1 value = dot;
symbol2 value = none i=rlclm95;
symbol3 value = none i=rlcli95 line=3;
proc gplot data = corr_eg;
title 'regression lines and 95 CI';
plot weight*height = 1
weight*height = 2
weight*height = 3/overlay;
run;

data corr_eg;
set corr_eg;
height2 = height**2
;
run;
proc reg data=corr_eg;
model weight = height height2;
plot r.*height;
run;

/**transformation before regression**/
data heart;
input drug_dose heart_rate;
datalines;
2 60
2 58
4 63
4 62
8 67
8 65
16 70
16 70
32 74
32 73
;
proc gplot data = heart;
plot heart_rate*drug_dose;
run;
proc reg data=heart;
model heart_rate = drug_dose;
run;

data heart_log;
set heart;
l_drug_dose = log(drug_dose);
run;
proc gplot data = heart_log;
plot heart_rate*l_drug_dose;
run;
proc reg data=heart_log;
model heart_rate = l_drug_dose;
plot r.*heart_rate;
run;