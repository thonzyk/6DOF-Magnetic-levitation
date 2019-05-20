%% KONSTANTY

perm_vak_4pi = 10^(-7); % Permeabilita vakua / 4pi [Hm^(-1)]

m_1 = 3.3906; % Velikost magnetického momentu levitujícího magnetu [A*m^2]
m_14 = m_1*0.075246584849707;

pocet_barev = 255;
color_gradient = jet(pocet_barev); % Barevný gradient

dipoles_positions = [-.015 -.010 -.005 0    .005 .010 .015 -.015 -.010 -.005 0      .005  .010  .015;
                      .0025  .0025  .0025 .0025 .0025 .0025 .0025 -.0025 -.0025 -.0025 -.0025 -.0025 -.0025 -.0025];
                   % Poloha 14 dipólù
                   
e = 0.00001; % chyba pro porovnání

rozsah = .07; % Rozmìr pro vykreslení pole

magnet_dimensions = [0.0175 0.005]; % Rozmìry permanentního magnetu