function visSurface(surface)
%VISUALIZE Summary of this function goes here
%   Detailed explanation goes here
    %Generate the matrix of targets based on slope
    ideal = [];
    actual = [];
    R = [];
    for i=1:numel(surface.cells)
        actual = [actual; surface.cells(i).phase];
        R = [R; surface.cells(i).R];
        for j = 1:3
            ideal(i,j) = mod(surface.slopes{j}(1)*(i-1) + surface.slopes{j}(2), 2*pi);
        end
    end
    
    
    %Plot the targets based on slope matrix and surface props.         
    differences = zeros(size(ideal));
    for i = 1:numel(ideal)
       differences(i) = getPhaseDistance(ideal(i), actual(i));
    end
    
    sz = size(ideal);
    figure
    hold on
    plot(1:sz(1), R(:,1), "*")
    plot(1:sz(1), R(:,2), "o")
    plot(1:sz(1), R(:,3), "+")   
    title('R at Each Unit Cell')
    legend('1510nm', '1575nm', '1640nm')
    xlabel('Unit Cell')
    ylabel('R')
    ylim([0,1])


    figure
    hold on
    grid on
    grid minor
    plot(1:sz(1), ideal(:,1), "+")
    plot(1:sz(1), actual(:,1), "o")
    plot(1:sz(1), differences(:,1))   
    title('Phase at 1510nm')
    legend('ideal', 'actual', 'difference')
    xlabel('Unit Cell')
    ylabel('Phase')
    ylim([0,2*pi])

    figure
    hold on
    grid on
    grid minor
    plot(1:sz(1), ideal(:,2), "+")
    plot(1:sz(1), actual(:,2), "o")
    plot(1:sz(1), differences(:,2))   
    title('Phase at 1575nm')
    legend('ideal', 'actual', 'difference')
    xlabel('Unit Cell')
    ylabel('Phase')
    ylim([0,2*pi])

    figure
    hold on
    grid on
    grid minor
    plot(1:sz(1), ideal(:,3), "+")
    plot(1:sz(1), actual(:,3), "o")
    plot(1:sz(1), differences(:,3))  
    title('Phase at 1640nm')
    legend('ideal', 'actual', 'difference')
    xlabel('Unit Cell')
    ylabel('Phase')
    ylim([0,2*pi])
    
end

