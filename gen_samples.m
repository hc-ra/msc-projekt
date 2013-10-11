sample_len = 10000;
n_samples = 100;
samples = cell(n_samples, 3);
for i = 1:n_samples
   elev = 2 * rand();
   slope_len = randi(floor(sample_len) / 2);
   slope_start = randi(sample_len - slope_len);
   [smp, ] = gen_sample(10000, slope_start, slope_len, 0.5, 0.5 + elev, 0.04, 5, 20, 1);
   samples(i,:) = {smp, elev, slope_len};
end