%%%%%%%%%%%%%%%%%
%Start putting data into a more tabular format. 
%Make it easy to write optimization code. 
%struct table
%table(x).params - an array, length = # of parametrs. Contains values for each
%   parameter. Ex: xLength = 150, yLength = 120 - table(1).params = [150 120]
%table(x).Erefl - An array, length = # of wavelengths.
%table(x).phase - An array, length = # of wavelengths.
%table(x).lambda - An array, containing all the wavelengths used. 
%%%%%%%%%%%%%%%%%
function tableout = surfaceTabulate(data)
dims = size(data.phase);
div = cumprod(dims);
div = [1, div];

%Index refers to 
index = cell(1,numel(dims));
index(:) = {0};
numParams = size(data.params);
numParams = numParams(1);
fprintf("Pulling unit cell designs into table\n")

%Loops over all objects
%FIXME - numel/dims(end) doesn't generalize to n eval. parameters. 
for i = 1:(numel(data.phase)/dims(end))
    for j = 1:numel(dims)
        index{j} = mod(floor((i-1)/div(j)),dims(j))+1;
    end
    %Do operations on the thing. 
    
    %Instantiate unit cell design, put in parameter values.
    for j = 1:numParams
        unitCell(i).paramNum(j) = index{j};
        unitCell(i).params(j) = data.params{j}(index{j});
    end

    %Put R and phase values in unit cell design
    for j = 1:dims(end)
        unitCell(i).phase(j) = data.phase(i+(j-1)*(numel(data.phase)/dims(end)));
        unitCell(i).R(j) = data.R(i+(j-1)*(numel(data.phase)/dims(end)));
    end
    
    %Categorize the unit cell
    unitCell(i).cellType = data.cellType;
end

tableout = unitCell;
end

