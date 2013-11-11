clear;

dataDir = './data';
resultsDir = 'ain_results-20131107';

addpath(genpath('./ain'));

filename='MVI_3780.mov';
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



% Canon 650D video  3779

%x0=760;
%y0=580;
%width=50;
%height=65;

%Canon 650D video 3780
x0=520;
y0=400;
width=50;
height=50;


Compute_color(inFile, resultsDir,x0,y0,width,height);