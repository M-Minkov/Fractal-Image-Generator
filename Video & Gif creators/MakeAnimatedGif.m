function MakeAnimatedGif(images,filename)
% MakeAnimatedGif(images,filename) writes a squence of images to an
% animated gif file.
% Inputs: 
%     images   - a 1D cell array where each element of the array contains
%                an RGB image, stored as a 3D array of uint8 values
%     filename - the name of the gif file

% mirror our image array (this will double the length of our animation
% and since animated gifs play in a loop, this will result in a continuous
% animation with no jumps)
images = [images flip(images)];

numFrames = length(images); % determine number of frames for animation
delayTime = 1/15; % will result in 10 frames a second

% loop through all images and add them to the animated gif.
for i = 1:numFrames
    [A,map] = rgb2ind(images{i},256); % generate indices and map needed for writing to gif
    if i == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',delayTime);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',delayTime);
    end
end