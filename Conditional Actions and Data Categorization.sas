/**If-then**/

/*'IF' condition 'THEN' action;*/
/*'IF' condition 'THEN DO'; action1; action2; action3; 'END';*/
/*'IF' condition1 'AND' condition2 'THEN' action;*/

/**filling missing values**/
data sportscars;
input model $ year make $ seats color $;
if year < 1975 then status = "classic";
if model = 'Corvette' or model = 'Camaro' then make = "Chevy";
if model = 'Miata' then do;
make = 'Mazda';
seats = 2;
end;
datalines;
Corvette 1955 . 2 black
XJ6 1995 Jaguar 2 teal
Mustang 1966 Ford 4 red
Miata 2002 . . silver
CRX 2001 Honda 2 black
Camaro 2000 . 4 red
;
proc print data = sportscars;
title "Eddy's excellent emporium of used sports cars";
run;

/**Grouping obs**/

/*'IF' condition1 'THEN" action1; x<5
'ELSE IF' condition2 'THEN' action2; 5<=x<=6
'ELSE IF' condition3 'THEN' action3; 6<=x<=10
'ELSE' action4; x>10
*/

data homeimprovements;
input owner $ 1-7 description $ 9-33 cost;
if cost = . then costgroup = 'missing'; /**create a column of costgroup labels**/
else if cost < 2000 then costgroup = 'low';
else if cost < 10000then costgroup = 'medium';
else costgroup = 'high';
datalines;
Bob     kitchen cabinet face-lift 1253.00
Shirley bathroom addition         11350.70
Silvia  paint exterior            .
Al      backyard gazebo           3098.63
;
proc print data = homeimprovements;
title 'home improvement cost groups';
run;