% for i = 0:100
%     plot(vibro(6).value(i*3000+1:(i+1)*3000))
%     pause    
% end

chns = size(vibro,2)
step = 1000
sz = 24000

for i = 1:chns
    time_str = datestr(vibro(i).timestamps + 693960,'yyyy-mmm-dd');
    
    subplot(chns,1,i), plot(vibro(i).timestamps, vibro(i).value)
%     set(gca, 'XTickLabel', time_str)
%     set(gca, 'XTick', [)
end


for i = 1:chns
%     datestr(vibro(i).timestamps(end) + 693960,'yyyy-mmm-dd')
    size(vibro(i).timestamps)
end