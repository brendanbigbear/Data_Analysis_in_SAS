/**7. read limited files**/
data highlow;
infile "/home/u63433433/highlow.dat"
dlm=","
firstobs=2
;
input city $ state $ normalhigh normallow recordhigh recordlow;

run;

proc print data = highlow;
title "read highlow";
run;

/**8. proc import**/
PROC IMPORT DATAFILE="/home/u63433433/wine.csv"
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;
PROC PRINT data = IMPORT;
RUN;

