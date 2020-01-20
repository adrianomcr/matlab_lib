




%function y = average_filter(x,n)
%
%Input:
%x: vector with the signal to be filtered, each line is a signal
%n: number of elements to compute the average
%
%Output:
%y: filtered vector
%

function y = average_filter(x,n)


    if (n > length(x(1,:)))
        error('Value of is bigger than the number of elements on the vector')
    end
    
    y = x;
    for k = 2:1:n-1
        y(:,k) = mean(x(:,1:k)')';
    end
    for k = n:1:length(x(1,:))
        y(:,k) = mean(x(:,k-n+1:k)')';
    end
    


   


    
end

% t = 0:pi/10000:6*pi;
% x = [sin(t);cos(t)]+randn(2,length(t))/2;
% y = average_filter(x,1500);
% figure(1)
% plot(x(1,:),'r')
% hold on
% plot(x(2,:),'g')
% plot(y(1,:),'b--')
% plot(y(2,:),'k--')
% hold off

