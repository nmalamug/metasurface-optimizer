function surfaces = createSurfaces(unitCellTable, designParams)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

tic

surface = cell(1, designParams.numSurfaces); 

switch designParams.optimizer
    case 0
        parfor i = 1:designParams.numSurfaces
            tempSurface = optimizeMetasurface(unitCellTable, designParams, designParams.minSurfaceLength+i-1);
            surface{i} = tempSurface; % Assign to unique index
        end
    case 1
        parfor i = 1:designParams.numSurfaces
            tempSurface = optimizeFree(unitCellTable, designParams, designParams.minSurfaceLength+i-1);
            surface{i} = tempSurface; % Assign to unique index
        end
end


surfaces = [surface{:}];

toc
end

