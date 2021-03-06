obs = importdata('Observations.txt');
obsArr = [];

% converting the read values to 1 and 2 representing Heads and Tails
for i=1:size(obs,1)
    str = obs(i);
    str = char(str);
    numArr = uint8(str);
    numArr(2:2:end,:)=[];
    numArr(:,2:2:end)=[];
    obsArr = [obsArr;numArr];
end
for i=1:size(obsArr,1)
    for j=1:size(obsArr,2)
        if(obsArr(i,j)==72)
            obsArr(i,j) = 1;
        end
        if(obsArr(i,j)==84)
            obsArr(i,j) = 2;
        end
    end
end

states = importdata('States.txt');
statesArr = [];

% reading states from file 
for i=1:size(states,1)
    str = states(i,:);
    numArr = uint8(str);
    statesArr = [statesArr;numArr];
end

% estimating transision and emission parameters
[trans,emis] = hmmestimate(obsArr,statesArr);

transNew = [0.5 0.5;0.5 0.5];
sumH = 0;
sumT = 0;
for i=1:size(obsArr,1)
    for j=1:size(obsArr,2)
        if (obsArr(i,j)==1)
            sumH = sumH+1;
        end
        if(obsArr(i,j)==2)
            sumT = sumT+1;
        end
    end
end
emisNew = [sumH/600 sumT/600;sumH/600 sumT/600];

[sequenceNew,statesNew] = hmmgenerate(20,trans,emis);

%[updatedTrans,updatedEmis] = hmmtrain(obsArr,trans,emis);
states = [];
states = hmmviterbi(obsArr(:,:),trans,emis);