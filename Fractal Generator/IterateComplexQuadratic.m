% IterateComplexQuadratic identifies whether a complex number, Z, is a
% member of the Julia Set. It does so by repeatedly applying the formula,
% Z = Z^2 + C. Until the modulus of Z is greater than or equal to 3, or,
% until we've applied the formula a MaxIterations amount of times. If the
% former condition is met, then it is not a member of the julia set, and we
% output how many iterations it took before we could identify this. If we
% reach the MaxIterations, then we will identify Z as part of the julia
% set, and output the number 0.

% Author: Minko Minkov

function [JuliaVal] = IterateComplexQuadratic(Z, C, MaxIterations)
    % pre-sets Julia Value as 0, assuming the complex number z, is a member
    % of the julia set
    JuliaVal = 0;
    for i = 1:MaxIterations
        Z = Z^2 + C;
        if abs(Z) >= 3
            % Z has an absolute value greater than or equal to 3, so the
            % Julia Value is set to the amount of iterations it took when
            % that happend. It is not a member of the Julia Set, and the
            % function is stopped.
            JuliaVal = i;
            break
        end
    end
end