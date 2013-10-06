function [ sample, peaks ] = gen_sample( len, start, slope_len, b0, b1, noise_scale, n_peaks, min_sigma, peak_scale )
    trend = gen_trend( len, start, slope_len, b0, b1 );
    peaks = gen_peaks( len, n_peaks, min_sigma, peak_scale );
    trend = trend + peaks; % * 0.1;
    noise = randn(1, len) * noise_scale .* peaks; % noise scale przeniesc
    sample = arrayfun( @(x) max(x, 0), trend + noise );    
end

