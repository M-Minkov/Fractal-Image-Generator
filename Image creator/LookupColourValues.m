% LookupColourValues will:
% Given an array of colour names (ColourNames), and an array of RGB Values
% (Values), where the name in the Rth row of ColourNames matches
% the RGB value in the Rth row of the Values array. Find out if an inputted
% colour string (Colour) is in the ColourNames array, and output it's RGB
% values as a 1D array.

% Author: Minko Minkov

function [ColourValue] = LookupColourValues(Colour, ColourNames, Values)
    % strcmpi returns a 1 dimensional, vertical array of 0s. With a 1 saved
    % in the position where the Colour string matched a colour in the
    % ColourNames array. (case insensitive string matching)
    position = strcmpi(ColourNames, Colour);
    
    % Checks if there is a 1 in the position array, if there is, then use
    % it to output the row of RGB values that matches with the colour
    % perviously specified.
    if any(position)
        ColourValue = Values(position, 1:3);
    else
        % Otherwise, the colour did not exist, and we output the colour
        % black, and say the colour was not found.
        ColourValue(1:3) = 0;
        fprintf(2, "Colour not found\n");
    end
    
end