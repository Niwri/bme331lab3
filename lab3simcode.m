Tau_m = 0.05;
Tau_e = 0.04;
Tau_f = 0.01;
g = 9.81;
m = 65.77 * 0.971;
h = 1.70 * 0.547;
I = 1.70^2 * 65.77 * 0.547;

    
%[Kp, Kd] = deal(950, 100);
%[Kp, Kd] = deal(150, 150);
%[Kp, Kd] = deal(750, 350);
[Kp, Kd] = deal(1000, 1500);

simout = sim("LAB3SIM.slx");

freq = 960;
seg_length = 18;

[CVAL, TS] = CCF(simout.Mc, simout.COM, " ")