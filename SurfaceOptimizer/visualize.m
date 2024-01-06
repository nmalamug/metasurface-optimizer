function visualize(surface)
%VISUALIZE Summary of this function goes here
%   Detailed explanation goes here
    %Generate the matrix of targets based on slope
    ideal = [];
    actual = [];
    for i=1:numel(surface.cells)
        actual = [actual; surface.cells(i).phase];
        for j = 1:3
            ideal(i,j) = mod(surface.slopes{j}(1)*(i-1) + surface.slopes{j}(2), 2*pi);
        end
    end
    ideal
    actual
    %Plot the targets based on slope matrix and surface props.         
    differences = zeros(size(ideal));
    for i = 1:numel(ideal)
       differences(i) = getPhaseDistance(ideal(i), actual(i));
    end
    differences
    sz = size(ideal);
    figure
    hold on
    plot(1:sz(1), ideal(:,1), "--")
    plot(1:sz(1), actual(:,1), "o")
    plot(1:sz(1), differences(:,1))   

    figure
    hold on
    plot(1:sz(1), ideal(:,2), "--")
    plot(1:sz(1), actual(:,2), "o")
    plot(1:sz(1), differences(:,2))   

    figure
    hold on
    plot(1:sz(1), ideal(:,3), "--")
    plot(1:sz(1), actual(:,3), "o")
    plot(1:sz(1), differences(:,3))  
end

