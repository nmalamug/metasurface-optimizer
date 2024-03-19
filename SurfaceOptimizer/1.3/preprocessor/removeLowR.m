%%%%%%%%%%%%%%%%%
% Remove low reflectivity values from the unit cell table.
%%%%%%%%%%%%%%%%%
function unitCellTable = removeLowR(initCellTable, threshold)
    fprintf("Removing cell designs with R < %f \n", threshold);
    unitCellTable = [];
    for i = 1:numel(initCellTable)
        if(min(initCellTable(i).R > threshold))
            unitCellTable = [unitCellTable; initCellTable(i)];
        end
    end
end

