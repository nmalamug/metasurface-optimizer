function visVariance(data,slice)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    data = preprocess(data);
    data = data{1};
    %myphase = mean(data.phase(:,21,:),2);
    myphase = data.phase(:,slice,:);
    myphase = var(myphase,0,3);

    figure
    hold on
    grid on
    grid minor
    plot(150:10:550, myphase, "*")
    plot(150:10:550, min(data.R(:,slice,:),[],3))

end

