%% --KONSTANTY-- %%

%% Vlastnosti prostøedí
perm_vak_4pi = 10^(-7); % Permeabilita vakua / 4pi [Hm^(-1)]
g = 9.81305; % Gravitaèní zrychlení v Plzni [m*s^(-2)]

%% Vlastnosti levitujícího permanentního magnetu
neodymium_density = 7600; % Hustota levitujícího magnetu [kg/m^3]
r = 0.0175; % Radius levitujícího magnetu [m]
h = 0.0095; % Výška levitujícího magnetu [m]
m = pi*r^2*h*neodymium_density; % Hmotnost levitujícího magnetu [kg]

I_1 = (1/12)*m*h^2 + (1/4)*m*r^2;
I_2 = I_1;
I_3 = (1/2)*m*r^2;
I = [I_1  0    0;
     0    I_2  0;
     0    0    I_3]; % Inertia matrix [kg*m^2]
m_0 = 3.3906; % Velikost magnetického momentu levitujícího magnetu [A*m^2]

%% Vlastnosti statických permanentních magnetù
m_2 = 1.5321; % Velikost magnetického momentu statických permanentních magnetù [A*m^2]

%% Vlastnosti cívek

pocet_zavitu = 30*10; % Poèet závitù na cívce [bezrozmìrná]
prumerna_area = pi*0.008^2; % Prùmìrná plocha ohranièená závitem [m^2]
Ks = pocet_zavitu * prumerna_area; % Konstanta pro výpoèet momentu cívky [m^2]
max_I = 2; % Saturace proudu procházejícího cívkami [A]
quantizer_konst = 8*10^(-3); % Diskretizace akèních zásahù

%% Vlastnosti senzorù
sample_period = 0.003; % Perioda vzorkování [s]
noise_power = 1*10^(-11); % Intenzita šumu [/]


%% Další vlastnosti
rot_damp = 0*0.00002; % Tlumení rotace
rot_damp_sim = rot_damp*r;

%% Rozložení soustavy

a = 0.025; % Rozmìr rozmístìní magnetù a cívek [m]
s = 1*0.001; % Rozmìr rozmístìní senzorù [m]
compute_z_r; % Rovnovážná vertikální souøadnice z [m] 2.75

x_1 = [-a  a 0]; % Poloha statického permanentního magnetu è. 1 [m m m]
x_2 = [ a  a 0]; % Poloha statického permanentního magnetu è. 2 [m m m]
x_3 = [-a -a 0]; % Poloha statického permanentního magnetu è. 3 [m m m]
x_4 = [ a -a 0]; % Poloha statického permanentního magnetu è. 4 [m m m]
x_5 = [ 0  a 0]; % Poloha cívky è. 5 [m m m]
x_6 = [-a  0 0]; % Poloha cívky è. 6 [m m m]
x_7 = [ a  0 0]; % Poloha cívky è. 7 [m m m]
x_8 = [ 0 -a 0]; % Poloha cívky è. 8 [m m m]

s_1 = [s 0 0]; % Poloha senzoru 1 [m m m]
s_2 = [0 s 0]; % Poloha senzoru 2 [m m m]