%smp0 = gen_sample(1000, 300, 100, 0.5, 1, 0.2)

bsmp = gen_sample_basic(1000, 300, 100, 0.5, 1, 0.2);

% gen_sample( len, start, slope_len, b0, b1, noise_scale, n_peaks, min_sigma, peak_scale )
[smp, pks] = gen_sample(10000, 400, 150, 0.5, 1.5, 0.04, 400, 10, 100);
subplot(4,1,1), plot(bsmp)
subplot(4,1,2), plot(smp)
subplot(4,1,3), plot(pks)
subplot(4,1,4), plot(vibro(5).value)

