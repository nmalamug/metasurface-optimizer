%%%%%%%%%%
% Function to visualize the unit cell library as discussed in Shrestha et
% al.
% X axis is the middle unit cell phase - not exactly the average, but close.  
% Y axis is the slope of (high-low phase)/(high-low frequency)
% TODO:
% Account for more than 3 phases
% Take out low R values
%%%%%%%%%%
function visUnitLibrary(slopes, varargin)
    dispersion = cell(max(length(varargin),3),1);
    for i=1:(max(length(varargin),3)/3)
        varargin{i*3-2}.phase = unwrapNoMod(varargin{i*3-2}.phase);
        rmin = min(varargin{i*3-2}.R,[],3);
        for j=1:numel(rmin)
            if(rmin(j)<0.6)
                rmin(j) = 0;
            else
                rmin(j) = 1;
            end
        end
        sz = size(varargin{i*3-2}.phase);
        for j=1:sz(end)
            varargin{i*3-2}.phase(:,:,j) = varargin{i*3-2}.phase(:,:,j).*rmin;
        end
        absDispersion = varargin{i*3-2}.phase(:,:,1) - varargin{i*3-2}.phase(:,:,end);
        dispersion{i} = absDispersion;%/fdiff;
    end
    
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
    

    figure
    hold on
    if(length(varargin) == 1)    
        plot(varargin{i*3-2}.phase(:,:,end), dispersion{1}, '+', 'Color', 'b')
    else
        for i=1:(max(length(varargin),3)/3)
            plot(varargin{i*3-2}.phase(:,:,end), dispersion{i}, varargin{i*3-1}, 'Color', varargin{i*3})
        end
    end
    plot(desiredPhase, desiredDispersion, 'o', 'Color','m')
    %plot(desiredPhase, desiredDispersion, 'o', 'Color', 'r')
    title("Phase Dispersion Plot")
    xlabel("Phase at highest wavelength")
    ylabel("Absolute Distance")
    hold off
end

