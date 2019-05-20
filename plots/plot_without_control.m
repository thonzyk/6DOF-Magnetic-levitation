% Poloha
figure
subplot(2, 1, 1)
plot(simout_position)
title('Pr�b�h polohy')
legend('x', 'y', 'z')
xlabel('�as [s]')
ylabel('Poloha [m]')

% Rotace
subplot(2, 1, 2)
plot(simout_rotation)
title('Pr�b�h orientace')
legend('\phi', '\theta', '\psi')
xlabel('�as [s]')
ylabel('Eulerovy �hly [rad]')