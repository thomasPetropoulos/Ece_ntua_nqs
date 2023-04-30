#Ekthetikh Katanomh erwthma 1
pkg load statistics

clc;
clear all;
close all;
k = 0:0.0001:8;
lamda = [0.5, 1, 3];
for i=1:columns(lamda)
  exp(i,:)= exppdf(k,lamda(i));
endfor
colors = "rbkm";
figure(1);
hold on;
for i=1:columns(lamda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor
hold off;
title("PDF Ekthetikhs Katanomhs");
xlabel("k values");
ylabel("PDF");
legend("lambda=0.5","lambda=1","lambda=3");