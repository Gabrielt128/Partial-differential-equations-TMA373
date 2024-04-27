function [u,K,M]=fem(N,T,P,w,g)
    n=size(T,1);
    m=size(N,1);
    K=zeros(m,m);
    M=zeros(m,m);
    bn=zeros(m,1);

    Idx_bnd=find_boundary_nodes(T);

    for i=1:n
      % assembly, do not forget the material constants
      Ke=elementstiffmatrix([N(T(i,1),:);N(T(i,2),:);N(T(i,3),:)]);
      Me=elementmassmatrix([N(T(i,1),:);N(T(i,2),:);N(T(i,3),:)]);
      for j = 1:3
          if ~any(Idx_bnd == T(i,j))
              for k = 1:3
                  K(T(i,j),T(i,k)) = K(T(i,j),T(i,k)) + Ke(j,k);
                  M(T(i,j),T(i,k)) = M(T(i,j),T(i,k)) + P(i)*Me(j,k);
              end   
          end
      end   
    end

    A = -K + w^2*M;
    % apply the function g to the nodes in Idx_bnd
    % and put this on the rhs
    % and adapt the matrices M and K accordingely
    % in order to get u=g on the real boundary
    for l=Idx_bnd
        bn(l,1)=g(N(l,1),N(l,2));
        A(l,l)=1;
    end
    u = A\bn
end