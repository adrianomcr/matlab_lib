




%function y = average_circular_filter(x,n)
%
%Input:
%x: vector with the signal to be filtered, each line is a signal
%n: number of elements to compute the average
%
%Output:
%y: filtered vector
%
%Observation:
%It is assumed that the vector x is a closed path, that is: x(:,1) == x(:,end)


function y = average_circular_filter(x,n)


    if( norm(x(:,1)-x(:,end)) > 1e-8 )
        error('first and last value of the vector are not equal')
    end
    
    x(:,end) = [];

    if (n > length(x(1,:)))
        error('Value of is bigger than the number of elements on the vector')
    end
    
    m = length(x);
    y = x;
    x = [x,x,x];
    
    sM = ceil(n/2);
    sm = n-sM;
    
    
    for k = 1:1:m
        y(:,k) = mean(x(:,m+((k-sm):1:(k+sM)))')';
    end
    y(:,end+1) = y(:,1);
%     for k = n:1:length(x(1,:))
%         y(:,k) = mean(x(:,k-n+1:k)')';
%     end
    


   


    
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

