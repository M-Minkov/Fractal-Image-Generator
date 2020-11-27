% This script will generate a Julia set animation, showing one
% Julia set fractal morphing into another
% It creates both an animated gif and an mp4 of the animation
clc
clear
clf

% Fetch user inputs
% n = input('Enter the width (in pixels) of the square image (e.g. 500): ');
% frames = input('Enter the number of frames to include in the animation (2 or more):' );
% cutoff = input('Enter the cutoff value (e.g. 100): ');
n = 500;
frames = 100;
cutoff = 50;

% Create two complex points (these can be modified to get different animations)
c1 = input("Complex Number 1: ");

while ~isnumeric(c1)
    disp("Invalid complex number, please enter a new one.");
    c1 = input("Complex Number 1: ");
end

c2 = input("Complex Number 2: "); % Complex value for generating our ending Julia set
% c1 =  0.28+0.008i;
% c2 = -0.162 + 1.04i;

while ~isnumeric(c2)
    disp("Invalid complex number, please enter a new one.");
    c2 = input("Complex Number 2: ");
end

% Select a colour map
response = input('Do you want to use a default colour map? (y or n):','s');
if strcmpi(response(1),'y')
    % built in options include:
    % parula,jet, hsv, hot, cool, spring, summer, autumn, winter, gray, bone,
    % copper, pink, lines, colorcube, prism, flag, white
    colourmap = jet(cutoff); % use a built in colour map, feel free to try different ones
    
else
    % eventually you will implement the ReadColourValues, LookupColourValues
    % and CreateColourMap function so that you can create your own colour maps
    % (until then you can use one of the default ones).
    %
    % NOTE: You will write the ReadColourValues function
    file = input("Type a filename that you've put inside the project folder, with color values: ");
    [colourNames, colourValues] = ReadColourValues(NOTE); 
    disp('You can choose from the following colours:')
    for i=1:length(colourNames) 
        fprintf(1,'%s\n',colourNames{i}); 
    end
    % ask for colour names
    colour1 = input('Enter name of colour 1:','s');
    colour2 = input('Enter name of colour 2:','s');
    % Read in colour values from file 
    % Look up colour values for start and end colour
    % NOTE: You will write the LookupColourValues function
    colour1values = LookupColourValues(colour1,colourNames, colourValues); 
    colour2values = LookupColourValues(colour2,colourNames, colourValues);
    % create colour map
    % NOTE: You will write the CreateColourmap function
    colourmap = CreateColourmap(colour1values,colour2values,cutoff);
end

% Create a grid of values
% NOTE: You will write the CreateComplexGrid function
grid = CreateComplexGrid(n);

% Display the starting julia set
figure(1)
subplot(1,2,1)

% Determine the points in the starting Julia set 
% NOTE: You will write JuliaSetPoints
points = JuliaSetPoints(grid,c1,cutoff);
% Convert the points to an RGB image, i.e. a 3D array of unit8 values
% NOTE: You will write ColourJulia
startImage = ColourJulia(points,colourmap);
imshow(startImage);
title(['Start image: Julia set for ' num2str(c1)])

% display ending julia set
subplot(1,2,2);
% Determine the points in the ending Julia set 
% NOTE: You will write JuliaSetPoints
points = JuliaSetPoints(grid,c1,cutoff);
% Convert the points to an RGB image, i.e. a 3D array of unit8 values
% NOTE: You will write ColourJulia
endImage = ColourJulia(points,colourmap);
imshow(endImage);
title(['End image: Julia set for ' num2str(c1)])

pause(0.1);
disp('Generating fractals for animation (this may take some time)');

% Generate a path from the starting c value to the end c value
% If you want to get creative you can try generating a circular path
% on the complex number plane using the famous e^(i *theta) formula
cvalues = linspace(c1,c2,frames);

% angle_grad = 2*pi/frames;
% e = exp(1);
% cvalues = zeros(frames);
% angle = 0;
% for k = 1:frames
%     cvalues(k) = 1.2*(e^(1i*angle));
%     angle = angle + angle_grad;
% end

% Generate all sets for the animation
% NOTE: You will write GenerateJuliSets
ImageArray = GenerateJuliaSets(cvalues,n,colourmap);

% use the supplied MakeAnimatedGif function to create an animated gif
prompt = 'Do you want an animated gif? Y/N: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end

if str == "Y"
    disp("Conversion of the array to a gif will take a while, please wait")
    MakeAnimatedGif(ImageArray,'julia.gif');
end


% use the supplied MakeMovie function to create an mp4 movie
prompt = 'Do you want a MP4 video? Y/N: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end

if str == "Y"
    disp("Conversion of the array to a video will take a while, please wait")
    MakeMovie(ImageArray,'julia.mp4');
end
