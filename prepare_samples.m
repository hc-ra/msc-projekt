samples = struct;
for i = 1:4
    samples(i).values = vibro(i).value;
    samples(i).fault = 0;
end
for i = 5:6
    samples(i).values = vibro(i).value;
    samples(i).fault = 1;
end
% rising trend with no fault
for slope = 0:1:3
    [smp, pks] = gen_sloped_sample(25000, slope, 0, 1, 0.5, 0.5, 0.04, 5, 20, 1);
    samples(end + 1).values = smp;
    samples(end).fault = 0;
end
% flat trend, faults of different length
for fault_len = 2000:2000:6000
    [smp, pks] = gen_sloped_sample(25000, 0, 10000, fault_len, 0.5, 1.2, 0.04, 5, 20, 1);
    samples(end + 1).values = smp;
    plot(smp)
    samples(end).fault = 1;
end