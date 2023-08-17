/*Analyzing Warehouse Order Processing Time: Normality Test and Hypothesis Testing */
data orders;
input processing_time;
diff = processing_time-25;
datalines;
28 
25 
27 
31 
10 
26 
30 
15 
55 
12 
24 
32 
28 
42 
38
;
run;
proc univariate data=orders normal;
var diff;
run;
proc ttest data=orders;
var diff;
run;


/*Comparing Blood Pressure in Different Environments: Independent T-Test Analysis*/
data rats;
input temperature $ blood_pressure;
datalines;
26 152
26 157
26 179
26 182
26 176
26 149
5 384
5 369
5 354
5 375
5 366
5 423
;
run;
proc ttest data=rats;
class temperature;
var blood_pressure;
footnote 'Based on the extremely low p-value (<0.0001), we can conclude that there is strong evidence to suggest that rats exposed to a 5°C environment have a significantly higher mean blood pressure compared to rats exposed to a 26°C environment. The difference in mean blood pressure between the two groups is statistically significant.
Therefore, the data provide sufficient evidence to indicate that rats exposed to a 5°C environment have a higher mean blood pressure than rats exposed to a 26°C environment at a significance level of α = 0.05.';
run;


/*Comparing Corn Varieties: Paired T-Test Analysis of Mean Yields*/
data corn_data;
input Farm Variety_A Variety_B;
datalines;
1 48.2 41.5
2 44.6 40.1
3 49.7 44.0
4 40.5 41.2
5 54.6 49.8
6 47.1 41.7
7 51.4 46.8
;
run;

proc ttest data=corn_data;
paired Variety_A*Variety_B;
footnote;
run;

/*Analyzing the Impact of Sales Training Course: Paired T-Test Analysis*/
data sales_data;
input Before After;
datalines;
12 18
18 24
25 24
9 14
14 19
16 20
;
run;

proc ttest data=sales_data alpha=0.01;
paired Before*After;
footnote 'Based on the output from the SAS t-test, the mean difference in weekly sales (Before - After) for the salespersons is -4.1667. Since the mean difference is negative, it indicates a decrease in sales after attending the course.
Therefore, we can conclude that there is evidence to suggest that the mean weekly sales for all salespersons decrease as a result of attending the course.'
run;




