%% REÁLNÝ STAV VS REKONSTRUKTOR

% Poloha
figure
subplot(2, 1, 1)
hold on
plot(simout_position.time, simout_position.Data(:,1:2));
plot(position_estimation, '--')
hold off
title('Porovnání rekonstrukce polohy')
legend('x', 'y', 're-x', 're-y')
xlabel('Èas [s]')
ylabel('Poloha [m]')

% Rotace
subplot(2, 1, 2)
hold on
plot(simout_rotation)
plot(orientation_estimation, '--')
hold off
title('Porovnání rekonstrukce orientace')
legend('\phi', '\theta', '\psi', 're-\phi', 're-\theta')
xlabel('Èas [s]')
ylabel('Eulerovy úhly [rad]')

