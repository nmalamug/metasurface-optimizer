function my_design = saveSurfaceMatrix(surface,name)
%GETSURFACEMATRIX Summary of this function goes here
%   Detailed explanation goes here
my_design = [];
for i=1:max(size(surface.cells))
    my_design = [my_design; surface.cells(i).params];
end
save(name, "my_design");
end

