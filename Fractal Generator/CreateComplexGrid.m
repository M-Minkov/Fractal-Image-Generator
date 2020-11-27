% This function makes a n-by-n 2D array which stores equally spaced
% complex numbers from a square grid on the argand diagram
% The 4 corners that make up the square grid are the points:
% -2+2i, 2+2i, 2-2i, and -2-2i
% Author: Minko Minkov
function [ComplexGrid] = CreateComplexGrid(N)
    % Pre-allocating complex grid to speed up programme
    ComplexGrid = zeros(N, N);
    % Precreates N evenly spaced complex parts where the kth index in
    % ComplexPart represents the complex part of each number in the
    % kth row of the ComplexGrid.
    ComplexPart = linspace(2i, -2i, N);
    for k = 1:N
        % Creating N evenly spaced complex numbers along a straight
        % horizontal line from -2 + ComplexPart(k), to 2 + ComplexPart(k)
        ComplexGrid(k, 1:N) = linspace(-2+ComplexPart(k), ...
            2+ComplexPart(k), N);
    end
end