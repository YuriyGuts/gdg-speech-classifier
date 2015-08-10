function [J, grad] = lrCostFunctionRegularized(theta, X, y, lambda)

% Number of training examples
m = length(y);

hypotheses = sigmoid(X * theta);

costRaw = (1 / m) * (-y' * log(hypotheses) - (1 - y)' * log(1 - hypotheses));
costRegularizationTerm = (lambda / (2 * m)) * sum(theta(2:end) .^ 2);
costRegularized = costRaw + costRegularizationTerm;

gradientRaw = (1 / m) * X' * (hypotheses - y);
gradientRegularizationTerm = [0; theta(2:end) * lambda / m];
gradientRegularized = gradientRaw + gradientRegularizationTerm;

J = costRegularized;
grad = gradientRegularized;

end
