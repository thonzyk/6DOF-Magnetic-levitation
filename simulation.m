%% --SIMULACE-- %%
% sou�t�c� skript

%% Inicializace
clear 
clc
constants

%% Parametry regul�toru
% LQR - stavov� zp�tn� vazba
reduced_state_space % V�po�et z linearizovan�ho syst�mu

%% Parametry senzor�
setpoint_x = perm_vak_4pi*m_0 * ( (3*s*z_r)/(s^2+z_r^2)^(5/2) );
setpoint_y = setpoint_x;

%% Po��te�n� podm�nky
x_0 = [0.001 -0.0015 z_r-0.000]; % Po��te�n� poloha levituj�c�ho magnetu [m]
phi_0 = [0.00 0.00 0]; % Po��te�n� nato�en� levituj�c�ho magnetu [rad] (Euler angles)
angular_velocity_0 = [0 0 0]; % Po��te�n� �hlov� rychlost levituj�c�ho magnetu [rad/s]

%% Simulace
T = 5; % Doba trv�n� simulace [s]

sim('nonlinear_model')

%% Zobrazen� v�sledk�
addpath('plots')
% plot_without_control
plot_nonlinear_simulation
plot_real_vs_estimation
% plot_compare
plot_output
% simscape_compare

