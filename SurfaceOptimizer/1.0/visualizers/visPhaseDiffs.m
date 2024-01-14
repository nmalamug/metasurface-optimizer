function visPhaseDiffs(data1,data2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    pre1 = preprocess(data1);
    pre2 = preprocess(data2);
    datadiffs = data1;
    for i=1:numel(datadiffs.phase)
        datadiffs.phase(i) = getPhaseDistance(pre1{1}.phase(i),pre2{1}.phase(i));
    end
    
    datadiffs.R = pre1{1}.R - pre2{1}.R;
    visPhase(datadiffs)
end

