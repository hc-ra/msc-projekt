function [ new_grid ] = do_iteration( grid )
    % may use padarray
    ms = size(grid, 1);
    mp = [1 1:(ms-1)];
    mq = [2:ms ms];
    
    ns = size(grid, 2);
    np = [1 1:(ns-1)];
    nq = [2:ns ns];

    nb_count = grid + ...
        grid(mp, :) + grid(mq, :) + ... % vertical neighbors
        grid(:, np) + grid(:, nq) + ... % horizontal neighbors
        grid(mp, np) + grid(mp, nq) + ...
        grid(mq, np) + grid(mq, nq);

    new_grid = lives(nb_count);
end

