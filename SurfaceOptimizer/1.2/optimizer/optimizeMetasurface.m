%%%%%%%%%%%%%%%%%
% Code to create the optimal metasurface. 
% params.N - number of cells
% params.lambdas - wavelengths taken
% params.minR - minimum R threshold for designs
% params.nspp - value for constant nspp
% params.theta - value for incident angle of light
% params.P - Value for size of unit cell
%%%%%%%%%%%%%%%%%
function bestDesign = optimizeMetasurface(unitCellTable,params,n)
    fprintf("Working on cell design, n=%d \n", n);

    %Start by defining the linear regressions.
    numlambda = size(params.lambdas);
    
    %Each cell entry contains {slope, intercept}
    slopes = cell(numlambda(1),1);

    %Create a phase table to make references faster - Cache locality
    %optimization
    phaseTable = getPhaseTable(unitCellTable);

    for i=1:numlambda(1)
        slopes{i}(1) = (2*pi*params.P/params.lambdas(i))*(params.nspp - sin(deg2rad(params.theta)));
        slopes{i}(2) = 0;
    end
    bestDesign.totalRMS = Inf;
    for i = 1:numel(unitCellTable)
        for j = 1:numlambda(1)
            %Update intercepts for each value of lambda
            slopes{j}(2) = phaseTable(i,j);
        end
        currDesign.cells(1,:) = phaseTable(i,:);
        currDesign.refs(1) = i;
        % Set second of slopes
        for j=1:numlambda(1)
            slopes{j}(2) = phaseTable(i,j);
        end

        for j = 2:n
            %Start with j-1 for slopes because slope equation indexes from
            %0.
            [currDesign.cells(j,:), currDesign.refs(j)] = grabNextBest(phaseTable, j-1, slopes);

        end
        currDesign.RMS = getDesignRMS(currDesign.cells, slopes);
        currDesign.totalRMS = prod(currDesign.RMS);
        if(currDesign.totalRMS < bestDesign.totalRMS)
            bestDesign = currDesign;
            bestDesign.slopes = slopes;
        end
    end
    %Assemble surface design from references. 
    for i=1:numel(bestDesign.refs)
        bestDesign.surface(i) = unitCellTable(bestDesign.refs(i));
    end

    bestDesign = rmfield(bestDesign, 'cells');
    bestDesign = rmfield(bestDesign, 'refs');
    bestDesign.cells = bestDesign.surface;
    bestDesign = rmfield(bestDesign, 'surface');   
end

