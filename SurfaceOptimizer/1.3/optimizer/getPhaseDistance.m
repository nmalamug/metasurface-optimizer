%%%%%%%%%%%%%%%%%
% Code to get distance between 2 phases. 
% Assume inputs are between 0 and 2pi
%%%%%%%%%%%%%%%%%
function phaseDist = getPhaseDistance(phase1,phase2)
    phase1 = single(phase1);
    phase2 = single(phase2);
    distances1 = abs(phase2-phase1);
    distances2 = abs((phase2+(2*pi))-phase1);
    distances3 = abs((phase2-(2*pi))-phase1);
    phaseDist = min(distances1,distances2);
    phaseDist = min(phaseDist, distances3);
end

