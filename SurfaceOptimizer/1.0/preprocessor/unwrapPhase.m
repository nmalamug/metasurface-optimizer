%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases (1 dimension per parameter), %
% and refactor between 0 and 2*pi.
% Pass all of the wavelengths in. 
% Account for discontinuities at the phase monitors
%%%%%%%%%%%%%%%%%
function newphase = unwrapPhase(phase)
    fprintf("Unwrapping Phase\n")
    % Unwrap phase n dimensionally
    newphase = mod(phase, 2*pi);
end
