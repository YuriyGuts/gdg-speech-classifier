function [J, grad] = lrCostFunction(theta, X, y)

m = length(y);

hypotheses = sigmoid(X * theta);
cost = (1 / m) * (-y' * log(hypotheses) - (1 - y)' * log(1 - hypotheses));

J = cost;
grad = (1 / m) * X' * (hypotheses - y);

end
