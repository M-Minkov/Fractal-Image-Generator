% Read Colour Values takes a file name, and takes colours and their
% associated RGB values, and saves them into MATLAB arrays. A Colours array
% with all of the colour names are saved. Where the name at the Rth row,
% matches with the RGB Values in the Rth row of the Values array.
% If the filename given does not exist, then an error message is returned.

% Author: Minko Minkov

function [Colours, Values] = ReadColourValues(FileName)
    % Tries to extract colours, and RGB values from the file, using
    % "file_name". If the file does not exist, the code will produce an
    % error, and I will catch the error, printing that the file does not
    % exist.
    try
        [Colours, Red, Green, Blue] = textread(FileName,'%s %f %f %f');
        Values = [Red, Green, Blue];
    catch
        % File not existing error caught, error message displayed in red
        fprintf(2, "Error opening file %s\n", FileName);
    end
end