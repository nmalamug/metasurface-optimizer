%%%%%%%%%%%%%%%%%
% Code to create the optimal metasurface. 
% params.N - number of cells
% params.lambdas - wavelengths taken
% params.minR - minimum R threshold for designs
% params.nspp - value for constant nspp
% params.theta - value for incident angle of light
% params.P - Value for size of unit cell
%%%%%%%%%%%%%%%%%
function bestDesign = optimizeMetasurface(unitCellTable,params)
    %Start by defining the linear regressions.
    numlambda = size(params.lambdas);
    
    %Each cell entry contains {slope, intercept}
    slopes = cell(numlambda(1),1);
    for i=1:numlambda(1)
        slopes{i}(1) = (2*pi*params.P/params.lambdas(i))*(params.nspp - sin(deg2rad(params.theta)));
        slopes{i}(2) = 0;
    end
    %{
    for i = 1:params.N
        bestDesign(i).totalRMS = Inf;
    end
    %}
    bestDesign.totalRMS = Inf;
    for i = 1:numel(unitCellTable)
        for j = 1:numlambda(1)
            %Update intercepts for each value of lambda
            slopes{j}(2) = unitCellTable(i).phase(j);
        end
        currDesign.cells(1) = unitCellTable(i);
        % Set second of slopes
        for j=1:numlambda(1)
            slopes{j}(2) = unitCellTable(i).phase(j);
        end

        for j = 2:params.N
            %Start with j-1 for slopes because slope equation indexes from
            %0.
            currDesign.cells(j) = grabNextBest(unitCellTable, j-1, slopes);
        end
        currDesign.RMS = getDesignRMS(currDesign.cells, slopes);
        currDesign.totalRMS = prod(currDesign.RMS);
        if(currDesign.totalRMS<bestDesign(i).totalRMS)
            bestDesign = currDesign;
            bestDesign.slopes = slopes;
        end
    end
    %Function for distance of point from a line. 
end

