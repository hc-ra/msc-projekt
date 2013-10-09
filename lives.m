function [ Y ] = lives( X )
    Y = ~((X <= 5) & (X ~= 4));
end

