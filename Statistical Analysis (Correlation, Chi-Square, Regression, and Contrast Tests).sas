/*Correlation, Transformation, and Regression Analysis: Investigating Relationships*/
data XYZ;
   input X Y Z;
   datalines;
30 75 25
29 69 27
31 75 17
47 98 20
40 88 10
27 68 38
46 95 36
50 96 29
;
run;

proc corr data=XYZ pearson nosimple;
   var X Y Z;
   ods select PearsonCorr;
run;

data XYZ_logs;
   set XYZ;
   LX = log(X);
run;

proc corr data=XYZ_logs pearson nosimple;
   var Y;
   with LX;
   ods select PearsonCorr;
run;

proc reg data=XYZ_logs;
   model Y = LX;
   output out=reg_results p=PREDICTED r=RESIDUALS;
run;

proc reg data=XYZ_logs;
   model Y = LX / clb clm;
   ods select ParameterEstimates;
   ods output ParameterEstimates=estimates;
run;

proc print data=estimates noobs;
   var Variable Estimate tValue;
   where Variable = "LX" or Variable = "Intercept";
run;

proc sgplot data=reg_results;
   scatter x=LX y=Y / markerattrs=(symbol=circlefilled);







/*Chi-Square Test for Asthma Data: Analyzing Associations*/
data asthma;
   input Asthma $ SES $ Count;
   datalines;
Low Yes 40 
Low No 90
High Yes 30
High No 120
;
run;

/* Conduct a chi-square test */
proc freq data=asthma;
   weight Count;
   tables Asthma*SES / chisq;
run;






/* Model Selection and Ranking: Predictive Modeling with Multiple Variables */
data Q3;
   input X1 X2 X3 X4 Y;
   datalines;
34 32 44 43 283
2 20 11 9 54
1 36 17 46 77
33 45 18 34 175
22 19 16 30 135
10 50 9 49 72
16 26 2 15 61
36 41 30 23 232
42 2 48 44 322
44 44 15 11 196
;
run;

proc reg data=Q3;
   model Y = X1 X2 X3 X4 / noint;
run;

proc reg data=Q3;
   model Y = X1 X2 X3 X4;
run;

proc reg data=Q3;
   model Y = X1 X2 X3 X4 / selection=rsquare;
   output out=subset_results p=rsq;
run;


proc rank data=subset_results out=ranked_results descending;
   var rsq;
   ranks rank_rsq;
run;

data best_model;
   set ranked_results;
   where rank_rsq = 2;
   keep X1 X2 X3 X4;
run;





/*Exam Score Analysis and Statistical Tests: Evaluating Methods and Contrasts*/
data exam_scores;
   input Method $ Score;
   datalines;
A 570
A 530
A 540
A 535
A 585
A 537
A 590
B 555
B 512
B 510
B 520
B 510
B 512
B 570
C 512
C 518
C 555
C 502
C 510
C 520
C 516
D 505
D 508
D 512
D 520
D 543
D 523
D 517

;
run;

proc glm data=exam_scores;
   class Method;
   model Score = Method;
   means Method / hovtest=levene;
run;

proc glm data=exam_scores;
   class Method;
   model Score = Method / solution;
   means Method / duncan alpha=0.10;
run;

proc glm data=exam_scores;
   class Method;
   model Score = Method;
   contrast 'A vs. B and C' Method -1 0.5 0.5 -1 / est;
run;


