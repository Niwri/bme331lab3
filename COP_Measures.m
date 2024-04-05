function [MDIST, RDIST, MVELO, RANGE] = COP_Measures(arr1)
    MDIST = 1/length(arr1) * sum(abs(arr1));
    RDIST = (1/length(arr1) * sum(abs(arr1.^2))) ^ 0.5;
    for n = 1:length(arr1)-1
        MVELO = (abs(arr1(n+1)-arr1(n)))/120;
    end
    RANGE = max(arr1) - min(arr1);
end