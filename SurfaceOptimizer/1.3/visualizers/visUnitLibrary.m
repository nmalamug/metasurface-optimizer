%%%%%%%%%%
% Function to visualize the unit cell library as discussed in Shrestha et
% al.
% X axis is the middle unit cell phase - not exactly the average, but close.  
% Y axis is the slope of (high-low phase)/(high-low frequency)
% TODO:
% Account for more than 3 phases
% Take out low R values
%%%%%%%%%%
function visUnitLibrary(varargin)
% 1. Surface tabulate on all the data
% 2. Get cell tables
% 3. Get phases and dispersion from cell tables, and plot those. 

    dispersion = cell(max(length(varargin),3),1);
    phase = cell(max(length(varargin),3),1);
    for i=1:(max(length(varargin),3)/3)
        varargin{i*3-2}.phase = unwrapPhase(varargin{i*3-2}.phase);
        temp = surfaceTabulate(varargin{i*3-2});
        temp = removeLowR(temp, .6);
        temp = getPhaseTable(temp);
        phase{i} = temp(:,3);
        for j=1:numel(phase{i})
            if(phase{i}(j) > pi)
                phase{i}(j) = phase{i}(j)-(2*pi);
            end
        end
        %This approach works great for the low dispersions we have now.
        %Once dispersions go over 2pi things will get complicated
        dispersion{i} = getPhaseDistance(temp(:,1),temp(:,2)) + getPhaseDistance(temp(:,2),temp(:,3));
    end
    %{
    for i = 1:length(slopes)
        if(slopes{i}(2) > pi)
            %slopes{i}(2) = slopes{i}(2) - 2*pi;
        end
    end

    for i = 1:30
        desiredPhase(i) = slopes{3}(1)*(i-1) + slopes{3}(2);
        while(desiredPhase(i) > pi)
            desiredPhase(i) = desiredPhase(i) - 2*pi;
        end
        desiredDispersion(i) = slopes{1}(1)*(i-1)+slopes{1}(2) - (slopes{3}(1)*(i-1)+slopes{3}(2));
    end
    %}

    figure
    hold on
    if(length(varargin) == 1)    
        plot(phase{1}, dispersion{1}, '+', 'Color', 'b')
    else
        for i=1:(max(length(varargin),3)/3)
            plot(phase{i}, dispersion{i}, varargin{i*3-1}, 'Color', varargin{i*3})
        end
    end
    %plot(desiredPhase, desiredDispersion, 'o', 'Color', 'r')
    title("Phase Dispersion Plot")
    xlabel("Phase at middle wavelength")
    ylabel("Absolute Distance")
    hold off
end
