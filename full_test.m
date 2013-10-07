%smp0 = gen_sample(1000, 300, 100, 0.5, 1, 0.2)

bsmp = gen_sample_basic(1000, 300, 100, 0.5, 1, 0.2);

% gen_sample( len, start, slope_len, b0, b1, noise_scale, n_peaks, sigma_mod, peak_max )
[smp, pks] = gen_sample(25000, 12000, 2000, 0.5, 1.2, 0.04, 5, 20, 1);
trend = gen_trend( 25000, 12000, 2000, 0.5, 1.2 );
% 
subplot(4,1,1), plot(trend)
title('trend')
subplot(4,1,2), plot(pks)
title('peaki')
subplot(4,1,3), plot(smp)
title('ostateczny wykres')
subplot(4,1,4), plot(vibro(5).value(1:25000))
title('orygina³ porównawczo')
pause()
subplot(4,1,1), plot(trend(1:5000))
title('trend')
subplot(4,1,2), plot(pks(1:5000))
title('peaki')
subplot(4,1,3), plot(smp(1:5000))
title('ostateczny wykres')
subplot(4,1,4), plot(vibro(3).value(1:5000))
title('orygina³ porównawczo')

