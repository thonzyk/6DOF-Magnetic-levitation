%% VIZUALIZACE ROZM�ST�N� MAGNETICK�CH DIP�L�

subplot(1, 2, 1)
hold on
rectangle('Position', [-magnet_dimensions(1) -magnet_dimensions(2) 2*magnet_dimensions(1) 2*magnet_dimensions(2)], 'EdgeColor', 'k')
scatter(0, 0, 100, 'b', 'filled')
title('Rozm�st�n� 1 dip�lu')
xlim([-magnet_dimensions(1)-0.001 magnet_dimensions(1)+0.001])
axis equal
xlabel('x [m]')
ylabel('z [m]')
hold off

subplot(1, 2, 2)
hold on
rectangle('Position', [-magnet_dimensions(1) -magnet_dimensions(2) 2*magnet_dimensions(1) 2*magnet_dimensions(2)], 'EdgeColor', 'k')


for i=1:length(dipoles_positions)
    scatter(dipoles_positions(1, i), dipoles_positions(2, i), 100, 'b', 'filled')
end

title('Rozm�st�n� 14 dip�l�')
xlim([-magnet_dimensions(1)-0.001 magnet_dimensions(1)+0.001])
axis equal
xlabel('x [m]')
ylabel('z [m]')
hold off