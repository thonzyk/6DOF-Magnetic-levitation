% V�stup
figure
hold on
plot(simout_output)
plot(simout_output_C, '--')
title('Pr�b�h v�stupu')
legend('output x1', 'output y1', 'output x1', 'output y2', 're-out x1', 're-out y1', 're-out x2', 're-out y2')
xlabel('�as [s]')
ylabel('Induk�n� tok')