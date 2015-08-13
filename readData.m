function [X, y] = readData(folder)

wordFiles = getAllFilesInFolder(strcat(folder, '/'), 'pronunciation*.wav');
featuresPerFile = size(mapWaveformToFeatures(audioread(wordFiles{2})), 1);

% Preallocate memory.
X = zeros(length(wordFiles), featuresPerFile);
y = zeros(length(wordFiles), 1);

dataRowIndex = 1;

% Read each file, extract the features and the correct answer.
for file = wordFiles'
    fileName = file{1};
    wordMatch = regexp(fileName, 'pronunciation_en_([a-z]+)', 'tokens');
    word = wordMatch{1}{1};

    % Read waveform and convert it to a feature vector.
    waveform = audioread(fileName);
    X(dataRowIndex, :) = mapWaveformToFeatures(waveform);
    
    % If the filename contains 'google', the answer for this file is 1.
    y(dataRowIndex) = strcmp(word, 'google');

    dataRowIndex = dataRowIndex + 1;
end

end
