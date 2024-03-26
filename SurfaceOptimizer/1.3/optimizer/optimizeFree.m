function bestDesign = optimizeFree(unitCellTable,params,n)
%OPTIMIZEFREE Summary of this function goes here
%   Detailed explanation goes here
    fprintf("Working on cell design, n=%d \n", n);

    %Start by defining the linear regressions.
    numlambda = size(params.lambdas);
    
    %Each cell entry contains {slope, intercept}
    slopes = cell(numlambda(1),1);

    %Create a phase table to make references faster - Cache locality
    %optimization
    phaseTable = gpuArray(getPhaseTable(unitCellTable));

    %%%%%%% Get things going here
    %Loop over phase dispersion space and try designs
    %Take the starting phase dispersion of the best design and look around
    %there.
    %Set desired slopes for surface
    for i=1:numlambda(1)
        slopes{i}(1) = (2*pi*params.P/params.lambdas(i))*(params.nspp - sin(deg2rad(params.theta)));
        slopes{i}(2) = 0;
    end
    bestDesign.totalRMS = Inf;
    for phase = linspace(0,2*pi,30)
        for dispersion = linspace(0,pi,30)
            for k=1:numlambda(1)
                slopes{k}(2) = phase - (dispersion*k/numlambda(1));
            end
            for k=1:n
                [currDesign.cells(k,:), currDesign.refs(k)] = grabNextBest(phaseTable, k-1, slopes);
            end
            currDesign.RMS = getDesignRMS(currDesign.cells, slopes);
            currDesign.totalRMS = prod(currDesign.RMS);
            if(currDesign.totalRMS < bestDesign.totalRMS)
                bestDesign = currDesign;
                bestDesign.slopes = slopes;
            end
        end
    end
    %Assemble surface design from references. 
    for i=1:numel(bestDesign.refs)
        bestDesign.surface(i) = unitCellTable(bestDesign.refs(i));
    end
    bestDesign = rmfield(bestDesign, 'cells');
    bestDesign = rmfield(bestDesign, 'refs');
    bestDesign.cells = bestDesign.surface;
    bestDesign.RMS = gather(bestDesign.RMS);
    bestDesign.totalRMS = gather(bestDesign.totalRMS);
    bestDesign = rmfield(bestDesign, 'surface');   
end

