%%%%%%%%%%%%%%%%%
% Code to get distance between 2 phases. 
% Assume inputs are between 0 and 2pi
%%%%%%%%%%%%%%%%%
function phaseDist = getPhaseDistance(phase1,phase2)
    distances = cell(3,1);
    distances{1} = abs(phase2-phase1);
    distances{2} = abs((phase2+(2*pi))-phase1);
    distances{3} = abs((phase2-(2*pi))-phase1);
    phaseDist = min(distances{1},distances{2});
    phaseDist = min(phaseDist, distances{3});
end

