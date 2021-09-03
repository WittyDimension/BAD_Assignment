%% Bode Plot for the Second Order Control system
%   zt = ζ = damping ratio
%   wn = natural frequency
%   tf = transfer function
%   G = system
   
clc;
clear all;
wn = 5;
zt = 0.4;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
bode(G)
[mag, phase] = bode(G)
grid
title('Bode Diagram of G(s)')




%% To find the step response of the system with varying natural frequency and constant zeta.
%  zt = ζ = damping ratio = 0.4;
%  wn = natural frequency (range from 1 to 10 rad/sec);
%  Transfer function of the system, G(s) = wn^2 / (1 + 2*zt*wn + wn^2);

wn = 1:2:10;
zt = 0.4;
sys_poles = [];
len_wn = length(wn);
figure
hold on
for j = 1:len_wn
    G(j) = tf(wn(j)^2, [1,2*zt*wn(j),wn(j)^2]);
    step(G(j))
    find_poles = pole(G(j));
    for m = 1:2
        sys_poles(j,m) = find_poles(m);
    end
end
grid
legend
hold off






%% Task-2 : Augmented System Analysis
% Number 1- Forming the basic second-order system

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
step(G)
grid
title('Step Response of the system G(s)')






% Number 2- Adding an extra pole in step input
% Transfer function in consideration; G1(s) = tf(p,[1,p]),
% where p varies from 0.2 to 1000.
% considered random values of p = 0.2, 6, -45, 565, 939.


wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
step(G)
hold on

z = 0.2
G1 = tf(z,[1, z])
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off




% for p = 6

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
step(G)
hold on

z = 6
G1 = tf(z,[1, z])
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off




% for p = -45

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
step(G)
hold on

z = -45
G1 = tf(z,[1, z])
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off




% for p = 565

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
subplot(2,1,1)
step(G)
grid
title('Step Response of sytem G(s)')
legend

z = 565
G1 = tf(z,[1, z])
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
subplot(2,1,2)
step(G_sys,"r")
grid
title('Step Response of sytem G _ sys(s)')
legend




% for p = 939

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
subplot(2,1,1)
step(G)
grid
title('Step Response of sytem G(s)')
legend

z = 939
G1 = tf(z,[1, z])
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
subplot(2,1,2)
step(G_sys,"r")
grid
title('Step Response of sytem G _ sys(s)')
legend






% Number 3- Adding an extra zero in step input
% Transfer function in consideration; G1(s) = tf([1,z], z),
% where z varies from 0.2 to 1000.
% considered random values of z = 0.2, 6, -45, 565, 939.



wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
zeros_G = zero(G);
step(G)
hold on

z = 0.2
G1 = tf([1, z],z)
G_sys = series(G, G1)
zeros_G_sys = zero(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off



% For z = 6

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
zeros_G = zero(G);
step(G)
hold on

z = 6
G1 = tf([1, z],z)
G_sys = series(G, G1)
zeros_G_sys = zero(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off



% For z = -45

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
zeros_G = zero(G);
step(G)
hold on

z = -45
G1 = tf([1, z],z)
G_sys = series(G, G1)
zeros_G_sys = zero(G_sys)
damp(G_sys)
step(G_sys)
grid
title('Step Response of sytem G _ sys(s)')
legend
hold off



% For z = 565

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
subplot(2,1,1)
step(G)
grid
title('Step Response of sytem G(s)')
legend

z = 565
G1 = tf([1, z],z)
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
subplot(2,1,2)
step(G_sys,"r")
grid
title('Step Response of sytem G _ sys(s)')
legend




% For z = 939 

wn = 1.5;
zt = 0.48;
G = tf(wn^2, [1,2*zt*wn,wn^2])
poles_G = pole(G);
subplot(2,1,1)
step(G)
grid
title('Step Response of sytem G(s)')
legend

z = 939
G1 = tf([1, z],z)
G_sys = series(G, G1)
poles_G_sys = pole(G_sys)
damp(G_sys)
subplot(2,1,2)
step(G_sys,"r")
grid
title('Step Response of sytem G _ sys(s)')
legend
