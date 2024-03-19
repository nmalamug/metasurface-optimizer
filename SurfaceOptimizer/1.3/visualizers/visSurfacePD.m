%%%%%%%%%%
% Function to visualize the unit cell library as discussed in Shrestha et
% al.
% X axis is the middle unit cell phase - not exactly the average, but close.  
% Y axis is the slope of (high-low phase)/(high-low frequency)
% LIMITATIONS:
% Only accounts for 1 evaluation paramater, at the END. 
% 
%%%%%%%%%%
function visSurfacePD(surface)    
    temp = getPhaseTable(surface.cells);
    phase = temp(:,2);
    for j=1:numel(phase)
        if(phase(j) > pi)
            phase(j) = phase(j)-(2*pi);
        end
    end
    %This approach works great for the low dispersions we have now.
    %Once dispersions go over 2pi things will get complicated
    dispersion = getPhaseDistance(temp(:,1),temp(:,2)) + getPhaseDistance(temp(:,2),temp(:,3));


    for i = 1:length(temp)
        desiredPhase(i) = surface.slopes{2}(1)*(i-1) + surface.slopes{2}(2);
        while(desiredPhase(i) > pi)
            desiredPhase(i) = desiredPhase(i) - 2*pi;
        end
        desiredDispersion(i) = surface.slopes{1}(1)*(i-1)+surface.slopes{1}(2) - (surface.slopes{3}(1)*(i-1)+surface.slopes{3}(2));
    end
    

    figure
    hold on
    plot(phase, dispersion, '+', 'Color', 'b');
    plot(desiredPhase, desiredDispersion, 'o', 'Color','m')
    %plot(desiredPhase, desiredDispersion, 'o', 'Color', 'r')
    title("Phase Dispersion Plot")
    xlabel("Phase at middle wavelength")
    ylabel("Absolute Distance")
    hold off
end
