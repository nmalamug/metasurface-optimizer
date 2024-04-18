function matrix = generateDesigns(numcells, numdesigns)
%GENERATEDESIGNS Summary of this function goes here
%   Detailed explanation goes here
matrix = [];
    for i=.1:.1:.9
        temp = rand(floor(numdesigns/9), numcells) < i;
        matrix = [matrix ; temp];
    end
end
