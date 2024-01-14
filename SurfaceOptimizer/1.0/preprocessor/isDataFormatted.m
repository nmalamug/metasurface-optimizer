%%%%%%%%%%%%%%%%%
% Check and verify that data is correctly formatted
% for the rest of the program. 
% Compare dimensionality of parameters  with R and phase
% Compare dimensionality of lambda with last dimension.
%%%%%%%%%%%%%%%%%
function res = isDataFormatted(data)
    res = 1;
    if(numel(data.phase)~=numel(data.R))
        res = 0;
    end
end