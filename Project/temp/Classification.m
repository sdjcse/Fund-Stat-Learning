function [ result ] = Classification( testImages, w, b)

 

    nTest = size(testImages,1);

    result = zeros(nTest,1);

    for i = 1:2163

        sigm = sigmoid(([1.0 testImages(i,:)]*w)+b);

        if sigm >= 0.5

            result(i) = 1;

        else

            result(i) = 0;

        end

    end


end
