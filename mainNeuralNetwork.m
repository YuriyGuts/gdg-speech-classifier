%% Initialization
clear; close all; clc;
addpath('./rastamat');
addpath('./util');

classificationThreshold = 0.5;


%% Load Training Data
fprintf('Loading training data...\n');
tic
[XTrain, yTrain] = readData('data/training-data');
toc
fprintf('\n');


%% Train Feedforward Neural Network
fprintf('Training neural network...\n');
tic

network = feedforwardnet([10 5], 'trainscg');
network = train(network, XTrain', yTrain');

hNet = sim(network, XTrain');
hTrain = hNet' >= classificationThreshold;
fprintf('Training set accuracy: %f\n', mean(double(hTrain == yTrain)) * 100);    

toc
fprintf('\n');


%% Load Test Data
fprintf('Loading test data...\n');
tic
[XTest, yTest] = readData('data/test-data');
toc
fprintf('\n');


%% Predict Test Data
fprintf('Predicting test data...\n');
hNet = sim(network, XTest');
hTest = hNet' >= classificationThreshold;
fprintf('Test set accuracy: %f\n', mean(double(hTest == yTest)) * 100);    
