%%Take a video in.
%%Make its FT.
%%Make a graph of something useful.
%%2013-09-19

dataDir = './ain_data';
resultsDir = 'ain_results_1';

mkdir(resultsDir);


%% MVI_4518
inFile = fullfile(dataDir,'MVI_4518.avi');
vidFile=inFile
fprintf('Processing %s\n', inFile);

    % Read video

vid = VideoReader(vidFile);

    % Extract video info
    vidHeight = vid.Height;
    vidWidth = vid.Width;
    nChannels = 3;
    fr = vid.FrameRate;
    len = vid.NumberOfFrames;
  
    temp = struct('cdata', ...
		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
		  'colormap', []);

    startIndex = 1;
    endIndex = len-10;
  
    
    %temp.cdata = read(vid, startIndex);
     %[rgbframe,~] = frame2im(temp);
    % rgbframe = im2double(rgbframe);
   %  frame = rgb2ntsc(rgbframe);

for i=startIndex:10
       
figure, imshow(fftshift(fft(read(vid, endIndex))))
   
end;
     
% function acopy_from()
%     
% 
%     vid = VideoReader(vidFile);
%     % Extract video info
%     vidHeight = vid.Height;
%     vidWidth = vid.Width;
%     nChannels = 3;
%     fr = vid.FrameRate;
%     len = vid.NumberOfFrames;
%     temp = struct('cdata', ...
% 		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
% 		  'colormap', []);
% 
%     startIndex = 1;
%     endIndex = len-10;
% 
%     vidOut = VideoWriter(outName);
%     vidOut.FrameRate = fr;
% 
%     open(vidOut)
% 
%     % firstFrame
%     temp.cdata = read(vid, startIndex);
%     [rgbframe,~] = frame2im(temp);
%     rgbframe = im2double(rgbframe);
%     frame = rgb2ntsc(rgbframe);
% 
%     [pyr,pind] = buildLpyr(frame(:,:,1),'auto');
%     pyr = repmat(pyr,[1 3]);
%     [pyr(:,2),~] = buildLpyr(frame(:,:,2),'auto');
%     [pyr(:,3),~] = buildLpyr(frame(:,:,3),'auto');
%     lowpass1 = pyr;
%     lowpass2 = pyr;
%     pyr_prev = pyr;
%     
%     output = rgbframe;
%     writeVideo(vidOut,im2uint8(output));
% 
%     nLevels = size(pind,1);
% 
%     for i=startIndex+1:endIndex
%         
%             progmeter(i-startIndex,endIndex - startIndex + 1);
%         
%             temp.cdata = read(vid, i);
%             [rgbframe,~] = frame2im(temp);
% 
%             rgbframe = im2double(rgbframe);
%             frame = rgb2ntsc(rgbframe);
%             
%             [pyr(:,1),~] = buildLpyr(frame(:,:,1),'auto');
%             [pyr(:,2),~] = buildLpyr(frame(:,:,2),'auto');
%             [pyr(:,3),~] = buildLpyr(frame(:,:,3),'auto');
% 
%             %% temporal filtering
%             lowpass1 = (-high_b(2) .* lowpass1 + high_a(1).*pyr + ...
% 			high_a(2).*pyr_prev)./high_b(1);
%             lowpass2 = (-low_b(2) .* lowpass2 + low_a(1).*pyr + ...
% 			low_a(2).*pyr_prev)./low_b(1);
%           
%             filtered = (lowpass1 - lowpass2);
%             
%             pyr_prev = pyr;     
%             
%             %% amplify each spatial frequency bands according to Figure 6 of our paper
%             ind = size(pyr,1);
% 
%             delta = lambda_c/8/(1+alpha);
%             
%             % the factor to boost alpha above the bound we have in the
%             % paper. (for better visualization)
%             exaggeration_factor = 2;
% 
%             % compute the representative wavelength lambda for the lowest spatial 
%             % freqency band of Laplacian pyramid
% 
%             lambda = (vidHeight^2 + vidWidth^2).^0.5/3; % 3 is experimental constant
% 
%             for l = nLevels:-1:1
%               indices = ind-prod(pind(l,:))+1:ind;
%               
%               % compute modified alpha for this level
%               currAlpha = lambda/delta/8 - 1;
%               currAlpha = currAlpha*exaggeration_factor;
%               
%               if (l == nLevels || l == 1) % ignore the highest and lowest frequency band
%                   filtered(indices,:) = 0;
%               elseif (currAlpha > alpha)  % representative lambda exceeds lambda_c
%                   filtered(indices,:) = alpha*filtered(indices,:);
%               else
%                   filtered(indices,:) = currAlpha*filtered(indices,:);
%               end
% 
%               ind = ind - prod(pind(l,:));
%               % go one level down on pyramid, 
%               % representative lambda will reduce by factor of 2
%               lambda = lambda/2; 
%             end
%             
%             
%             %% Render on the input video
%             output = zeros(size(frame));
%             
%             output(:,:,1) = reconLpyr(filtered(:,1),pind);
%             output(:,:,2) = reconLpyr(filtered(:,2),pind);
%             output(:,:,3) = reconLpyr(filtered(:,3),pind);
% 
%             output(:,:,2) = output(:,:,2)*chromAttenuation; 
%             output(:,:,3) = output(:,:,3)*chromAttenuation;
% 
%             output = frame + output;
%             
%             output = ntsc2rgb(output); 
% %             filtered = rgbframe + filtered.*mask;
% 
%             output(output > 1) = 1;
%             output(output < 0) = 0;
% 
%             writeVideo(vidOut,im2uint8(output));
%                   
%     end
%     close(vidOut);
% end