% Given a JuliaArray, and Colour grid (ColourMap), ColourJulia will output
% a 2D image, saved as a 3D uint8 array. For each Julia Value in the Rth,
% Cth, coordinates of the JuliaArray, we will use the number stored in the
% coordinate to identify which colour (RGB values) to use for the pixel at
% the Rth, Cth coordinate in the FinalImage (the 3D uint8 image array).

% Author: Minko Minkov

function [FinalImage] = ColourJulia(JuliaArray, ColourMap)
    % Gets the dimensions of image based on julia array, and predefines
    % image as 3D array with the same amount of rows, and coloumns, but
    % with 3 numbers per pixel in the 3rd dimension, of Unsigned 8 Bit
    % Integer values.(3D image array)
    SizeOfImage = size(JuliaArray);
    FinalImage = zeros(SizeOfImage(1), SizeOfImage(2), 3, "uint8");
    % Iterates over rows and columns in JuliaArray
    for R = 1:SizeOfImage(1)
        for C = 1:SizeOfImage(2)
            % Checks if point on JuliaArray is anything except for 0 if
            % so then, set the RGB colour values as the one specified in
            % the colour grid. Otherwise, leaves RGB values as predefined
            % value of 0. (The colour Black)
            if JuliaArray(R, C)
                FinalImage(R, C, 1) = ColourMap(JuliaArray(R, C), 1)*255;
                FinalImage(R, C, 2) = ColourMap(JuliaArray(R, C), 2)*255;
                FinalImage(R, C, 3) = ColourMap(JuliaArray(R, C), 3)*255;
            end
        end
    end
end