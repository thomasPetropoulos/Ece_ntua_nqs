pkg load statistics
pkg load queueing
clc;
clear all;
close all;
lamda=5;
mu=10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];
% define the birth and death rates between the states of the system.
births_B = [lamda, lamda/2, lamda/3, lamda/4];
deaths_D = [mu, mu, mu, mu];
#ii
% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);
% plot the ergodic probabilities (bar for bar chart)
P = ctmc(transition_matrix);
figure(1);
hold on;
bar(states, P, "r", 0.5);
hold off;
#iii
display(sum(P.*[0,1,2,3,4]));
#iv
display (P(5));
#v
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if P0 - P < 0.01
    break;
  endif
endfor

T = 0 : 0.01 : T;
figure(2);
hold on;
plot(T, Prob0, "r", "linewidth", 1.3);
plot(T, Prob1, "g", "linewidth", 1.3);
plot(T, Prob2, "b", "linewidth", 1.3);
plot(T, Prob3, "k", "linewidth", 1.3);
plot(T, Prob4, "m", "linewidth", 1.3);
legend("0","1","2","3","4");
grid on;
hold off;
#vi
mu = [1,5,20];
for i=1:columns(mu)
  deaths_D= [mu(i), mu(i), mu(i), mu(i)];
  transition_matrix = ctmcbd(births_B, deaths_D);
  index=0;
  for T = 0 : 0.01 : 4
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if P0 - P < 0.01
    break;
  endif
endfor
T = 0 : 0.01 : T;
figure(i+2);
hold on;
plot(T, Prob0, "r", "linewidth", 1.3);
plot(T, Prob1, "g", "linewidth", 1.3);
plot(T, Prob2, "b", "linewidth", 1.3);
plot(T, Prob3, "k", "linewidth", 1.3);
plot(T, Prob4, "m", "linewidth", 1.3);
legend("0","1","2","3","4");
grid on;
hold off;
endfor 
clc;
clear all;
close all;
exit;
