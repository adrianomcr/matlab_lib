
%function [t,y] = async_diff(ta,xa,tb,xb)
%
%Description:
%This function performs the difference (xa-xb) of two vectors that are not
%synchronized on time
%
%Input:
%ta: time vector associated to vector xa
%xa: first data vector
%ta: time vector associated to vector xb
%xa: second data vector
%
%Output:
%t: output time vector
%y: output data vector

function [t,y] = async_diff(ta,xa,tb,xb)

% ta = 0:0.001:4*pi;
% xa = sin(ta);
% tb = 0:0.00234567:4*pi;
% xb = sin(tb+0.3);


    ma = mean(diff(ta));
    mb = mean(diff(tb));

    if(ma>mb)
        t1 = ta;
        x1 = xa;
        t2 = tb;
        x2 = xb;
        sig = 1;
    else
        t1 = tb;
        x1 = xb;
        t2 = ta;
        x2 = xa;
        sig = -1;
    end


    y = [];
    for k = 1:1:length(t1)
        [~,t_colse] = min(abs(t1(k)-t2));
    %     disp(t_colse)
        y(:,k) = x1(:,k)-x2(:,t_colse);
%         x1(:,k)-x2(:,t_colse)


    end
    t = t1;
    y = y*sig;
%     y

%     figure(55)
%     plot(t1,x1,'r')
%     hold on
%     plot(t2,x2,'b')
% 
%     plot(t,y,'g')
%     hold off






end

