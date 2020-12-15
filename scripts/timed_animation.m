

%This script is an example of how to make an animation syncronized on time
%The exemple considers a demonstrative pendulum example

clear all
close all


SPEED = 1; % speed factor of the animation (sim_time/real_time)


dt = 0.001; %step time
T = 10; %duration of simulation

L = 0.5; %length of the pendulun
g = 9.81; %gravity

a = 0.5; %amplitude (rad)
w = sqrt(g/L); %frequency (rad/s)

t = 0:dt:T; %vector of time

theta = a*cos(w*t)+3*pi/2; %angular position of the pendulum

%Animation initialization
figure(1)
p = L*[cos(theta(1)); sin(theta(1))];
d = L/10;
ball = d*[cos(0:pi/20:2*pi); sin(0:pi/20:2*pi)];
plot(0,0,'k.','MarkerSize',20)
hold on
h1 = fill(p(1)+ball(1,:),p(2)+ball(2,:),'b','LineStyle','none'); %plot the pendulum mass
h2 = fill([0 p(1)],[0 p(2)],'k','LineWidth',2); %Plot the pendulum rope
hold off
axis equal
ws = [-L-2*d, L+2*d, -L-2*d, L/2];
axis(ws)
grid on
h3 = text(ws(2)+(ws(2)-ws(1))/20,ws(4),sprintf('sim time:  %.2f\nreal time:  %.2f\n',0,0)); %show time
set(1,'Position',[397 201 872 420])

%Animation loop
tic
k = find(t>=SPEED*toc,1);
while(k<=length(t))
    
    %Compute the position of the pendulum at time t(k)
    p = L*[cos(theta(k)); sin(theta(k))];
    
    set(h1,'XData',p(1)+ball(1,:),'YData',p(2)+ball(2,:))
    set(h2,'XData',[0 p(1)],'YData',[0 p(2)])
    h3.String = sprintf('sim time:  %.2f\nreal time:  %.2f\n',t(k),toc);
    
    %Find the next k such that the SPEED factor is respected
    k = find(t>=SPEED*toc,1);
    drawnow
end

    




