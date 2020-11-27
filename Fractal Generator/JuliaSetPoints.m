% Given a grid of complex numbers, a specific C value, and cutoff point for
% maximum iterations. JuliaSetPoints will return a grid of same dimensions
% as the complex grid given. Where the Rth Row, and Cth Coloumn number in
% the Julia Array matches the amount of iterations it took for
% IterateComplexQuadratic to discover that the complex number in the complex
% grid, at the Rth, Cth coordinates, is not a member of the Julia Set, with
% the given C Value, and maximum amount of iterations allowed (Cutoff). OR
% replace it with 0, if identified as a julia member.

% Author: Minko Minkov

function [JuliaArray] = JuliaSetPoints(ComplexGrid, C_val, Cutoff)
    % Dimensions of Complex Grid saved, and used to pre-allocate JuliaArray
    DimensionsOfGrid = size(ComplexGrid);
    
    JuliaArray = zeros(DimensionsOfGrid);
    
    % Loops over each complex number in Grid, and finds Julia Value of that
    % complex number, using the number C, and Cutoff point for iterations
    for R = 1:DimensionsOfGrid(1)
        for C = 1:DimensionsOfGrid(2)
            JuliaArray(R, C) = ...
                IterateComplexQuadratic(ComplexGrid(R, C), C_val, Cutoff);
        end
    end
end


