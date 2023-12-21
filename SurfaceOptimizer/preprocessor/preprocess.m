%Assert that data is correctly formatted.
%Unroll the phases of the phase data in the set. 
%Start pulling raw data into an array of structs.

%%%%%%%%%%%%%%%%%
% Make the table
%%%%%%%%%%%%%%%%%
function preprocess(data)
    assert(isDataFormatted == 1, "Data is incorrectly formatted");
    %Fix the phase of the data
    data.phase = unwrapPhase(data.phase);
    %Fix the 
end



