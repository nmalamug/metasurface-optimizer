%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases (1 dimension per parameter), %
% and refactor between 0 and 2*pi.
% Pass all of the wavelengths in. 
% Account for discontinuities at the phase monitors
%%%%%%%%%%%%%%%%%
function newphase = unwrapPhase(phase, numParams)
    fprintf("Unwrapping Phase\n")
    dims = size(phase);
    % Unwrap phase n dimensionally
    n = numel(phase);
    for ii=1:n
        phase(ii) = mod(phase(ii), 2*pi);
        
    end
    newphase = phase;

    % Make the minimum value 0 - renormalize - mod by 2pi
    % We're going to have to mod the phase values and the slopes
    % by 2*pi anyway, might as well just calculate it now. 
    %{
    for ii=1:numParams
        newphase = unwrap(newphase,[],ii);
    end
    for ii=1:dims(end)
        newphase(:,:,ii) = newphase(:,:,ii)-min(newphase(:,:,ii),[],"all");
    end
    %}
end
