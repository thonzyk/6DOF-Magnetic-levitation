%% --KONSTANTY-- %%

%% Vlastnosti prost�ed�
perm_vak_4pi = 10^(-7); % Permeabilita vakua / 4pi [Hm^(-1)]
g = 9.81305; % Gravita�n� zrychlen� v Plzni [m*s^(-2)]

%% Vlastnosti levituj�c�ho permanentn�ho magnetu
neodymium_density = 7600; % Hustota levituj�c�ho magnetu [kg/m^3]
r = 0.0175; % Radius levituj�c�ho magnetu [m]
h = 0.0095; % V��ka levituj�c�ho magnetu [m]
m = pi*r^2*h*neodymium_density; % Hmotnost levituj�c�ho magnetu [kg]

I_1 = (1/12)*m*h^2 + (1/4)*m*r^2;
I_2 = I_1;
I_3 = (1/2)*m*r^2;
I = [I_1  0    0;
     0    I_2  0;
     0    0    I_3]; % Inertia matrix [kg*m^2]
m_0 = 3.3906; % Velikost magnetick�ho momentu levituj�c�ho magnetu [A*m^2]

%% Vlastnosti statick�ch permanentn�ch magnet�
m_2 = 1.5321; % Velikost magnetick�ho momentu statick�ch permanentn�ch magnet� [A*m^2]

%% Vlastnosti c�vek

pocet_zavitu = 30*10; % Po�et z�vit� na c�vce [bezrozm�rn�]
prumerna_area = pi*0.008^2; % Pr�m�rn� plocha ohrani�en� z�vitem [m^2]
Ks = pocet_zavitu * prumerna_area; % Konstanta pro v�po�et momentu c�vky [m^2]
max_I = 2; % Saturace proudu proch�zej�c�ho c�vkami [A]
quantizer_konst = 8*10^(-3); % Diskretizace ak�n�ch z�sah�

%% Vlastnosti senzor�
sample_period = 0.003; % Perioda vzorkov�n� [s]
noise_power = 1*10^(-11); % Intenzita �umu [/]


%% Dal�� vlastnosti
rot_damp = 0*0.00002; % Tlumen� rotace
rot_damp_sim = rot_damp*r;

%% Rozlo�en� soustavy

a = 0.025; % Rozm�r rozm�st�n� magnet� a c�vek [m]
s = 1*0.001; % Rozm�r rozm�st�n� senzor� [m]
compute_z_r; % Rovnov�n� vertik�ln� sou�adnice z [m] 2.75

x_1 = [-a  a 0]; % Poloha statick�ho permanentn�ho magnetu �. 1 [m m m]
x_2 = [ a  a 0]; % Poloha statick�ho permanentn�ho magnetu �. 2 [m m m]
x_3 = [-a -a 0]; % Poloha statick�ho permanentn�ho magnetu �. 3 [m m m]
x_4 = [ a -a 0]; % Poloha statick�ho permanentn�ho magnetu �. 4 [m m m]
x_5 = [ 0  a 0]; % Poloha c�vky �. 5 [m m m]
x_6 = [-a  0 0]; % Poloha c�vky �. 6 [m m m]
x_7 = [ a  0 0]; % Poloha c�vky �. 7 [m m m]
x_8 = [ 0 -a 0]; % Poloha c�vky �. 8 [m m m]

s_1 = [s 0 0]; % Poloha senzoru 1 [m m m]
s_2 = [0 s 0]; % Poloha senzoru 2 [m m m]