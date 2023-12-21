%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases (1 dimension per parameter), %
% and refactor between 0 and 2*pi.
% Pass all of the wavelengths in. 
% Account for discontinuities at the phase monitors
%%%%%%%%%%%%%%%%%
function newphase = unwrapPhase(phase)
    % Unwrap phase n dimensionally
    for ii=1:numel(size(phase))-1
        newphase = unwrap(phase,[],ii);
    end
    % Make the minimum value 0 - renormalize - mod by 2pi
    % We're going to have to mod the phase values and the slopes
    % by 2*pi anyway, might as well just calculate it now. 
    n = numel(newphase);
    for ii=1:n
        newphase(ii) = mod(newphase(ii), 2*pi);
    end
end
