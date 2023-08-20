/**subseting**/
/**choose only comedies**/

/*'IF' statement -- subset*/
/*'IF' condition 'THEN' 'DELETE'*/
data comedy;
input title $ 1-26 year type $;
if type = 'comedy';
datalines;
A midsummer night's dream 1595 comedy
Hamlet                    1600 tragedy
Tempest                   1611 romance
;
proc print data=comedy;
title 'shakespearean comedy';
run;
/**delete others**/
data comedy2;
input title $ 1-26 year type $;
if type = 'tragedy' or type = 'romance' then delete;
datalines;
A midsummer night's dream 1595 comedy
Hamlet                    1600 tragedy
Tempest                   1611 romance
;
proc print data=comedy2;
title 'shakespearean comedy';
run;


/*'IF' = 'if' = 'If' and also can mix upper and lower case*/

/**SAS dates**/
/**a numeric value of days since Jan 1st, 1960**/
data librarycards;
input name $11. +1 birthdate date9. +1 issuedate mmddyy10.;
expiredate = issuedate + (365.25*3);
expirequarter = qtr(expiredate);
if issuedate > '01jan2003'd then newcard = 'yes'; /*d represent for date*/
datalines;
A.Jones     01jan1960 09-15-2003
M.Rincon    05oct1949 02-29-2000
Z.Grandage  18mar1988 10-10-2002
K.Kaminaka  29may2001 01-24-2003
;
proc print data = librarycards;
format issuedate mmddyy8. expiredate weekdate17.;
title 'sas date without and with formats';
run;
/**data in wrong format cannot be read**/
