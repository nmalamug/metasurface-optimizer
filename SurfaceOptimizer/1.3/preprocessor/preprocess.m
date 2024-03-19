%%%%%%%%%%%%%%%%%
%Assert that data is correctly formatted.
%Unroll the phases of the phase data in the set. 
%Start pulling raw data into an array of structs.
%%%%%%%%%%%%%%%%%
function dataout = preprocess(data)
    assert(isDataFormatted(data) == 1, "Data is incorrectly formatted");
    %Start the record of changes to data
    newdata(1) = data;
    
    %Fix the phase of the data
    numParams = size(data.params);
    newdata.phase = unwrapPhase(data.phase);

    %Start pulling data into the array of structures.
    elements = surfaceTabulate(newdata);
    elements = removeLowR(elements, .6);
    dataout = {newdata, elements};
end



