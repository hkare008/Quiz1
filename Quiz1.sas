libname epi5143 "/home/u62007810/EPI5143_Databases/Quizzes/Quiz1";

proc contents data=epi5143.quiz1_data;
run;

proc freq data=epi5143.quiz1_data;
table diabetes;
run;

proc univariate data=epi5143.quiz1_data;
var X1;
var X2;
histogram X1;
run;

data work.quiz1;
set epi5143.quiz1_data;
mean_V1= ((X1+X2+X3)/3);
mean_V2= mean(X1,X2,X3);
wait_time= surgery_dt-consult_dt;
if X2>= 9.958642 then X2_high=1;
else X2_high=0;
run;

/*mean X2 = 9.958642*/

proc univariate data=work.quiz1;
var mean_v1 mean_v2 wait_time;
run;

proc freq data=work.quiz1;
table X2_high*diabetes;
run;