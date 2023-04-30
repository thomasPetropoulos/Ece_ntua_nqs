#Katametrisi Poisson 1
pkg load statistics

clc;
clear all;
close all;
samples = exprnd(0.2,100,1);
for i=2:100
  samples(i) = samples(i) .+ samples(i-1);
endfor
m= 100 ./ samples(100);
display(m);
x = 1:100;
stairs(samples, x);
