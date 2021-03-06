function [ sample, peaks ] = gen_sloped_sample( len, a1, start, slope_len, b0, b1, noise_scale, n_peaks, sigma_mod, peak_max )
    % assume b0 is an axis of "normal operation"; the more the signal
    % deviates globally, the bigger it's local fluctuations are
    trend = gen_trend( len, start, slope_len, b0, b1 ) + linspace(0, a1, len);
    
    gen_mod = floor(len / 1000);
    big_peaks = gen_peaks( len, gen_mod * n_peaks, sigma_mod);
    small_peaks = gen_small_peaks( len, 3 * gen_mod * n_peaks, sigma_mod / 6) * 0.7; % increase number, reduce s.d. and amplitude
    %prevent spikes
    high = max(big_peaks);
    peaks = min(big_peaks + small_peaks, high);
    %mix together
    trend = trend + peaks * peak_max;   % probably could be moved to l. 10
    %generate noise exponentially proportional to peak values
    noise = randn(1, len) * noise_scale .* (12 .^ (abs(peaks)));
    %add noise, dismiss negative values (if any)
    sample = arrayfun( @(x) max(x, 0), trend + noise );
end

