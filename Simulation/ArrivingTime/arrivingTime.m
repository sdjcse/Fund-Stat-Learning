a = randi([0,59],1000,1);
b = randi([0,59],1000,1);

plus = abs(a-b);

plusPlot = find(plus<=30);
dotPlot = find(plus>30);


plot(a(plusPlot,1),'k+','LineWidth',2,'MarkerSize',7);
hold on;
%print -dpng "arrivingTIme.png"
plot(a(plusPlot,0),'ko','MarkerFaceColor','yellow','MarkerSize',7);

%print -dpng "arrivingTIme.png"
