%{
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
%}
xinterp = 332.5:5:452.5;
yinterp = linspace(150,550,21);
zinterp = 1:5;
zparam = 1:2:5;
numOutputs = 3; % Or however many outputs you expect
outputs = cell(1, numOutputs);
gridvectors = cell(1, numOutputs);

in1 = {xinterp, yinterp, zinterp};
[outputs{:}] = ndgrid(in1{:});

in2 = {data.params{1},data.params{2},zparam};
[gridvectors{:}] = ndgrid(in2{:});


interpData = interpn(gridvectors{:},data.phase,outputs{:});




%{
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
%}