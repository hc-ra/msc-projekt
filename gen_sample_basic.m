function [ sample ] = gen_sample_basic( len, start, slope_len, b0, b1, noise_scale )
    trend = gen_trend( len, start, slope_len, b0, b1 );
    noise = randn(1, len) * noise_scale;
    sample = arrayfun( @(x) max(x, 0), trend + noise );
    
end

