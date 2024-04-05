dataCOM = table2array(readtable("perturbed standing.txt")); %adapt these load commands to the file names that you use during your dataCOM collection
dataEMG = table2array(readtable("perturbed standing.csv"));
%SOL_raw = dataEMG(7972:end,1); %closed
%TA_raw = dataEMG(7972:end,2);
%SOL_raw = dataEMG(5576:end,1); %open
%TA_raw = dataEMG(5576:end,2);
SOL_raw = dataEMG(6000:end,1); %perturbed
TA_raw = dataEMG(6000:end,2);
dataCOM = interp1(0:1/200:120-1/200, dataCOM, 0:1/960:120-5/960); % For
%eyes closed

%dataCOM = interp1(0:1/200:120-201/200, dataCOM(1:23800, :), 0:1/960:119-5/960);  % eyes open

AP_raw = -(dataCOM(:,5) + 41.3* dataCOM(:,1))./dataCOM(:,3);

ML_raw = (dataCOM(:,4) - 41.3 * dataCOM(:,2))./dataCOM(:,3);

[b, a] = butter(4, 5/480, 'low'); %the first parameter is the filter order, and the second parameter is the cutoff frequency divided by half the sampling frequency.
AP_filt = filtfilt(b, a, AP_raw); %x and y are your original and filtered signals, respectively, to be renamed as appropriate
AP_filt = AP_filt - mean(AP_filt); %make the signal have zero-mean

ML_filt = filtfilt(b, a, ML_raw); %x and y are your original and filtered signals, respectively, to be renamed as appropriate
ML_filt = ML_filt - mean(ML_filt); %make the signal have zero-mean

SOL_filt = filtfilt(b, a, SOL_raw); %x and y are your original and filtered signals, respectively, to be renamed as appropriate
TA_filt = filtfilt(b, a, TA_raw);
% 
[MDIST_AP, RDIST_AP, MVELO_AP, RANGE_AP] = COP_Measures(AP_filt);
[MDIST_ML, RDIST_ML, MVELO_ML, RANGE_ML] = COP_Measures(ML_filt);
[MDIST_SOL, RDIST_SOL, MVELO_SOL, RANGE_SOL] = COP_Measures(SOL_filt);
[MDIST_TA, RDIST_TA, MVELO_TA, RANGE_TA] = COP_Measures(TA_filt);

%[CVAL_AP_SOL, TS_AP_SOL] = CCF(AP_raw, SOL_raw, "AP - SOL CCF")
%[CVAL_AP_TA, TS_AP_TA] = CCF(AP_raw, TA_raw, "AP - TA CCF")
hold on
%title("AP Perturbed Effects")
%plot(84000/960:1/960:94000/960, AP_filt(84000:94000))
%plot(AP_filt)
%title("SOL Perturbed Effects")
%plot(84000/960:1/960:94000/960, SOL_filt(84000:94000))
title("TA Perturbed Effects")
plot(84000/960:1/960:94000/960, TA_filt(84000:94000))
hold off