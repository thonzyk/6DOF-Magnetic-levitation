
simout_position.Data = simout_position.Data(:, 1:2);

% Poloha
figure
subplot(3, 1, 1)
plot(simout_position)
title('Pr�b�h polohy')
legend('x', 'y')
xlabel('�as [s]')
ylabel('Poloha [m]')

% Rotace
subplot(3, 1, 2)
plot(simout_rotation)
title('Pr�b�h orientace')
legend('\phi', '\theta', '\psi')
xlabel('�as [s]')
ylabel('Eulerovy �hly [rad]')

% ��zen�
subplot(3, 1, 3)
plot(simout_control)
title('Pr�b�h ��zen�')
legend('u-x', 'u-y')
xlabel('�as [s]')
ylabel('Proud [A]')