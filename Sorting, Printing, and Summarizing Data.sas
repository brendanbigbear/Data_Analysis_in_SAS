/**sorting, printing and summarizing**/

/**where statement**/
data style;
input name $ 1-21 genre $ 23-40 origin $ 42;
datalines;
Mary Cassatt          Impressionism      U
Paul Cezanne          Post-impressionism F
Edgar Degas           Impressionism      F
Paul Gauguin          Post-impressionism F
Claude Monet          Impressionism      F
;
proc print data = style;
	where genre = 'Impressionism';
	title 'major impressionist painters';
	footnote 'F = France N = Netherlands U = US';
run;

/* for equation 'col=value', 
'~=' or 'NE' or '^=':not equal to, 
'=' or 'eq'
'>' or 'ge': greater then
'<' or 'le': less than
*/

/*for cond1 & cond 2
'and' or '&'
'or' or '|'
*/



/**sorting**/
data marine;
input name $ family $ length;
datalines;
beluga whale 15
whale shark 40
gray whale 30
mako shark 12
sperm whale 60
whale shark 40
blue wahle 100
;
proc sort data = marine 
out = seasort nodupkey; /*'nodupkey' : no duplicate*/
by family descending length; /**descending in length**/ /*'by family' = by alphabetical order*/
proc print data = seasort;
title 'whales and sharks';
run;

/**Printing**/
data sales;
input name $ 1-11 class @15 datereturned mmddyy10. candytype $
quantity;
profit = quantity * 1.25;
datalines;
Adriana    21 3/21/2000 MP 7
Nathan     14 3/21/2000 CD 19
Matthew    14 3/22/2000 CD 14
Clarie     14 3/24/2000 CD 11
Caitlin    21 3/24/2000 CD 9
;
proc sort data = sales;
by class;
proc print data = sales;
by class;
sum profit;
var name datereturned candytype profit;
title 'candy sales for field trip by class';
footnote;
run;
/*'by' statement can only be used if there is a sort statement*/

