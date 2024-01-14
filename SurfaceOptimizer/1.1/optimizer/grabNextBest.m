%%%%%%%%%%%%%%%%%
% Code to get the next cell design
% Use RMS along all lambda to determine lowest loss cell.
%%%%%%%%%%%%%%%%%
function cell = grabNextBest(unitCellTable, n, slopes)
    minRMS = Inf;
    slopeSize = size(slopes);
    % Get the desired phases at cell number n.
    for i = 1:slopeSize(1)
        desiredPhase(i) = mod(slopes{i}(1)*n+slopes{i}(2), 2*pi);
    end
    error = zeros(3,1);
    for i = 1:numel(unitCellTable)
        for j = 1:slopeSize(1)
            error(j) = getPhaseDistance(unitCellTable(i).phase(j), desiredPhase(j));
        end
        currRMS = rms(error);
        if(currRMS < minRMS)
            minRMS = currRMS;
            cell = unitCellTable(i);
        end
    end
end

