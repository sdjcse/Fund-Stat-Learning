function [w,b] = Weights( trainImages, trainLabels, w0,b0, maxIteration, learningRate)
 

    [nSamples, nFeature] = size(trainImages);

    w = w0;
    b=b0;
    precost = 0;

    for j = 1:maxIteration

        temp_weight = zeros(nFeature + 1,1);
        temp_b=0;
         for k = 1:nSamples

            temp_weight = temp_weight + ((trainLabels(k)*(sigmoid(-(trainLabels(k)*([1.0 trainImages(k,:)]*w))))*[1.0 trainImages(k,:)]'));
            temp_b=temp_b +trainLabels(k)*(sigmoid(-(trainLabels(k)*([1.0 trainImages(k,:)]*w))));
            
            
        end

        w = w - learningRate * temp_weight;
        b= b - learningRate * temp_b;

        cost = CostFunc(trainImages, trainLabels, w,b);

        if (j~=0)
            if((abs(cost - precost) / cost) <= 0.0001)

            break;
            end
        end

        precost = cost;

    end
    end
