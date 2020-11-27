% CreateColourmap will create a colour map, of N (inputted number)
% colours returned as a 2D array of RGB Values, where in every row,
% there is an RGB Value (3 numbers representing the colour). The RGB values
% will evenly change at a constant rate as you go from the first row to the
% last row. Where the first row, is the RGB value given by StartColour, and
% the last row is the RGB value given by the EndColour.

% Author: Minko Minkov

function [ColourMap] = CreateColourmap(StartColour, EndColour, N)
    % Uses linspace to make N different colours, with their RGB values
    % evenly spaced from and including the RGB values of the StartColour to
    % the and including the RGB values of the EndColour
    % Linspace returns a horizontal array, so I transpose it, to convert it
    % to a vertical array
    RedValues = linspace(StartColour(1), EndColour(1), N).';
    GreenValues = linspace(StartColour(2), EndColour(2), N).';
    BlueValues = linspace(StartColour(3), EndColour(3), N).';
    % Adds the vertical, evenly spaced Red, Green, and Blue value arrays to
    % make one singular N-by-3 Colour Map array
    ColourMap = [RedValues, GreenValues, BlueValues];
end