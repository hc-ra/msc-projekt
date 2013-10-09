load('vibro RMS kanaly 1-6.mat');

inds = (1:6);
folder  = '.\plots\vibro\';
fname_base   = 'vibro';
ext     = 'png';

if ~exist(folder, 'dir')
    mkdir(folder);
end

for i = inds
    fig = figure;
    set(fig,'Visible','off');
    smp = vibro(i).value;
    subplot(2,1,1), plot(smp)
    
    grid = find_fault(smp, 1000, 100, 100);
    subplot(2,1,2), imagesc(grid)
    colormap(flipud(gray))
    set(gca,'YDir','normal','GridLineStyle','-','XGrid','off','YGrid','off')
    
    fname = [fname_base num2str(i)];
    saveas(fig, [folder fname '.' ext], ext);
    
end