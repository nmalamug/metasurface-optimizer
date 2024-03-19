function visVariance(data,slice)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %data = unwrapPhaseNormalized(data.phase,2);
    %data = data{1};
    data = data.phase;
    %myphase = mean(data.phase(:,21,:),2);
    myphase = data(:,slice,:);
    myphase = var(myphase,0,3);

    figure
    hold on
    grid on
    grid minor
    plot(150:10:550, myphase, "*")
    %plot(150:10:550, min(data.R(:,slice,:),[],3))
    title("x vs variance at y=550")
    xlabel("x")
    ylabel("Inter-phase variance")

end

