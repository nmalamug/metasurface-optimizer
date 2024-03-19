function phaseTable = getPhaseTable(unitCellTable)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    phaseTable(1,:) = unitCellTable(1).phase;
    for i=2:numel(unitCellTable)
        phaseTable(i,:) = unitCellTable(i).phase;
    end
end

