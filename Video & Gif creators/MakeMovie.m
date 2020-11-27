function  MakeMovie(images,filename)
% MakeMovie(images,filename) writes a squence of images to an mp4 file, creating a movie
% Inputs:
%     images   - a 1D cell array where each element of the array contains
%                an RGB image, stored as a 3D array of uint8 values
%     filename - the name of the mp4 file

% set up a video writer object, for creating an mp4 file
vid = VideoWriter(filename,'MPEG-4');
vid.FrameRate = 10; % 10 frames a second is relatively smooth
open(vid);

numFrames = length(images); % determine number of frames in the movie
for i = 1:numFrames
    writeVideo(vid,images{i});
end

close(vid);

end

