% Poloha
figure
subplot(2, 1, 1)
plot(simout_position)
title('Prùbìh polohy')
legend('x', 'y', 'z')
xlabel('Èas [s]')
ylabel('Poloha [m]')

% Rotace
subplot(2, 1, 2)
plot(simout_rotation)
title('Prùbìh orientace')
legend('\phi', '\theta', '\psi')
xlabel('Èas [s]')
ylabel('Eulerovy úhly [rad]')