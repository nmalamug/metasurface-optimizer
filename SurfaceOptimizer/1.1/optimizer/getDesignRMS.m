%%%%%%%%%%%%%%%%%
% First, computes error of all unit cells at each wavelength
% Then, compute RMS for each wavelength
%%%%%%%%%%%%%%%%%
function designRMS = getDesignRMS(cells,slopes)
    slopeSize = size(slopes);
    num = size(cells);
    errorMatrix = zeros(num(1),slopeSize(1));
    for i = 1:num(1)
        for j=1:slopeSize(1)
            expectedPhase(j) = mod(slopes{j}(1)*(i-1) + slopes{j}(2), 2*pi);
            errorThisCell(j) = getPhaseDistance(expectedPhase(j),cells(i,j));
        end
        errorMatrix(i,:) = errorThisCell;
    end
    designRMS = rms(errorMatrix);
end

