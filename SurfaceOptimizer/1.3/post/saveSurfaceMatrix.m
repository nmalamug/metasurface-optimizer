function cell_types = saveSurfaceMatrix(surface,name)
%GETSURFACEMATRIX Summary of this function goes here
%   Detailed explanation goes here
maxparam = 0;
for i=1:length(surface.cells)
    if(length(surface.cells(i).params) > maxparam)
        maxparam = length(surface.cells(i).params);
    end
end
my_design = zeros(max(size(surface.cells)),maxparam);
cell_types = [];
for i=1:length(surface.cells)
    my_design(i,1:numel(surface.cells(i).params)) = surface.cells(i).params;
    switch surface.cells(i).cellType
        case "crossw100"
            cell_types(i) = 11;
        case "crossw150"
            cell_types(i) = 12;
        case "crossx200y50"
            cell_types(i) = 13;
        case "crossw200"
            cell_types(i) = 14;
        case "crossw250"
            cell_types(i) = 15;
        case "crossw300"
            cell_types(i) = 16;
        case "SquareInSquare"
            cell_types(i) = 2;
    end
end
save(name, "my_design", "cell_types");
end

