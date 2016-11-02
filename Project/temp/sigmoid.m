function [ output ] = sigmoid( input )

 

    %output = tanh(input);

    output = exp(input) / (1 + exp(input));

 

end
