function visSlopes(surface)
    ideal = [];
    for i=1:numel(surface.cells)
        for j = 1:3
            ideal(i,j) = mod(surface.slopes{j}(1)*(i-1) + surface.slopes{j}(2), 2*pi);
        end
    end
    figure 
    hold on
    grid on
    grid minor    
    xline(14.1)
    plot(1:numel(surface.cells), ideal(:,1), "+", "Color", "red", "LineWidth", 2)
    plot(1:numel(surface.cells), ideal(:,2), "+", "Color", "green","LineWidth", 2)
    plot(1:numel(surface.cells), ideal(:,3), "+", "Color", "blue","LineWidth", 2)
    ylim([0,2*pi])
    xlabel("Unit Cell")
    ylabel("Phase")
    title("Ideal phases")
end

