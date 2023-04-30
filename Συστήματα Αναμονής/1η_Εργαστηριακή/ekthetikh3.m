#Ekthetikh Katanomh erwthma 3
pkg load statistics

clc;
clear all;
close all;
k = 0:0.0001:8;
exp = expcdf(k,2.5);

#Gia to P[x>3000] :
res1 = 1 .- exp(3000);

#Gia to P[x>5000|x>2000] :
res2 = (1 .- exp(5000))./(1 .- exp(2000));
display(res1);
display(res2);