%%%%%%%%%%%%%%%%%
% Take a n-dimensional matrix of phases, and refactor between 0 and 2*pi.
% Account for discontinuities at the phase monitors
%%%%%%%%%%%%%%%%%
function unrollPhase(phase)
    for ii=1:numel(size(phase))
        phase = unwrap(phase,[],ii);
    end
    % Make the minimum value 0
    n = numel(phase);
    minall = -min(phase,[],"all");
    for ii=1:n
        phase(ii) = phase(ii)+minall;
    end
end
