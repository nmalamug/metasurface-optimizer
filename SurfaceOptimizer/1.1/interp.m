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