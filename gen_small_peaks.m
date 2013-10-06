function [ vals ] = gen_small_peaks ( len, n_peaks, sigma_mod )
% can be negative
    vals = zeros(1, len);
    for i = 1:n_peaks
        peak = sign(randn()) * normpdf((1:len), randi(len), sigma_mod * (1 + abs(randn()))); % multiply random by s.d.
        vals = vals + peak;
    end
    %standarize
    vals = vals / max(abs(vals));
end
