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

dataDir = './data';
resultsDir = 'ain_results-20131022';

addpath(genpath('./ain'));

mkdir(resultsDir);

filename = {'stabilized_4068', 'stabilized_4518', 'stabilized_4519', '1', 'drawing'};

%% vanilla
for i=size(filename,1):size(filename,2) 
inFile = fullfile(dataDir, [filename{i} '.avi']);

fprintf('Processing %s\n', inFile);
ain_pick_a_square(inFile, resultsDir, 144, 159, 144, 159);
end;
