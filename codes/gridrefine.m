function [Nr , Tr , Pr]= gridrefine (N, T, P)
%% simple grid refinement
% Nr , Tr , Pr -> New nodes , triangles , and material constants
% Start the new node list with old once
Nr = N ; 
nn = size (N ,1) ;
% Start triangulation from scratch
Tr =[]; nt = 0; Pr =[];

for j = 1:size(T,1)
    i = T(j,1:3);
    % Coordinates of nodes of triangle j
    n = N(i,:);
    % 3 new nodes
    n (4,:) =( n (1 ,:) + n (2 ,:) ) /2;
    n (5,:) =( n (1 ,:) + n (3 ,:) ) /2;
    n (6,:) =( n (2 ,:) + n (3 ,:) ) /2;
    % Insert new nodes in Nr if don 't have it

    for k = 4:6
        % check x- coord .
        l = find ( Nr (: ,1) == n (k, 1) ) ;
        % check y- coord .
        m = find ( Nr (l ,2) == n (k, 2) ) ;

        if isempty ( m ) % isempty returns 1 if m is empty 0 else
            nn = nn +1;
            Nr ( nn,:) = n (k ,:) ;
            % i ( k ) =? n(k,:)
            i (k) = nn;
        else
            % node found
            i ( k ) = l ( m ) ;
        end 
    end
    % Insert 4 new triangles
    Tr( nt+1 ,:) =[ i(1) i(4) i(5) T(j, 4) 0 T(j, 6)];
    Tr( nt+2 ,:) =[ i(4) i(6) i(5) 0 0 0];
    Tr( nt+3 ,:) =[ i(6) i(4) i(2) 0 T(j, 4) T(j, 5)];
    Tr( nt+4 ,:) =[ i(6) i(3) i(5) T(j,5) T(j,6) 0];

    Pr (nt+1: nt+4) = P (j) ;
    nt = nt + 4;
end
end