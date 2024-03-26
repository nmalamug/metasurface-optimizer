%%%%%%%%%%%%%%%%%
%Assert that data is correctly formatted.
%Unroll the phases of the phase data in the set. 
%Start pulling raw data into an array of structs.
%%%%%%%%%%%%%%%%%
function dataout = preprocess(data, minR)
    assert(isDataFormatted(data) == 1, "Data is incorrectly formatted");
    %Start the record of changes to data
    newdata(1) = data;
    
    %Fix the phase of the data
    numParams = size(data.params);
    newdata.phase = unwrapPhase(data.phase);

    %Start pulling data into the array of structures.
    elements = surfaceTabulate(newdata);
    switch nargin
        case 1
            elements = removeLowR(elements, .6);
        case 2
            elements = removeLowR(elements, minR);
    end
    dataout = {newdata, elements};
end



