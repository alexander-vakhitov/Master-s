clear;

dataDir = './data';
resultsDir = 'ain_results-20131030';

addpath(genpath('./ain'));

filename='MVI_3779.mov';
inFile = fullfile(dataDir, filename);
mkdir(resultsDir);

% x0=370;
% y0=370;
% width=32;
% height=32;

% x0=350;
% y0=350;
% width=50;
% height=50;
% Old videos



% Canon 650D videos
x0=760;
y0=580;
width=50;
height=65;

Compute_color(inFile, resultsDir,x0,y0,width,height);