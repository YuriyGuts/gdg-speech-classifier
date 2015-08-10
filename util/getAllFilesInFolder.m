function fileList = getAllFilesInFolder(dirName, pattern)

% Get the data for the current directory
dirData = dir(fullfile(dirName, pattern));

% Find the index for directories
dirIndex = [dirData.isdir];

% Get a list of the files
fileList = {dirData(~dirIndex).name}';
if ~isempty(fileList)
    % Prepend path to files
    fileList = cellfun(@(x) fullfile(dirName, x), fileList, 'UniformOutput', false);
end

% Get a list of the subdirectories
subDirs = {dirData(dirIndex).name};

% Find index of subdirectories that are not '.' or '..'
validIndex = ~ismember(subDirs,{'.','..'});  

% Loop over valid subdirectories   
for iDir = find(validIndex)
    % Get the subdirectory path
    nextDir = fullfile(dirName,subDirs{iDir});  
    % Recursively call getAllFiles
    fileList = [fileList; getAllFilesInFolder(nextDir)];
end

end
