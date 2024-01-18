%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases (1 dimension per parameter), %
% and refactor between 0 and 2*pi.
% Pass all of the wavelengths in. 
% Account for discontinuities at the phase monitors
% Normalize lowest value to 0 - good for interpolation
% Return the minimum phase values to allow for an un-doing
%%%%%%%%%%%%%%%%%
function [newphase, minPhases] = unwrapPhaseNormalized(phase, numParams)
    fprintf("Unwrapping Phase Normalized\n")
    dims = size(phase);
    % Unwrap phase n dimensionally

    % Make the minimum value 0 - renormalize - mod by 2pi
    % We're going to have to mod the phase values and the slopes
    % by 2*pi anyway, might as well just calculate it now. 
    
    for ii=1:numParams
        newphase = unwrap(newphase,[],ii);
    end
    minPhases = zeros(1,dims(end));
    for ii=1:dims(end)
        minPhases(ii) = min(newphase(:,:,ii),[],"all");
        newphase(:,:,ii) = newphase(:,:,ii)-minPhases(ii);
    end
    
end