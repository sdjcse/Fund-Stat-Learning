%% This program will perform decoding of states from observations using the Viterbi Algorithm.
%% Consider a scenario where you are able to check the dryness/wetness of a shirt hanging out but not the weather.
%% You know that the weather is related to this and vice versa. So the level of "wetness" form your observations
%% here which is related to the weather(Which are your states). So given a set of observations,
%% the Initial probability of the weather (I_prob), the transition probability of weather, and the
%% observation probability given the weather, is it possible to deduce the "most probable weather chain"? The Viterbi
%% algorithm allows us to to that. This is a complete script. I got the example problem from
%% www.comps.leeds.co.uk site so that I could test it and it works.

clc,clear all,close all;

states={'Sunny','Cloudy','Rainy'}; %The 3 "hidden" states
Nst=length(states);
obs={'Dry','Dryish','Damp','Soggy'}; % the 4 observations.

%Initial Probabilities of states
I_prob=[0.63 0.17 0.2]';

% Transition Probabilities of states
T_prob=[0.5 .25 .25;.375 .125 .375;.125 .675 .375]; % check 5) in readme (Needs to be transposed)

% Observation prob( Prob of observation given the state)
O_prob=[0.6 0.2 0.15 0.05; 0.25 0.25 0.25 0.25; 0.05 0.10 0.35 0.50 ]';

% Here 1 corresponds to Dry, 2 to Dryish, 3 to Damp and 4 to soggy
oblist=[1 3 4 1 1];% List of observations
 lob=length(oblist);

del=zeros(Nst,lob);% collection of the maximum probability values at each stage
maxlist=del;
mx=zeros(1,lob);
for t=1:lob
    if t==1
        del(:,t)=I_prob.*O_prob(oblist(t),:)'; %Initialization
       [p mx(t)]=max(del(:,t));
        continue;
    end
    %Recursive Phase
    
    for j=1:Nst
        [del(j,t) maxlist(j,t)]=max(del(:,t-1).*T_prob(:,j));
    end
    del(:,t)=del(:,t).*O_prob(oblist(t),:)';
    [p mx(t)]=max(del(:,t)); % Read 4) in readme
end

        % Termination and Backtrack stage
dec_state=zeros(1,lob);
decode_state=cell(1,lob);
[pstar dec_state(lob)]=max(del(:,lob));

for t=lob-1:-1:1
    dec_state(t)=maxlist(dec_state(t+1),t+1);
end

for t=1:lob
decode_state{t}=states{dec_state(t)};    
end

