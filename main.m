g=inline('100*( x ==0.5 & 0.1 <=y & 0.2 >=y)','x','y');
w=2*pi*2.45*1e9;
[N,T,P]=mygrid(3,w);
% figure()
% plotmygrid(N,T,P);
% g = @(x,y) x+y;
% w = 0
% [N,T,P]=mygrid(0,w);
% figure()
% plotmygrid(N,T,P);

for i=1:3
    [N,T,P]=gridrefine(N,T,P);
end
figure()
plotmygrid(N,T,P);

[u,k,m]=fem(N,T,P,w,g);

figure()
PlotSolutionHelmholtz(u,N,T);
