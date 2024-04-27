function Idx_bnd = find_boundary_nodes(T)
    Idx_bnd = [];
    % iterate each tri
    for i = 1:size(T, 1)
        % vertices & edges number
        vertices = T(i, 1:3);
        edge_markers = T(i, 4:6);
        % check the twe edges connected to each vercitices
        for j = 1:3
            edge = [];
            if j == 1
                edge = [1, 3]
            elseif j == 2
                edge = [1, 2]
            elseif j == 3
                edge = [2, 3]
            end

            if ~all(edge_markers(edge) == 0)
                Idx_bnd = [Idx_bnd, vertices(j)];
            end
        end
    end
    % uniqueness
    Idx_bnd = unique(Idx_bnd);
end