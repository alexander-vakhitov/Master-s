    vidFile = 'F:\SPBSU\Masters\EVM_Matlab\data\warped.avi';
    %vidFile = 'c:\Digital Vision Labs\evm\EVM_Matlab-1.1\EVM_Matlab\data\MVI_4064.avi';

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
    level = 7;

    % compute Gaussian blur stack   
    Gdown_stack = build_GDown_stack(vidFile, startIndex, endIndex, level);    
    % make pulse graph and count pulse via thresholding
    cellx = 2;
    celly = 2;
    margin = 10;
    thr = 0.3*1e-3;
    figure(1);
    cnt = pulsecounter(Gdown_stack, cellx, celly, margin, thr);
    %add noise to frames and build stack for noise frames
    Gdown_stack_noisy = build_GDown_stack_noise(vidFile, startIndex, endIndex, level, 100/255);    
    figure(4);
    %count pulse for noisy frames
    cnt2 = pulsecounter(Gdown_stack_noisy, cellx, celly, margin, thr);
    %do OMP filtering (from book on Sparse Representations)
    opts = [];
    opts.slowMode = 0;
    opts.printEvery     = 25;
    K_target = 10;
    datalen = length(data);
    datainterval = [margin:datalen-margin];
    A = dctmtx(datalen)';
    dataflt = Gdown_stack_noisy(:, cellx, celly, 1);
    b = dataflt;%(datainterval);
    [xk] = OMP( A, b, K_target, [],opts);
    length(find(xk))
    data_spflt = A*xk;
    figure(5);
    %substitute results of sparse filtering to the stack
    Gdown_stack_flt = Gdown_stack_noisy;
    Gdown_stack_flt(:, cellx, celly, 1) = data_spflt(:);
    %count the pulse on filtered stack
    cnt2spn = pulsecounter(Gdown_stack_flt, cellx, celly, margin, thr);
    