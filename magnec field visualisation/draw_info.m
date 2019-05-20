%% VYKRESLENÍ INFORMACÍ DO GRAFU
% Vykreslení poloh magnetù, senzorù a referenèního bodu

if n_of_steps < 100
    hold on
    rectangle('Position', [-magnet_dimensions(1) -magnet_dimensions(2) 2*magnet_dimensions(1) 2*magnet_dimensions(2)], 'EdgeColor', 'k')
    refer = scatter(0, -0.07, 150, 'k');
    hline = line(NaN,NaN,'LineWidth',2,'Color',[0 0 0]);
    legend([hline, refer], {'Rozmìry magnetu', 'Referenèní bod'})
    hold off
    return
end

hold on
rectangle('Position',[((n_of_steps/2)-magnet_dimensions(1)/step_size)+2 ((n_of_steps/2)-magnet_dimensions(2)/step_size)+2 ((magnet_dimensions(1)*2)/step_size)-2 ((magnet_dimensions(2)*2)/step_size)-2], 'EdgeColor', 'w')
cect_pos = ((n_of_steps/2)/rozsah)*[0.035-(0.015/2) 0.03-(0.011/2) 0.0145 0.01125] + ((n_of_steps/2)+1)*[1 1 0 0];
rectangle('Position', cect_pos, 'EdgeColor', 'k')
cect_pos = ((n_of_steps/2)/rozsah)*[0.035-(0.015/2) 0.03-(0.011/2) 0.0145 0.01125] + ((n_of_steps/2)+1)*[0 1 0 0];
rectangle('Position', cect_pos, 'EdgeColor', 'k')
cect_pos = ((n_of_steps/2)/rozsah)*[-0.002 0.03-(0.002/2) 0.004 0.002] + ((n_of_steps/2)+1)*[1 1 0 0];
rectangle('Position', cect_pos, 'EdgeColor', 'm')
refer = scatter(n_of_steps/2+1, n_of_steps-1, 100, 'w');
hline = line(NaN,NaN,'LineWidth',2,'Color','k');
hline2 = line(NaN,NaN,'LineWidth',2,'Color','m');
lgnd = legend([hline, hline2, refer], {'Poloha magnetù', 'Poloha senzorù', 'Referenèní bod'});
set(lgnd,'color', [.6 .6 .6]);
hold off