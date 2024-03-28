%TODO for 1.3
%Add a function for getting unit cells out of data interpolations
%Improve the visualization functions and make them generalize better. 

%Put together design parameters and build a surface. 
preprocessedData = preprocess(crossw100);
preprocessedData = preprocessedData{1};
designParams.lambdas = preprocessedData.wavelengths;
designParams.minR = .6;
designParams.nspp = 1.05;
designParams.theta = 30;
designParams.P = 600e-9;
designParams.minSurfaceLength = 25; %Each next surface will be 1 longer
designParams.numSurfaces = 4;

%0 - Best first unit cell optimizer
%1 - Sweep PD space
designParams.optimizer = 0; 

%Start preprocessing the data. Make sure to put in the design params first,
%then put in your unit cell designs
%unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300);%, dataDS);
unitCellTable = preprocessAll(designParams, crossw150);
surface = createSurfaces(unitCellTable, designParams);

save 30degCross.mat surface
