
simout_position.Data = simout_position.Data(:, 1:2);

% Poloha
figure
subplot(3, 1, 1)
plot(simout_position)
title('Prùbìh polohy')
legend('x', 'y')
xlabel('Èas [s]')
ylabel('Poloha [m]')

% Rotace
subplot(3, 1, 2)
plot(simout_rotation)
title('Prùbìh orientace')
legend('\phi', '\theta', '\psi')
xlabel('Èas [s]')
ylabel('Eulerovy úhly [rad]')

% Øízení
subplot(3, 1, 3)
plot(simout_control)
title('Prùbìh øízení')
legend('u-x', 'u-y')
xlabel('Èas [s]')
ylabel('Proud [A]')