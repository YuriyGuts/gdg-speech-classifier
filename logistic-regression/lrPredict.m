function [p, hypotheses] = lrPredict(theta, X)

hypotheses = sigmoid(X * theta);
p = hypotheses >= 0.5;

end
