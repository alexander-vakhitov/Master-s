clear;

dataDir = './data';
resultsDir = 'ain_results-20131030';

addpath(genpath('./ain'));

filename='stabilized_4518';
inFile = fullfile(dataDir, [filename '.avi']);
mkdir(resultsDir);

% x0=370;
% y0=370;
% width=32;
% height=32;

x0=350;
y0=350;
width=50;
height=50;


Compute_color(inFile, resultsDir,x0,y0,width,height);