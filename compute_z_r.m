%% --VÝPOÈET ROVNOVÁŽNÉHO STAVU-- %%

syms z
eqn = m*g == 3*perm_vak_4pi*m_2*m_0 * ( (12*z)/(2*a^2+z^2)^(5/2) - (20*z^3)/(2*a^2+z^2)^(7/2) );
solx = vpa(solve(eqn, z));
reseni = solx(imag(solx)==0);
clear z
z_r = double(max(reseni));