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
designParams.numSurfaces = 8;
designParams.phaseSweep = linspace(0,2*pi,30);
designParams.dispersionSweep = linspace(0,pi,30);
%Phase precision then dispersion precision
designParams.precision = [.1,.1];

%0 - Best first unit cell optimizer
%1 - Sweep PD space
designParams.optimizer = 1; 

%{

%Start preprocessing the data. Make sure to put in the design params first,
%then put in your unit cell designs
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
%unitCellTable = preprocessAll(designParams, crossw150);
surface = createSurfaces(unitCellTable, designParams);

for i = 1:8
    num = 24+i;
    mystring = "mats4-16/30degMatL" + num;
    saveSurfaceMatrix(surface(i), mystring);
end

save 30degLengthSwept.mat surface

%}

designParams.numSurfaces = 4;

designParams.minR = .3;
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
surface = createSurfaces(unitCellTable, designParams);
mystring = "mats4-16/30degMatR3";
saveSurfaceMatrix(surface(1), mystring);
save 30degR3.mat surface

designParams.minR = .4;
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
surface = createSurfaces(unitCellTable, designParams);
mystring = "mats4-16/30degMatR4";
saveSurfaceMatrix(surface(1), mystring);
save 30degR4.mat surface

designParams.minR = .5;
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
surface = createSurfaces(unitCellTable, designParams);
mystring = "mats4-16/30degMatR5";
saveSurfaceMatrix(surface(1), mystring);
save 30degR5.mat surface

designParams.minR = .7;
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
surface = createSurfaces(unitCellTable, designParams);
mystring = "mats4-16/30degMatR7";
saveSurfaceMatrix(surface(1), mystring);
save 30degR7.mat surface

designParams.minR = .8;
unitCellTable = preprocessAll(designParams, dataSIS, crossw150, crossw100, crossw200, crossw250, crossw300, dataDS);%,genSym);
surface = createSurfaces(unitCellTable, designParams);
mystring = "mats4-16/30degMatR8";
saveSurfaceMatrix(surface(1), mystring);
save 30degR8.mat surface
