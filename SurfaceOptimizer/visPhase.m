function visPhase(data)
%VISPHASE Summary of this function goes here
%   Detailed explanation goes here
    myphase = mean(data.phase(:,2,:),2);
    myR = mean(data.R(:,2,:),2);
    figure
    hold on
    grid on
    grid minor
    title('Phase and R 1510nm')
    plot(150:10:550, myphase(:,1)/(2*pi), "*")
    plot(150:10:550, myR(:,1))
    legend('Phase/(2pi)', 'R')
   
    figure
    hold on
    grid on
    grid minor
    title('Phase and R 1575nm')
    plot(150:10:550, myphase(:,2)/(2*pi), "*")
    plot(150:10:550, myR(:,2))
    legend('Phase/(2pi)', 'R')

    figure
    hold on
    grid on
    grid minor
    xlabel("X Length")
    title('Phase and R 1640nm')
    plot(150:10:550, myphase(:,3)/(2*pi), "*")
    plot(150:10:550, myR(:,3))
    yline(.765)
    yline(.3489)
    legend('Phase/(2pi)', 'R')
end

