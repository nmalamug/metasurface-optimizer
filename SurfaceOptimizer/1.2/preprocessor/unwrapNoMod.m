%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases (1 dimension per parameter), %
% and bring discontinuities up by 2*pi
%%%%%%%%%%%%%%%%%
function [newphase, minPhases] = unwrapNoMod(phase)
    fprintf("Unwrapping Phase Unwrapping Phase no mods\n")
    dims = numel(size(phase));
    % Unwrap phase n dimensionally
    newphase = phase;
    % Make the minimum value 0 - renormalize - mod by 2pi
    % We're going to have to mod the phase values and the slopes
    % by 2*pi anyway, might as well just calculate it now. 
    numParams = dims-1;
    for ii=1:numParams
        newphase = unwrap(newphase,[],ii);
    end
end