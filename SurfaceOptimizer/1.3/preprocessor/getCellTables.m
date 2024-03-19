%%%%%%%%%%%%%%%%%
%Top module for getting a larger unit cell table from multiple raw data
%sources. 
%%%%%%%%%%%%%%%%%
function unitCellTable = getCellTables(varargin)
    for i=1:nargin
        predata = preprocess(varargin{i});
        unitCellTable = [unitCellTable; predata{2}];
    end
end

