/*
varibable = expression;

*/
/**Example 1**/
data homegarden;
input name $ 1-7 tomato zucchini peas grapes;
zone = 14;
type = 'home'; /**for the whole column**/
zucchini = zucchini*10; /**replace the original**/
total = tomato + zucchini + peas + grapes;
pertom = (tomato/total)*100;
datalines;
gregor 10 2 40 0
molly  15 5 10 1000
luther 50 10 15 50
susan  20 0 . 20
;
proc print data = homegarden;
title 'Home Gardening Survey';
run;

/**Example 2**/
/*functioname(arg1, arg2, ...)*/
DATA contest;
INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10. (Scr1 Scr2 Scr3 Scr4 Scr5) (4.1);
AvgScore = MEAN(Scr1, Scr2, Scr3, Scr4, Scr5); 
DayEntered = DAY(Date);
Type = UPCASE(Type);
/**format date MMDDYY10.;**/
Datalines;
Alicia Grossman  13 c 10-28-2003 7.8 6.5 7.2 8.0 7.9 
Matthew Lee       9 D 10-30-2003 6.5 5.9 6.8 6.0 8.1 
Elizabeth Garcia 10 C 10-29-2003 8.9 7.9 8.5 9.0 8.8 
Lori Newcombe     6 D 10-30-2003 6.7 5.6 4.9 5.2 6.1 
Jose Martinez     7 d 10-31-2003 8.9 9.510.0 9.7 9.0
Brian Williams   11 C 10-29-2003 7.8 8.4 8.5 7.9 8.0
;
PROC PRINT DATA = contest;
title 'Pumpkin Carving Contest';
run;
/**1960/1/1 as zero in SAS
the result for date like 16006 is calulated days from 01-01-1960**/




