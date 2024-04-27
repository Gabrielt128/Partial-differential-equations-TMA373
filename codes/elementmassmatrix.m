function Me=elementmassmatrix(t)
    Me = abs(det([t(3,:)-t(1,:);t(2,:)-t(1,:)])) * (ones(3,3)+diag([1,1,1])) * 1/24;
end