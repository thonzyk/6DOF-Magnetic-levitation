% Vıstup
figure
hold on
plot(simout_output)
plot(simout_output_C, '--')
title('Prùbìh vıstupu')
legend('output x1', 'output y1', 'output x1', 'output y2', 're-out x1', 're-out y1', 're-out x2', 're-out y2')
xlabel('Èas [s]')
ylabel('Indukèní tok')