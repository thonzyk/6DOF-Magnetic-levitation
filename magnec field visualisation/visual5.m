%% --VIZUALIZACE CELKOVÉ ODCHYLKY MAGNETICKÉHO POLE-- %%
% skript slouží k porovnání magnetického pole jednoho a vícero magentických
% dipólù
celkove_odchylky = odchylky_uhlu_01 .* relativni_odchylky;
min_size = log(0.0001);
max_size = log(1);

obr = zeros(n_of_steps, n_of_steps, 3);

for i=1:length(x)
    for j=1:length(z)
        if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
            continue
        end
        
        colour_i = round((log(celkove_odchylky(j, i))-min_size)/colour_step)+1;
        if colour_i > pocet_barev-1
            colour_i = pocet_barev-1;
        end
        if colour_i < 1
            colour_i = 1;
        end
        
        colour = color_gradient(colour_i, :);
        
        obr(j, i, :) = colour;
    end
end

figure
h1 = subplot(1, 1, 1);
image(obr)
title('Celkové zhodnocení rozdílnosti polí')
xlabel('x [m]')
ylabel('z [m]')
rad = 57.2957795;
col_bar = colorbar('Ticks',[0,1],...
'TickLabels',{'min', 'max'});
col_bar.Label.String = '';
newmap = jet;
colormap(newmap);

set(gca, 'XTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1])
set(gca, 'YTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1]) 
set(gca, 'XTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})
set(gca, 'YTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})

imwrite(obr, 'my_compare.jpg')

draw_info