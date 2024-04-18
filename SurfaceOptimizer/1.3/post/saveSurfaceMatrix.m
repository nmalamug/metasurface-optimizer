function cell_types = saveSurfaceMatrix(surface,name)%, generated)
%GETSURFACEMATRIX Summary of this function goes here
%   Detailed explanation goes here
maxparam = 36;
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
        case "DoubleSquare"
            cell_types(i) = 21;
    %{  
        case "generatedSym"
            cell_types(i) = 3;
            my_design(i,:) = generated(surface.cells(i).params, :);
    %}
    end
end
save(name, "my_design", "cell_types");
end

