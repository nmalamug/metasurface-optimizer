function visVariance(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    data = preprocess(data);
    data = data{1};
    myphase = mean(data.phase(:,2,:),2);
    myphase = var(myphase,0,3);

    figure
    hold on
    grid on
    grid minor
    plot(150:10:550, myphase, "*")

end

