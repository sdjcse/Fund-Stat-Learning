function [ plotX ] = givenFun( theta,x )
%GIVENFUN Summary of this function goes here
%   Detailed explanation goes here
    %x = [-10:0.5:10];
    plotX = [];
    for thetaIter = 1:size(theta,2)
        for xIter=1:size(x,2)
            if(x(xIter) < 0)
                plotX = [plotX,0];
            else
                plotX = [plotX,theta(thetaIter)*exp(-1 * theta(thetaIter) * x(xIter))];
            end
        end
    end
end

