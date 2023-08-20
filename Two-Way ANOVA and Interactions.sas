/**anova: 2 independent variables**/
data twoway;
input group $ gender $ words @@;
datalines;
x m 700 x m 850 x m 820 x m 640 x m 920
y m 480 y m 460 y m 500 y m 570 y m 580
z m 500 z m 550 z m 480 z m 600 z m 610
x f 900 x f 880 x f 899 x f 780 x f 899
y f 590 y f 540 y f 560 y f 570 y f 555
z f 520 z f 660 z f 525 z f 610 z f 645
;
proc anova data = twoway;
title 'anova of reading data';
class group gender;
model words = group | gender; /**group gender group*gender**/
means group | gender / duncan;
run;

/**interpreting the significant interactions**/
data ritalin;
	do group = 'normal','hyper';
		do drug = 'placebo', 'ritalin';
			do subj = 1 to 4;
				input activity @@;
				output;
			end;
		end;
	end;
datalines;
50 45 55 52 67 60 58 65 70 72 68 75 51 57 48 55
;
proc anova data = ritalin;
	title 'activity study';
	class group drug;
	model activity = group|drug;
	means group|drug;
run;

proc means data = ritalin nway noprint;
	class group drug;
	var activity;
	output out = means mean = m;
run;

symbol1 value = square color = black i = join;
symbol2 v = circle c = black i = join;
proc gplot data = means;
	plot m*drug = group;
run;

data ritalin_new;
	set ritalin;
	cond = group || drug;
run;

proc anova data=ritalin_new;
	title 'one-way anova';
	class cond;
	model activity = cond;
	means cond/duncan;
run;

