
%This script is an example of how to plot a vector field
%The exemple considers a demonstrative pendulum example

clear all
close all

%Function of the vector field
f = @(p) [p(2); -sin(p(1))-p(2)];

ws = [-6 6 -2 2];



%% Sample field
dx = 0.1;
dy = 0.1;
xv = ws(1):dx:ws(2);
yv = ws(3):dy:ws(4);

[X, Y] = meshgrid(xv,yv);
F = 0*X;

for i = 1:1:length(xv)
    x = xv(i);
    for j = 1:1:length(yv)
        y = yv(j);
        
        F = f([x;y]);
        Fx(j,i) = F(1);
        Fy(j,i) = F(2);
        
    end
end

% Plot field
figure(1)
quiver(X,Y,Fx,Fy,'b','LineWidth',1,'MaxHeadSize',0.8,'AutoScale','on')
axis equal
axis(ws)


%% Integral line
[x,y,b] = ginput(1); %click on image to define an initial condition (right click to cancel)
while (b==1)
    sim = [x ;y];
    dt = 0.01;
    T = 10;
    t = 0:dt:T;
    %Simulate trajectory
    for k = 1:1:(length(t)-1)

        F = f(sim(:,k));

        sim(:,k+1) = sim(:,k) + F*dt;
    end

    % Plot integral line
    hold on
    h = plot(sim(1,1),sim(2,1),'ro','LineWidth',2,'MarkerSize',5);
    plot(sim(1,end),sim(2,end),'r*','LineWidth',2,'MarkerSize',10)
    plot(sim(1,:),sim(2,:),'r','LineWidth',2)
    hold off
    [x,y,b] = ginput(1); %click on image to define an initial condition (right click to cancel)
end

