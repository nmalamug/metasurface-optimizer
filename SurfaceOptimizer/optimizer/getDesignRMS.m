function designRMS = getDesignRMS(cells,slopes)
%GETDESIGNRMS Summary of this function goes here
%   Detailed explanation goes here
    slopeSize = size(slopes);
    errorMatrix = zeros(numel(cells),slopeSize(1));
    for i = 1:numel(cells)
        for j=1:slopeSize(1)
            expectedPhase(j) = mod(slopes{j}(1)*(i-1) + slopes{j}(2), 2*pi);
            errorThisCell(j) = getPhaseDistance(expectedPhase(j),cells(i).phase(j));
        end
        errorMatrix = [errorMatrix;errorThisCell];
    end
    designRMS = rms(errorMatrix);
end

