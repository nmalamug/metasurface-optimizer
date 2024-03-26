function unitCellTable = preprocessAll(params, varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    data = preprocess(varargin{1}, params.minR);
    unitCellTable = data{2};
    for i = 2:max(length(varargin))
        data = preprocess(varargin{i}, params.minR);
        unitCellTable = [unitCellTable; data{2}];
    end
end

