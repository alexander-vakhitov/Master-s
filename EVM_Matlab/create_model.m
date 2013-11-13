%This function produces the model data.
%It is created in accordance with the model which is yet to be described.
%This is the first attempt at the model. It looks like the order of
%business should be as following:
%1. Just write out the constant color video;
%2. Add some "pulse" data;
%3. Add some noise;
%4. Add the lights.
%Now, I intend to have input parameters that would default to reasonable
%values.
%I also want to write out to a video file which could be viewed easily 
%and into a matlab file that could be trivial to import.

function create_model (x_size, y_size, base_color, amp, length, ...
                        framerate, noise_strength, phi, strength)
 
 resultsDir = 'ain_results-20131112model';
 filename='20131112_model7.avi'                   
 mkdir(resultsDir);
 
 vidOut = VideoWriter(fullfile(resultsDir,filename));
  vidOut.FrameRate = framerate;  
  
  open(vidOut)
  
 
 
 if isempty(x_size)
     x_size=100
 %elseif  check that x_size is a number;
 end
 
 if isempty(y_size)
     y_size=100
     %elseif check that y_size is a number;
 end
 
 if isempty(base_color)
     base_color(1,:)=[123/255 124/255 125/255];
     %elseif check that base_color is an apprpriate array of doubles
 end
 
 if isempty(amp)
     amp=[.02 .075 .015]
     %elseif check that it's a positive integer
 end
 
 if isempty(length)
     length=100
     %elseif check that it's a positive integer
 end
 
 if isempty(noise_strength)
     noise_strength=1
     %elseif check that it's a positive double
 end
 
 if isempty(framerate)
     framerate=25
     %elseif check that it's a positive integer
 end
 
  if isempty(phi)
     phi=0
     %elseif check that it's a positive integer
  end
 
   if isempty(strength)
     strength=[1 1 1]
     %elseif check that it's a positive integer
 end
 
 
  disp('Magic happening')
  
  vidOut = VideoWriter(fullfile(resultsDir,filename));
  vidOut.FrameRate = framerate;  
  
  open(vidOut)
  
  
  frame_num=0
  
  
  
  for frame_num=1:length
      frame_num=frame_num+1
  for x=1:x_size
      for y=1:y_size
          %rand*base_color is too much fun
          %large alpha is too large
          %2*sin is too much
          Stack(frame_num,x,y,1)=cos(phi)*strength(1)*(base_color(1)+amp(1)*sin(frame_num/framerate))+0.1*(rand-.5);
          Stack(frame_num,x,y,2)=cos(phi)*strength(2)*(base_color(2)+amp(2)*sin(frame_num/framerate))+0.1*(rand-.5);
          Stack(frame_num,x,y,3)=cos(phi)*strength(3)*(base_color(3)+amp(3)*sin(frame_num/framerate))+0.1*(rand-.5);
      end
      
  end
  
      writeVideo(vidOut,im2uint8(squeeze(Stack(frame_num,:,:,:))));              
                    
                    
                    
                    
                    
  end
  
                    
                    
                    
                    
                    
                    
                    
    imshow([squeeze(Stack(100, :, :, :)) squeeze(Stack(400, :, :, :)); squeeze(Stack(800, :, :, :)) squeeze(Stack(1200, :, :, :))]);                
                    
                    
                    
                    
                    
                    
end
