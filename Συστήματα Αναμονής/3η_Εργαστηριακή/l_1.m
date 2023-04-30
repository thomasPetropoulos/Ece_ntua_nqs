clc;
clear all;
close all;
rand('seed',12163);
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
arrivals= [0,0,0,0,0,0,0,0,0,0,0];
lambda = 1; 
mu = 5;
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities
%k=0;
%tracetable=[];
transitions = 0; % holds the transitions of the simulation in transitions steps
while transitions >= 0 %&& transitions < 30
  transitions = transitions + 1; % one more transitions step
 % k = k +1;
  %if 0 < k < 31 && current_state > 0
   % tracetable(k,1) = k;
    %tracetable(k,2) = current_state;
    %tracetable(k,3) = arrivals(current_state);
  %endif
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for j=1:1:length(arrivals)
        P(j) = arrivals(j)/total_arrivals; % calculate the probability of every state in the system
    endfor
    mean_clients = 0; % calculate the mean number of clients in the system
    for j=1:1:length(arrivals)
       mean_clients = mean_clients + (j-1).*P(j);
    endfor
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif
    previous_mean_clients = mean_clients;
    
  endif
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    %if 0 < k < 31
     % tracetable(k,4) = 1;
    %endif
    total_arrivals = total_arrivals + 1;
    x= arrivals(current_state + 1) +1;
    arrivals(current_state + 1) =x;
    if (current_state != 10)
      current_state = current_state + 1;
    endif
  else
    %if 0 < k < 31
     % tracetable(k,5) = 1;
    %endif
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
  endif
endwhile
%display(tracetable);

figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence");
xlabel("transitions in thousands");
ylabel("Average number of clients");

figure(2);
bar(0:1:(length(arrivals)-1),P,'r',0.4);
title("Probabilities");
clc;
clear all;
close all;
exit;