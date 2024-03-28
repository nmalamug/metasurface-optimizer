function RTable = getRTable(unitCellTable)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    RTable(1,:) = unitCellTable(1).R;
    for i=2:numel(unitCellTable)
        RTable(i,:) = unitCellTable(i).R;
    end
end
