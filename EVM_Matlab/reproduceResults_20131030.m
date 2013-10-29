clear;

dataDir = './data';
resultsDir = 'ain_results-20131030';

addpath(genpath('./ain'));

filename='stabilized_4518';
inFile = fullfile(dataDir, [filename '.avi']);
mkdir(resultsDir);

x0=144;
x1=159;
y0=144;
y1=159;

Compute_color(inFile, resultsDir,x0,x1,y0,y1);