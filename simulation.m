%% --SIMULACE-- %%
% souštìcí skript

%% Inicializace
clear 
clc
constants

%% Parametry regulátoru
% LQR - stavová zpìtná vazba
reduced_state_space % Výpoèet z linearizovaného systému

%% Parametry senzorù
setpoint_x = perm_vak_4pi*m_0 * ( (3*s*z_r)/(s^2+z_r^2)^(5/2) );
setpoint_y = setpoint_x;

%% Poèáteèní podmínky
x_0 = [0.001 -0.0015 z_r-0.000]; % Poèáteèní poloha levitujícího magnetu [m]
phi_0 = [0.00 0.00 0]; % Poèáteèní natoèení levitujícího magnetu [rad] (Euler angles)
angular_velocity_0 = [0 0 0]; % Poèáteèní úhlová rychlost levitujícího magnetu [rad/s]

%% Simulace
T = 5; % Doba trvání simulace [s]

sim('nonlinear_model')

%% Zobrazení výsledkù
addpath('plots')
% plot_without_control
plot_nonlinear_simulation
plot_real_vs_estimation
% plot_compare
plot_output
% simscape_compare

