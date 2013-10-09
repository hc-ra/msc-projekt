% gen and process samples

elevs = (0:0.5:2);
folder  = '.\plots\samples\';
fname_base   = 'sample';
ext     = 'png';

if ~exist(folder, 'dir')
    mkdir(folder);
end

for elev = elevs
    fig = figure;
    set(fig,'Visible','off');
    [smp, ] = gen_sample(25000, 12000, 2000, 0.5, 0.5 + elev, 0.04, 5, 20, 1);    
    subplot(2,1,1), plot(smp)
    
    grid = find_fault(smp, 1000, 100, 100);
    subplot(2,1,2), imagesc(grid)
    colormap(flipud(gray))
    set(gca,'YDir','normal','GridLineStyle','-','XGrid','off','YGrid','off')
    
    fname = [fname_base num2str(elev)];
    saveas(fig, [folder fname '.' ext], ext);
    
end