data Galton;
infile '/home/u58575113/Galton.txt' firstobs=2;
input Family $ Father Mother Gender $ Height Kids $;
run;

data revise;
set Galton;
if Gender = 'F' then sex = 1.0;
else sex = 0.0;
run;

proc reg data = revise;
title 'Dependence of child heights on paratental heights';
model height = father mother sex / vif collin;
run;
quit;