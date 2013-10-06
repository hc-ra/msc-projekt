function [ vals ] = gen_peaks ( len, n_peaks, sigma_mod, scale )
    vals = zeros(1, len);
    for i = 1:n_peaks
        peak = scale * normpdf((1:len), randi(len), sigma_mod * max(0.1, (2 + randn()))); % multiply random by s.d.
        vals = vals + peak;
    end
end

