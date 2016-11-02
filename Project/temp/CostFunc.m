function [ J ] = CostFunc( trainImages, trainLabels, theta )

    [row,cols ]= size(theta);
    w = theta(1:row-1,:)
    b = theta(row,1);
    
    [nSamples, nFeature] = size(trainImages);

    temp = 0.0;

    for m = 1:nSamples
     hx = sigmoid(([1.0 trainImages(m,:)]*w)+b);

        if (trainLabels(m) == 1)

            temp = temp + log(hx);

        else

            temp = temp + log(1 - hx);

        end

    end

    J = temp / (-nSamples);

 

end
