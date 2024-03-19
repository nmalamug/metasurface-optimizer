%%%%%%%%%%%%%%%%%
% Input data, datapoints, and query points.
% interpData(V, X1, X2, X3, ..., Xq1, Xq2, Xq3,...)
%%%%%%%%%%%%%%%%%
function iData = interpData(V,varargin)
    numInputs = max(size(varargin));
    assert(mod(numInputs,2)==0, "Interpolation data is incorrectly formatted");
    numGrids = numInputs/2;

    inputParams = varargin(1:numGrids); 
    interpParams = varargin((numGrids+1):end);

    

    inputGrids = cell(1,numGrids);
    interpGrids = cell(1,numGrids;)
    
end

