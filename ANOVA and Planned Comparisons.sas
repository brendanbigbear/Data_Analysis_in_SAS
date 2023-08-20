/*ANOVA and Planned Comparisons*/
/**ANOVA**/
data reading;
input group $ words @@;
datalines; 
x 700 x 850 x 820 x 640 x 920
y 480 y 460 y 500 y 570 y 580
z 500 z 550 z 480 z 600 z 610
;
proc anova data = reading;
title 'anova of reading data';
class group;
model words = group;
means group; /**duncan**/
run;

/**contrasts**/
proc glm data = reading;
title 'planned comparisons';
class group;
model words = group;
contrast 'x vs. y and z' group -2 1 1;
contrast 'y vs. z' group 0 1 -1;
run;