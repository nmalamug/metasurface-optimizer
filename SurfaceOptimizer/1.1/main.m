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
data.phase = unwrapPhase(data.phase,2);

xinterp = 332.5:5:452.5;
yinterp = linspace(150,550,21)';
for i=1:3
    interpData.phase(:,:,i) = interp2(data.xLength, data.yLength, data.phase(:,:,i)',xinterp,yinterp);
    interpData.R(:,:,i) = interp2(data.xLength, data.yLength, data.R(:,:,i)',xinterp,yinterp);
    
end
interpData.params = cell(2,1);
interpData.params{1} = xinterp;
interpData.params{2} = yinterp';
interpData.wavelengths = data.wavelengths;
preInterp = preprocess(interpData);

unitCellDesigns = preprocess(data);


%Generate optimal unit cell design. 
preprocessedData = unitCellDesigns{1};
unitCellTable = unitCellDesigns{2};

unitCellTable = [unitCellTable;preInterp{2}];
%{
predata1 = preprocess(data1);
unitCellTable = [unitCellTable;predata1{2}];
%}

%Put together design parameters and build a surface. 
designParams.lambdas = preprocessedData.wavelengths;
%designParams.N =    26;
designParams.minR = .6;
designParams.nspp = 1.05;
designParams.theta = 0;
designParams.P = 600e-9;

tic
%surface = optimizeMetasurface(unitCellTable, designParams);

numSurfaces = 4;
surface = cell(1, numSurfaces); % Pre-allocate for 5 elements
minSurfaceLength = 27;
parfor i = 1:numSurfaces
    tempSurface = optimizeMetasurface(unitCellTable, designParams, minSurfaceLength+i-1);
    surface{i} = tempSurface; % Assign to unique index
end
surface = [surface{:}];
toc
%45 seconds for 5 surfaces
%28 seconds for 4 surfaces
save surface15degconcat.mat surface