% GenerateJuliaSets is given a 1D list of CValues, and a number N, for a
% complex grid of size N-by-N to be made, as well as a colour map.
% All of which is used to create a unique JuliaArray, and image for each
% unique C Value. Where all of the images are saved and returned
% in a cell array, ImageArray. It takes the complexgrid created, and passes
% it to JuliaSetPoints, to make the JuliaArray. It then passes the
% JuliaArray to ColourJulia to make the image, and saves the image.

% Author: Minko Minkov

function [ImageArray] = GenerateJuliaSets(CValues, N, ColourMap)
    % Creates grid of complex numbers
    GridOfComplexNumbers = CreateComplexGrid(N);
    % saves cut off point based on rows of colourmap, and amount of images
    % based on amount of C values to use (CValues)
    AmountofImages = length(CValues);
    Cutoff = size(ColourMap, 1);
    
    % Pre-allocate JuliaArray array to be N-by-N, same size as complex
    % grid created. In order to speed up the programme.
    JuliaArray = zeros(N, N);
    
    % Creates a unique JuliaPoints array and image for each unique C value
    % from CValues array.
    for i = 1:AmountofImages
        JuliaArray = JuliaSetPoints(GridOfComplexNumbers, CValues(i), ...
            Cutoff);
        
        % Saves final image created to cell array, ImageArray.
        ImageArray{i} = ColourJulia(JuliaArray, ColourMap);
    end
end