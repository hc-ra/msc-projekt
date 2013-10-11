function [ grid ] = make_grid( sample, n_rows, n_cols )
    eps = 0.00001;

    sample = sample - min(sample);  % move above x-axis
    cell_w = (length(sample)) / n_cols;
    cell_h = (max(sample) * (1 + eps)) / n_rows;  % allow max to be within bounds
    
    grid = zeros(n_rows, n_cols);
    for s = 1:length(sample)
       x = floor( (s - 1) / cell_w ) + 1;
       y = floor( sample(s) / cell_h ) + 1;
       grid(y, x) = 1;
    end
    
    % works, because padding cells have at most 3 non-0 neighbors.
    % it doesn't affect the current rule, needs revision for others
    grid = padarray(grid, [1 1]);

end

