theta = 1;
plotX = [];
x = [-10:0.5:+10];
[plotX] = givenFun(theta,x);
plot(x,plotX);
xlabel('x - values');
ylabel('p(x|\theta)');
hold on;

x = [0:0.5:+10];
theta = size(x,2)/sum(x);
plotX = [];
[plotX] = givenFun(theta,x);
plot(x,plotX);


x = 2;
theta = [0:0.5:5];
plotX = [];
[plotX] = givenFun(theta,x);
figure;
plot(theta,plotX);
xlabel('\theta');
ylabel('p(x|\theta)');
hold on;


% x = [0:0.5:10];
% x = sum(x);
% theta = [];
% theta = [theta,size(x,2)/sum(x)];
% theta = [theta,0:0.5:5];
% plotX = [];
% figure;
% [plotX] = givenFun(theta,x);
% plot(theta,plotX);
% hold on;


%theta = 1;
