%pick a square
%pick a square off the frame of the video
%create a stack of its values for the whole video
%compute the average value for each channel
%graph it
%no altering of the values


function ain_pick_a_square(vidFile,outDir,x0 , x1, y0, y1)
 mode='-crop-';
global cur_file;

 cropwindow = [x0 x1 y0 y1];
 
    [~,vidName] = fileparts(vidFile);

%     outName = fullfile(outDir,[vidName '-' x0 '-' x1 '-' y0 '-' y1 '.avi']);


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
    Stack = zeros(endIndex - startIndex +1, size(cropped,1),size(cropped,2),size(cropped,3));
    Stack(1,:,:,:) = cropped;

    k = 1;
    for i=startIndex+1:endIndex
            k = k+1;
            temp.cdata = read(vid, i);
            [rgbframe,~] = frame2im(temp);

            rgbframe = im2double(rgbframe);
            frame = rgb2ntsc(rgbframe);

            cropped = imcrop(frame,cropwindow);
            Stack(k,:,:,:) = cropped;
         

            
            
    end
   disp('Stack built...')
   disp('Making graphs...')
      fig= plot(mean(mean(Stack(:,:,:,1),2),3))
    title([cur_file ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 1'])
  saveas(fig, fullfile(outDir,[cur_file mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-1-.fig']));
   fig= plot(mean(mean(Stack(:,:,:,2),2),3))
  title([cur_file ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 2'])
   saveas(fig, fullfile(outDir,[cur_file mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-2-.fig']));
   fig= plot(mean(mean(Stack(:,:,:,3),2),3))
  title([cur_file ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 3'])
   saveas(fig, fullfile(outDir,[cur_file mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1)  '-3-.fig']));
   
    disp('Finished')
    
   


%     %% Render on the input video
%     disp('Rendering...')
%     % output video
%     k = 0;
%     for i=startIndex:endIndex
%         k = k+1
%         temp.cdata = read(vid, i);
%         [rgbframe,~] = frame2im(temp);
%         rgbframe = im2double(rgbframe);
%         frame = rgb2ntsc(rgbframe);
% 
%         filtered = squeeze(filtered_stack(k,:,:,:));
% 
%         filtered = imresize(filtered,[vidHeight vidWidth]);
% 
%         filtered = filtered+frame;
% 
%         frame = ntsc2rgb(filtered);
% 
%         frame(frame > 1) = 1;
%         frame(frame < 0) = 0;
% 
% 
%         writeVideo(vidOut,im2uint8(frame));
%     end
% 
     disp('Finished')
%     close(vidOut);

end
