%Compute the color function based on a region of the face
%This is a trivial algorith, which should be developed further
%(x,y) is taken to a point or an average of a region
%Color(x,y,t)=Constant_color(x,y)+alpha*(f(t+Delay))+ Noise(x,y,t)
%Color(x,y,t) is the color of point (x,y) at time t
%In Matlab it is Color(frame_number, point_location, channel)
%Constant_color(x,y) is the average color value, it's assumed that 
%In Matlab it is Constant_color(point_location, channel)
%avg(color(x,y,:))=Constant_color(x,y)
%alpha is the degree to which the heartbeat influences the color
%it's assumed that (max(Color(x,y,:))-min(Color(x,y,:)))/2=alpha
%f(t) is the function that describes the heartrate, we're ultimately trying
%to find it out
%delay is the amout of time (in units of t) which offsets f(x,y) from some
%base level f(t), which is somputed for a reference point.
%Noise (x,y,t) is the term which accounts for the actual noise and random
%disturbances in the Force, optical abberations and model's imperfections
%(which are obviously none of).


function [Constant_color, f, alpha] = Compute_color(vidFile, outDir, x0, y0, width, height)

%Get the video file name
[~,vidName] = fileparts(vidFile);


% Read video
vid = VideoReader(vidFile);
% Extract video info
vidHeight = vid.Height;
vidWidth = vid.Width;
nChannels = 3;
fr = vid.FrameRate;
len = vid.NumberOfFrames;

%This would hold the video
temp = struct('cdata', zeros(vidHeight, vidWidth, nChannels, 'uint8'), 'colormap', []);

%Getting the range that we're working on
startIndex = 1;
endIndex = len-10;

%The part of the video that we're going to analyze
cropwindow = [x0 y0 width height];

%Define frames
temp.cdata = read(vid, startIndex);
[rgbframe, ~] = frame2im(temp);
rgbframe = im2double(rgbframe);
%frame = rgb2ntsc(rgbframe);% Canon 650D videos do not need this!
frame=rgbframe;

%Create the cropped stack
cropped = imcrop(frame,cropwindow);

% create  stack
Stack = zeros(endIndex - startIndex +1, size(cropped,1),size(cropped,2),size(cropped,3));
%Stack = zeros(1001, size(cropped,1),size(cropped,2),size(cropped,3));
Stack(1,:,:,:) = cropped;

k = 1;
for j=startIndex+1:endIndex
%for j=400:1400
    k = k+1;
    temp.cdata = read(vid, j);
    [rgbframe,~] = frame2im(temp);

    rgbframe = im2double(rgbframe);
%    frame = rgb2ntsc(rgbframe); Canon 650D videos do not need this!
frame=rgbframe;
    cropped = imcrop(frame,cropwindow);
    Stack(k,:,:,:) = cropped;
    disp(k);
end

Color(:,:,1)=mean(mean(Stack(:,:,:,1),2),3);
Color(:,:,2)=mean(mean(Stack(:,:,:,2),2),3);
Color(:,:,3)=mean(mean(Stack(:,:,:,3),2),3);


Constant_color(1)=mean(Color(:,:,1));
Constant_color(2)=mean(Color(:,:,2));
Constant_color(3)=mean(Color(:,:,3));

Max_color(1)=max(Color(:,:,1));
Max_color(2)=max(Color(:,:,2));
Max_color(3)=max(Color(:,:,3));
 

Min_color(1)=min(Color(:,:,1));
Min_color(2)=min(Color(:,:,2));
Min_color(3)=min(Color(:,:,3)); 
 
alpha(1)=Max_color(1)-Min_color(1); 
alpha(2)=Max_color(2)-Min_color(2);
alpha(3)=Max_color(3)-Min_color(3);


ZConstant_color=zeros( size(Color(:,:,:),1), 1, 3);


for z=1: size(Color(:,:,:),1)
    ZConstant_color(z, :, 1) = Constant_color(1);
end

A1=Color(:,:,1)-ZConstant_color(:,:,1);

 FS = ideal_bandpassing(A1, 1, 50/60, 90/60, 50);

 
 % I want to put out the graph of the filtered stack
 %With the number of peaks, frames, length of the video,
 %and the heartrate marked on it right away
 %Thus one picture would characterize the whole video.
 fig= plot(FS)
title([vidName ' filtered frequencies']); 
hleg=legend([length(findpeaks(FS))], 'Location', 'EastOutside');
saveas(fig, fullfile(outDir,[vidName 'FS-1-.fig']));
 length(findpeaks(FS));

 %Now, here I should be doing the discrete cosine transform in order to
 %gather up what the heartrate function looks like.
 DCT_FS=dct(FS, length(findpeaks(FS)));
DCT_FS1=dct(FS, endIndex-10);
 plot(DCT_FS1); 
 
end


% The right routine for MVI_3780
% Stack_n=Stack(400:1400,:,:,:)
% Stack_n=Stack(400:1400,:,:,:);
% Color_n(:,:,1)=mean(mean(Stack_n(:,:,:,1),2),3);
% clear Color_n
% Color_n(:,:,1)=mean(mean(Stack_n(:,:,:,1),2),3);
% clear Constant_color_n
% Constant_color_n(1)=mean(Color_n(:,:,1));
% ZConstant_color_n=zeros( size(Color_n(:,:,:),1), 1, 3);
% for z=1: size(Color_n(:,:,:),1)
% ZConstant_color_n(z, :, 1) = Constant_color_n(1);
% end
% A1_n=Color_n(:,:,1)-ZConstant_color_n(:,:,1);
% plot(A1_n)
% FS_n = ideal_bandpassing(A1_n, 1, 50/60, 90/60, 50);
% plot(FS)
% plot(FS_n)
% length(findpeaks(FS_n))