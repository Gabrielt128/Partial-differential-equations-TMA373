function Se=elementstiffmatrix(t)
    dx = t(3,:)-t(2,:);
    dy = t(1,:)-t(3,:);
    dz = t(2,:)-t(1,:);
    d=[-1, -1; 1, 0; 0, 1]*[-dy(1,2), dy(1,1); -dz(1,2), dz(1,1)];
    area = abs(det([dx;dy]))/2;
    Se = d*transpose(d)/(4*area);
end