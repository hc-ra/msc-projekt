function [ sample, peaks ] = gen_sample( len, start, slope_len, b0, b1, noise_scale, n_peaks, sigma_mod, peak_max )
    trend = gen_trend( len, start, slope_len, b0, b1 );
    peaks = gen_peaks( len, n_peaks, sigma_mod);
    % standarize
    trend = trend + peaks * 0.5;
    noise = randn(1, len) * noise_scale .* (4 .^ (peaks) - 0.5); % noise scale przeniesc
    sample = arrayfun( @(x) max(x, 0), trend + noise );    
end

