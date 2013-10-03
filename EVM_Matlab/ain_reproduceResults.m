% Generates all the results for the SIGGRAPH paper at:
% http://people.csail.mit.edu/mrub/vidmag
%
% Copyright (c) 2011-2012 Massachusetts Institute of Technology, 
% Quanta Research Cambridge, Inc.
%
% Authors: Hao-yu Wu, Michael Rubinstein, Eugene Shih
% License: Please refer to the LICENCE file
% Date: June 2012
%

clear;

dataDir = './ain_data';
resultsDir = 'ain_results';

mkdir(resultsDir);


%% MVI_4068
inFile = fullfile(dataDir,'MVI_4068.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);

%% MVI_4068
inFile = fullfile(dataDir,'MVI_4068.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,150,6, 140/60,160/60,30, 1);

%% MVI_4068.avi
inFile = fullfile(dataDir,'MVI_4068.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile, resultsDir, 150, 20, 45, 100, 300, 0);

%% MVI_4068.avi
inFile = fullfile(dataDir,'MVI_4068.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4, ...
                     50/60,60/60,30, 1);

%% MVI_4068.avi
inFile = fullfile(dataDir,'MVI_4068.avi');
fprintf('Processing %s\n', inFile);

% Motion
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,80, ...
                                     0.5,10,30, 0);
% Color
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,6, ...
                                     50/60,60/60,30, 1);




%% MVI_4518
inFile = fullfile(dataDir,'MVI_4518.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);

%% MVI_4518
inFile = fullfile(dataDir,'MVI_4518.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,150,6, 140/60,160/60,30, 1);

%% MVI_4518.avi
inFile = fullfile(dataDir,'MVI_4518.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile, resultsDir, 150, 20, 45, 100, 300, 0);

%% MVI_4518.avi
inFile = fullfile(dataDir,'MVI_4518.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4, ...
                                     50/60,60/60,30, 1);

%% MVI_4518.avi
inFile = fullfile(dataDir,'MVI_4518.avi');
fprintf('Processing %s\n', inFile);

% Motion
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,80, ...
                                     0.5,10,30, 0);
% Color
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,6, ...
                                     50/60,60/60,30, 1);



%% MVI_4519
inFile = fullfile(dataDir,'MVI_4519.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);

%% MVI_4519
inFile = fullfile(dataDir,'MVI_4519.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,150,6, 140/60,160/60,30, 1);

%% MVI_4519.avi
inFile = fullfile(dataDir,'MVI_4519.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile, resultsDir, 150, 20, 45, 100, 300, 0);

%% MVI_4519.avi
inFile = fullfile(dataDir,'MVI_4519.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4, ...
                                     50/60,60/60,30, 1);

%% MVI_4519.avi
inFile = fullfile(dataDir,'MVI_4519.avi');
fprintf('Processing %s\n', inFile);

% Motion
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,80, ...
                                     0.5,10,30, 0);
% Color
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,6, ...
                                     50/60,60/60,30, 1);
