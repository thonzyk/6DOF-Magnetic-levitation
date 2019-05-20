% Poloha
figure
subplot(2, 1, 1)
hold on
plot(simout_position)
plot(simscape_position)
hold off
title('Prùbìh polohy')
legend('x', 'y', 'z', 's-x', 's-y', 's-z')
xlabel('Èas [s]')
ylabel('Poloha [m]')


eul = quat2eul(simscape_orientation.Data);
eul = [eul(:, 3), eul(:, 2), eul(:, 1)];
simscape_orientation.Data = eul;

% Rotace
subplot(2, 1, 2)
hold on
plot(simout_rotation)
plot(simscape_orientation)
hold off
title('Prùbìh orientace')
legend('\phi', '\theta', '\psi', 's-\phi', 's-\theta', 's-\psi')
xlabel('Èas [s]')
ylabel('Eulerovy úhly [rad]')