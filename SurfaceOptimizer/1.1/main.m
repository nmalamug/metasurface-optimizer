%TODO
%Add a function for getting unit cells out of data interpolations
%Add a function for getting a list of unit cells from multiple raw data
%Add a function to concatentate unit cell designs
%Add a function to unwrap AND normalize
%Add a handler that determines whether cells should be designed in parallel
%Improve the visualization functions and make them generalize better. 
%Create different evaluation functions, which can be toggled with a
%parameter
%Make the minR parameter do something

%Add the directeries holding functions to path. 
%Having individual files for each major function makes things easier to
%test. 
%{
dirCurr = pwd;
dirToAdd = strcat(dirCurr, '/preprocessor');
addpath(dirToAdd,'-end');
dirToAdd = strcat(dirCurr, '/optimizer');
addpath(dirToAdd,'-end');
dirToAdd = strcat(dirCurr, '/visualizers');
addpath(dirToAdd,'-end');
%}
%Start preprocessing the data.
unitCellDesigns = preprocess(data);
preprocessedData = unitCellDesigns{1};
unitCellTable = unitCellDesigns{2}; 


xinterp = 332.5:5:452.5;
yinterp = linspace(150,550,21);
[Xq, Yq] = meshgrid(yinterp,xinterp);
[X,Y] = meshgrid(data.params{2},data.params{1});
for i=1:3
    interpData.phase(:,:,i) = interp2(X, Y, data.phase(:,:,i),Xq,Yq);
    interpData.R(:,:,i) = interp2(X, Y, data.R(:,:,i),Xq,Yq);
    
end
interpData.params = cell(2,1);
interpData.params{1} = xinterp;
interpData.params{2} = yinterp';
interpData.wavelengths = data.wavelengths;
preInterp = preprocess(interpData);



%Generate optimal unit cell design. 
preprocessedData = unitCellDesigns{1};
unitCellTable = unitCellDesigns{2};

unitCellTable = [unitCellTable;preInterp{2}];


%Put together design parameters and build a surface. 
designParams.lambdas = preprocessedData.wavelengths;
%designParams.N =    26;
designParams.minR = .6;
designParams.nspp = 1.05;
designParams.theta = 15;
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
save surface15degwx150wy150_interp.mat surface