function [X, y] = readData(folder)

wordFiles = getAllFilesInFolder(strcat(folder, '/'), '*.wav');
samplesPerFile = size(mapWaveformToFeatures(audioread(wordFiles{2})), 1);

% Preallocate memory.
X = zeros(length(wordFiles), samplesPerFile);
y = zeros(length(wordFiles), 1);

dataRowIndex = 1;

% Read each file, extract the waveform and the class name.
for file = wordFiles'
    fileName = file{1};
    wordMatch = regexp(fileName, 'pronunciation_en_([a-z]+)', 'tokens');
    word = wordMatch{1}{1};

    waveform = audioread(fileName);
    X(dataRowIndex, :) = mapWaveformToFeatures(waveform);
    y(dataRowIndex) = strcmp(word, 'google');

    dataRowIndex = dataRowIndex + 1;
end

end
