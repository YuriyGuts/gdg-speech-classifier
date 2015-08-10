function [theta] = lrTrainClassifier(X, y)

% Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Regularization parameter.
lambda = 0.1;

% Shorthand function for passing to the solver.
costFunction = @(t)(lrCostFunctionRegularized(t, X, y, lambda));

%  Set options for function minimizer.
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Run fminunc to obtain the optimal theta.
% This function will return theta and the cost.
[theta] = fmincg(costFunction, initial_theta, options);

p = lrPredict(theta, X);
fprintf('Training set accuracy: %f\n', mean(double(p == y)) * 100);    

end
