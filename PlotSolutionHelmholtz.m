function PlotSolutionHelmholtz(u,N,T)
% Plot solution u for the triangulation N,T
mesh([]);

for i=1:size(T,1)
    patch(N(T(i,1:3),1),N(T(i,1:3),2),u(T(i,1:3)),u(T(i,1:3)));
end
colorbar;
end