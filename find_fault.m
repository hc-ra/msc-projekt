function [ new_grid, i ] = find_fault( sample, n_rows, n_cols, n_iters )
    grid = make_grid(sample, n_rows, n_cols);
    for i = (1:n_iters)
        new_grid = do_iteration(grid);
    %    disp(nnz(grid ~= new_grid))    % count differing cells
        if isequal(new_grid, grid)
            return
        end
        grid = new_grid;
    end
end

