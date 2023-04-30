pkg load statistics
pkg load queueing
clc;
clear all;
close all;
lamda=5;
mu = [5.1:0.01:10];
U=[0,500];  #Utilization
R=[0,500];  #Response time
Q=[0,500];  #Average number of requests
X=[0,500];  #Throughput
for i=1:columns(mu)
  [U(i),R(i),Q(i),X(i)] = qsmm1(lamda, mu(i));
endfor
figure(1);
hold on;
plot(mu,U,"linewidth",2.2);
title("Xrhsimopoihsh","fontsize",12);
hold off;
figure(2);
hold on;
plot(mu,R,"linewidth",2.2);
title("Kathisterisi","fontsize",12);
hold off;
figure(3);
hold on;
plot(mu,Q,"linewidth",2.2);
title("Mesos arithmos pelatwn","fontsize",12);
hold off;
figure(4);
hold on;
plot(mu,X,"linewidth",2.2);
title("Rythmoapodosh","fontsize",12);
hold off;
