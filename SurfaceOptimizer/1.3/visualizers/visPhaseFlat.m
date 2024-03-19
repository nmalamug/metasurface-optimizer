function visPhaseFlat(data, section)
%VISPHASEFLAT Summary of this function goes here
%   Detailed explanation goes here
    %data.phase  = unwrapPhaseNormalized(data.phase, max(size(data.params)));
    %data = data{1};
    myphase = mean(data.phase(:,section,:),2);
    %myR = mean(data.R(:,10,:),2);
    figure
    hold on
    grid on
    grid minor
    title('X length vs phase')
    plot(150:10:550, myphase(:,1), "*", 'Color',"red")
   
    plot(150:10:550, myphase(:,2), "*", 'Color',"green")

    xlabel("X Length")
    ylabel("Phase")
    plot(150:10:550, myphase(:,3), "*", 'Color',"blue")
    legend('1510nm', '1575nm', '1640nm')
    ylim([0,2*pi])
    
end

