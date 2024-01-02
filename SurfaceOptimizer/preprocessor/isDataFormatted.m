%%%%%%%%%%%%%%%%%
% Check and verify that data is correctly formatted
% for the rest of the program. 
%%%%%%%%%%%%%%%%%
function res = isDataFormatted(data)
    res = 1;
    if(numel(data.phase)~=numel(data.R))
        res = 0;
    end
end