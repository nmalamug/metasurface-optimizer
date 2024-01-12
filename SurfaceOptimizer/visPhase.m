function visPhase(data)
%VISPHASE Summary of this function goes here
%   Detailed explanation goes here
    
    phases = data.phase;
    R = data.R;
    x = data.params{1};
    x = transpose(x);
    y = data.params{2};
    xUse = repmat(x,numel(y),1);
    yUse = repmat(y,1,numel(x));
    xUse = transpose(xUse);
    yUse = transpose(yUse);

    for i=1:3
        figure
        h = pcolor(xUse,yUse,phases(:,:,i));
        %shading interp
        set(h,'EdgeColor','none','linestyle','none');
        colorbar
        xlabel('X')
        ylabel('Y')
        colormap(jet(256));
        str = ['Phase at ', num2str(1445+65*i), ' nm'];
        title(str);
    
        figure
        h = pcolor(xUse,yUse,R(:,:,i));
        set(h,'EdgeColor','none','linestyle','none');
        colorbar
        xlabel('X')
        ylabel('Y')
        colormap(jet(256));
        str = ['R at ', num2str(1445+65*i), ' nm'];
        title(str);
    end

    %{
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
    %}
end

