# gdg-speech-classifier

A machine learning system that recognizes the word 'Google' in human speech.

## How it works

We train a classifier on a set of WAV files using Mel-Frequency Cepstral Coefficients (MFCC) as features. There are two implementations of the classifier available:

1. Regularized logistic regression, trained with conjugate gradient optimizer (`fmincg`).
2. Feed-forward neural network, trained with MATLAB's scaled conjugate gradient optimizer (`trainscg`).

## How to use

1. Import training and test data into the `data` folder. You can get some data from the [Releases Page](https://github.com/YuriyGuts/gdg-speech-classifier/releases). The names of the files should follow the `pronunciation_en_%label%.wav` pattern.
2. Run either `mainLogisticRegression.m` or `mainNeuralNetwork.m` depending on which classifier you would like to try.
