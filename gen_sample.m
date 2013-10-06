function [ sample, peaks ] = gen_sample( len, start, slope_len, b0, b1, noise_scale, n_peaks, sigma_mod, peak_max )
    % assume b0 is an axis of "normal operation"; the more the signal
    % deviates globally, the bigger it's local fluctuations are
    trend = gen_trend( len, start, slope_len, b0, b1 );
    gen_mod = floor(len / 1000);
    big_peaks = gen_peaks( len, gen_mod * n_peaks, sigma_mod);
    small_peaks = gen_small_peaks( len, 3 * gen_mod * n_peaks, sigma_mod / 6) * 0.7;
    %prevent spikes
    high = max(big_peaks);
    peaks = min(big_peaks + small_peaks, high);
    trend = trend + peaks * peak_max;
    
    noise = randn(1, len) * noise_scale .* (12 .^ (abs(peaks)));
    sample = arrayfun( @(x) max(x, 0), trend + noise );
end

