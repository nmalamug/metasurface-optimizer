%%%%%%%%%%%%%%%%%
% Code to get the next cell design
% Use RMS along all lambda to determine lowest loss cell.
%%%%%%%%%%%%%%%%%
function [cell,ref] = grabNextBest(phaseTable, n, slopes)
    %minRMS = Inf;
    slopeSize = size(slopes);
    % Get the desired phases at cell number n.
    desiredPhase = zeros(1,slopeSize(1));
    for i = 1:slopeSize(1)
        desiredPhase(i) = mod(slopes{i}(1)*n+slopes{i}(2), 2*pi);
    end
    desiredPhase = gpuArray(desiredPhase);
    error = gpuArray(getPhaseDistance(phaseTable,desiredPhase));
    error = rms(error,2);
    [mymin, idx] = min(error);
    ref = idx;
    cell = phaseTable(idx,:);
    %We're doing things one by one here, let's matrix things out. 
    %{
    for i = 1:num(1)
        for j = 1:slopeSize(1)
            error(j) = getPhaseDistance(phaseTable(i,j), desiredPhase(j));
        end
        currRMS = rms(error);
        if(currRMS < minRMS)
            minRMS = currRMS;
            cell = phaseTable(i,:);
            ref = i;
        end
    end
    %}
end

