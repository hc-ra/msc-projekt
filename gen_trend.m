function [ vals ] = gen_trend( len, start, slope_len, b0, b1 )
    vals = ones(1, len) * b0;
    inc = (b1 - b0) / slope_len;
    start = start + 1;
    slope = (1: slope_len) * inc;
    fin = start + slope_len - 1;
    vals(start:fin) = vals(start:fin) + slope;
    vals(fin:end) = b1;
end

