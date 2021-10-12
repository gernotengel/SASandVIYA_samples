
options source source2 mprint mlogic;

libname mytemp SPDE ACCESS=any "C:\SAS\data\temp"; 

%macro testdata(mylibname=, mydsname= ,anzrow=);

/* delete if exist 
%if %sysfunc(exist(&mylibname..&mydsname)) %then %do;
	proc datasets lib=&mylibname;
	 delete &mydsname;
	quit;
	run;
%end;
*/

/* generate testdata */
data &mylibname..&mydsname;
  y=1;
  do i=1 to &anzrow;
    x=i+1;
    y=y+x;
    z=y+4;
    a='abc'||trim(left(put(i,2.)));
    output;
  end;
run;

%mend;

%testdata(mylibname=mytemp, mydsname=testdata1, anzrow=1000000);
%testdata(mylibname=mytemp, mydsname=testdata2, anzrow=2000000);
%testdata(mylibname=mytemp, mydsname=testdata_all, anzrow=1000000);
run;


