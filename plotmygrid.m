function plotmygrid(N,T,P)
    
    for i=1:size(T,1)
        if (abs(P(i)-8.85e-12.*pi*4e-7)<=1e-30) % if in the air
            patch(N(T(i,1:3),1),N(T(i,1:3),2),[1 1 0]);
        else % else in the chicken
            patch(N(T(i,1:3),1),N(T(i,1:3),2),[173 255 47]/256);
        end
        for j=1:3
        % draw the edge
            line([N(T(i,j),1),N(T(i,mod(j,3)+1),1)],[N(T(i,j),2),N(T(i,mod(j,3)+1),2)],'LineWidth',T(i,j+3)*3+1,'Color',[0.3 0.3 0.3])
        end
    end
    % writes the nbr for the nodes
    m=size(N,1);
    if m<100
        for i=1:m
            text(N(i,1)+.02,N(i,2)+.02,num2str(i));
        end
    end
    axis equal
end