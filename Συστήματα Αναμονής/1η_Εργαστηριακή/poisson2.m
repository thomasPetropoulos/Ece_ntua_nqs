#Katametrisi Poisson 2
pkg load statistics

clc;
clear all;
close all;

samples_i = exprnd(0.2,200,1);
for i=2:200
  samples_i(i) = samples_i(i) .+ samples_i(i-1);
endfor
mesos_i = 200 ./ samples_i(200);
display(mesos_i);

samples_ii = exprnd(0.2,300,1);
for i=2:300
  samples_ii(i) = samples_ii(i) .+ samples_ii(i-1);
endfor
mesos_ii = 300 ./ samples_ii(300);
display(mesos_ii);

samples_iii = exprnd(0.2,500,1);
for i=2:500
  samples_iii(i) = samples_iii(i) .+ samples_iii(i-1);
endfor
mesos_iii = 500 ./ samples_iii(500);
display(mesos_iii);

samples_iv = exprnd(0.2,1000,1);
for i=2:1000
  samples_iv(i) = samples_iv(i) .+ samples_iv(i-1);
endfor
mesos_iv = 1000 ./ samples_iv(1000);
display(mesos_iv);

samples_v = exprnd(0.2,10000,1);
for i=2:10000
  samples_v(i) = samples_v(i) .+ samples_v(i-1);
endfor
mesos_v = 10000 ./ samples_v(10000);
display(mesos_v);
