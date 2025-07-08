%% Parameter
clc; clear; close all;
dt = 0.01;
%% Body Dynamics
m = 1.362;
l = 0.211;
g = 9.81;
F0 = m * g / 4;
Jx = 0.032276; Jy = 0.031124; Jz = 0.035229;
%% Init vals
attInit = [0;0;0];
velInit = [0;0;0];
posInit = [0;0;0];
omegaInit = [0; 0; 0];
motorSpinInit = [0; 0; 0; 0];
%% Motor Dynamics
Jm = 12*10^-6;
Ra = 0.128;
Kt = 1 / (1900 / 60 * 2 * pi);
%% Propeler params
b = 1.312186e-5;
d = 1.218100e-7;
%% Initial Control Variables
w0 = 4818;
u0 = (w0 - 1075) / 7525;
omega0 = w0 * (2*pi)/60;
Kth = b * (omega0 ^ 2 / u0);
Kd = d * (omega0 ^ 2 / u0);
%% Control for Roll, Pitch, Yaw
% Roll
siRoll = 0.8;
wnRoll = 6  ;
Kp1Roll = (siRoll * wnRoll) / (l * Kth / Jx);
Kp2Roll = wnRoll^2 / ((2 * l * Kth / Jx) * Kp1Roll);

siPitch = 0.8;
wnPitch = 6  ;
Kp1Pitch = (siPitch * wnPitch) / (l * Kth / Jy);
Kp2Pitch = wnPitch^2 / ((2 * l * Kth / Jy) * Kp1Pitch);

siYaw = 1;
wnYaw = 6;
Kp1Yaw = (siYaw * wnYaw) / (2 * d * Kd / (Jz * b));
Kp2Yaw = wnYaw^2 / ((4 * d * Kd / (Jz * b)) * Kp1Yaw);
%% Control for h, x, y
siH = 6;
wnH = 6;
Kp1H = (siH * wnH * m) / (2 * Kth);
Kp2H = (wnH ^ 2 * m) / (4 * Kth * Kp1H);

U1 = m * g;
siXY = 1;
wnXY = 5e-1;
% The sign of Proportional controller will be negative (at least for Kp1)
Kp1XY = (2 * siXY * wnXY * m) / -U1;
Kp2XY = (wnXY ^ 2 * m) / (Kp1XY * -U1);