%plot the difference graph
%

clear;

dataDir = './data';
resultsDir = 'ain_results-20131022t';

addpath(genpath('./ain'));

mkdir(resultsDir);

x0=144;
x1=159;
y0=144;
y1=159;



filename='1'; 
inFile = fullfile(dataDir, [filename '.avi']);

fprintf('Processing %s\n', inFile);
vidFile=inFile;

 cropwindow = [x0 x1 y0 y1];
 
    [~,vidName] = fileparts(vidFile);



    % Read video
    vid = VideoReader(vidFile);
    % Extract video info
    vidHeight = vid.Height;
    vidWidth = vid.Width;
    nChannels = 3;
    fr = vid.FrameRate;
    len = vid.NumberOfFrames;
    temp = struct('cdata', zeros(vidHeight, vidWidth, nChannels, 'uint8'), 'colormap', []);

    startIndex = 1;
    endIndex = len-10;

%     vidOut = VideoWriter(outName);
%     vidOut.FrameRate = fr;

    temp.cdata = read(vid, startIndex);
    [rgbframe, ~] = frame2im(temp);
    rgbframe = im2double(rgbframe);
    frame = rgb2ntsc(rgbframe);
    
%     open(vidOut)


    % compute  stack
    disp('Building stack...')

    cropped = imcrop(frame,cropwindow);

    % create pyr stack
    Stack_1 = zeros(endIndex - startIndex +1, size(cropped,1),size(cropped,2),size(cropped,3));
    Stack_1(1,:,:,:) = cropped;

    k = 1;
    for i=startIndex+1:endIndex
            k = k+1;
            temp.cdata = read(vid, i);
            [rgbframe,~] = frame2im(temp);

            rgbframe = im2double(rgbframe);
            frame = rgb2ntsc(rgbframe);

            cropped = imcrop(frame,cropwindow);
            Stack_1(k,:,:,:) = cropped;
    end;
  filename='drawing'; 
inFile = fullfile(dataDir, [filename '.avi']);

fprintf('Processing %s\n', inFile);
vidFile=inFile;

 cropwindow = [x0 x1 y0 y1];
 
    [~,vidName] = fileparts(vidFile);



    % Read video
    vid = VideoReader(vidFile);
    % Extract video info
    vidHeight = vid.Height;
    vidWidth = vid.Width;
    nChannels = 3;
    fr = vid.FrameRate;
    len = vid.NumberOfFrames;
    temp = struct('cdata', zeros(vidHeight, vidWidth, nChannels, 'uint8'), 'colormap', []);

    startIndex = 1;
    endIndex = len-10;

%     vidOut = VideoWriter(outName);
%     vidOut.FrameRate = fr;

    temp.cdata = read(vid, startIndex);
    [rgbframe, ~] = frame2im(temp);
    rgbframe = im2double(rgbframe);
    frame = rgb2ntsc(rgbframe);
    
%     open(vidOut)


    % compute  stack
    disp('Building stack...')

    cropped = imcrop(frame,cropwindow);

    % create pyr stack
    Stack_d = zeros(endIndex - startIndex +1, size(cropped,1),size(cropped,2),size(cropped,3));
    Stack_d(1,:,:,:) = cropped;

    k = 1;
    for i=startIndex+1:endIndex
            k = k+1;
            temp.cdata = read(vid, i);
            [rgbframe,~] = frame2im(temp);

            rgbframe = im2double(rgbframe);
            frame = rgb2ntsc(rgbframe);

            cropped = imcrop(frame,cropwindow);
            Stack_d(k,:,:,:) = cropped;
    end;
   disp('Stack built...')
   
   m=1;
   for i=startIndex+1:endIndex;
       m=m+1;
       Stack_n=Stack_1(m,:,:,:)-Stack_d(m,:,:,:);
   end;
   plot(mean(mean(Stack_n(:,:,:,1),2),3));
   


