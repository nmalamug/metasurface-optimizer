%Add the directeries holding functions to path. 
%Having individual files for each major function makes things easier to
%test. 
dirCurr = pwd;
dirToAdd = strcat(dirCurr, '/preprocessor');
addpath(dirToAdd,'-end');
dirToAdd = strcat(dirCurr, '/optimizer');
addpath(dirToAdd,'-end');
dirToAdd = strcat(dirCurr, '/visualizers');
addpath(dirToAdd,'-end');
%Start preprocessing the data.
unitCellDesigns = preprocess(data);

%Generate optimal unit cell design. 
preprocessedData = unitCellDesigns{1};
unitCellTable = unitCellDesigns{2};

%Put together design parameters and build a surface. 
designParams.lambdas = preprocessedData.wavelengths;
designParams.N =    26;
designParams.minR = .6;
designParams.nspp = 1.05;
designParams.theta = 0;
designParams.P = 600e-9;
surface = optimizeMetasurface(unitCellTable, designParams);

for i=27:30
    designParams.N = i;
    surface = [surface,optimizeMetasurface(unitCellTable, designParams)];
end

save surface0degW150.mat surface