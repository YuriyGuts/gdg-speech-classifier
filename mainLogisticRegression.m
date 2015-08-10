%% Initialization
clear; close all; clc;
addpath('./logistic-regression');
addpath('./optimizers');
addpath('./rastamat');
addpath('./util');

%% Load Training Data
fprintf('Loading training data...\n');
tic
[XTrain, yTrain] = readData('data/training-data');
toc
fprintf('\n');


%% Train LR Classifier
fprintf('Training the logistic regression classifier...\n')
tic
theta = lrTrainClassifier(XTrain, yTrain);
toc
fprintf('\n');


%% Load Test Data
fprintf('Loading test data...\n');
tic
[XTest, yTest] = readData('data/test-data');
XTest = [ones(size(XTest, 1), 1) XTest];
toc
fprintf('\n');


%% Predict Test Data
fprintf('Predicting test data...\n');
hTest = lrPredict(theta, XTest);
fprintf('Test set accuracy: %f\n', mean(double(hTest == yTest)) * 100);    
