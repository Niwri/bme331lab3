function [CVAL, TS] = CCF(arr1, arr2, tit)
    freq = 960;
    seg_length = 8192;
    CVAL = -1000;
    TS = 0;
    for k = 1:13
        a = (k-1)*(seg_length)+1;
        b = (seg_length) + (k-1)*(seg_length);
        ccf = xcorr(arr1(a:b) - mean(arr1(a:b)), arr2(a:b) - mean(arr2(a:b)),'coeff');
        ccf_seg(k,:) = ccf;
    end
    avg_ccf = mean(ccf_seg);
    [CVAL, TS] = max(avg_ccf);
    
    TS = (TS - length(avg_ccf')/2)/freq;
    time = (-(seg_length-1):1:(seg_length-1))/freq;
    hold on
    title(tit)
    plot(time,avg_ccf);
    hold off
end