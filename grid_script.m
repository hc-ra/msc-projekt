
% sample = vibro(5).value;
% grid = make_grid(sample, 1000, 100);
%grid = a;

imagesc(grid)
colormap(jet)
%colormap(flipud(gray))
set(gca,'YDir','normal','GridLineStyle','-','XGrid','on','YGrid','on')
hold all

pause
for i = (1:100)
    new_grid = do_iteration(grid);
%    disp(nnz(grid ~= new_grid))    % count differing cells
    if isequal(new_grid, grid)
        disp(['Stabilized at iteration ' num2str(i)])
        break
    end
    grid = new_grid;
    img = rand(size(grid)) .* grid;
    imagesc(img)
    pause(0.05)
end