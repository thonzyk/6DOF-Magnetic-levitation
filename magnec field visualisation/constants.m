%% KONSTANTY

perm_vak_4pi = 10^(-7); % Permeabilita vakua / 4pi [Hm^(-1)]

m_1 = 3.3906; % Velikost magnetick�ho momentu levituj�c�ho magnetu [A*m^2]
m_14 = m_1*0.075246584849707;

pocet_barev = 255;
color_gradient = jet(pocet_barev); % Barevn� gradient

dipoles_positions = [-.015 -.010 -.005 0    .005 .010 .015 -.015 -.010 -.005 0      .005  .010  .015;
                      .0025  .0025  .0025 .0025 .0025 .0025 .0025 -.0025 -.0025 -.0025 -.0025 -.0025 -.0025 -.0025];
                   % Poloha 14 dip�l�
                   
e = 0.00001; % chyba pro porovn�n�

rozsah = .07; % Rozm�r pro vykreslen� pole

magnet_dimensions = [0.0175 0.005]; % Rozm�ry permanentn�ho magnetu