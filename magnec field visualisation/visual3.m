%% --VIZUALIZACE ODCHYLKY INTENZITY MAGNETICKÉHO POLE-- %%
% skript slouží k porovnání magnetického pole jednoho a vícero magentických
% dipólù
clear; clc; constants;

n_of_steps = 400;

[B_x_1, B_z_1, vec_sizes_1, B_x_14, B_z_14, vec_sizes_14] = compute_fields(rozsah, n_of_steps, m_1, m_14);
step_size = (2*rozsah)/n_of_steps;
x = -rozsah:step_size:rozsah;
z = rozsah:-step_size:-rozsah;

%% ROZDÍLY POLÍ
vec_size_sum = abs(vec_sizes_1-vec_sizes_14);
relativni_odchylky = zeros(length(z), length(x));

for i=1:length(x)
    for j=1:length(z)
        pivot = max([vec_sizes_1(j, i) vec_sizes_14(j, i)]);
        relativni_odchylky(j, i) = vec_size_sum(j, i)/pivot;
    end
end

polynom = 1/2;
max_size_nl = (max(max(relativni_odchylky)));
max_size = (max_size_nl)^(polynom);
min_size_nl = (min(min(relativni_odchylky(relativni_odchylky>0))));
min_size = (min_size_nl)^(polynom);
interval_size = max_size-min_size;
colour_step = interval_size/(pocet_barev-1);

%% VYKRESLENÍ
obr = zeros(n_of_steps, n_of_steps, 3);

for i=1:length(x)
    for j=1:length(z)
        if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
            continue
        end
        
        colour_i = round(((relativni_odchylky(j, i)^(polynom))-min_size)/colour_step)+1;
        colour = color_gradient(colour_i, :);
        
        obr(j, i, :) = colour;
    end
end

figure

h1 = subplot(1, 1, 1);
image(obr)
title('Odchylka velikosti magnetické indukce')
xlabel('x [m]')
ylabel('z [m]')
prcnt = 100;
col_bar = colorbar('Ticks',[0,.25,.5,.75,1],...
'TickLabels',{[num2str(round(min_size_nl*prcnt, 2)) '%'], [num2str(round((min_size+(max_size-min_size)*0.25)^(polynom^(-1))*prcnt, 2)) '%'], [num2str(round(((min_size+max_size)*0.5)^(polynom^(-1))*prcnt, 2)) '%'], [num2str(round((min_size+(max_size-min_size)*0.75)^(polynom^(-1))*prcnt, 2)) '%'], [num2str(round((min_size+(max_size-min_size)*1.00)^(polynom^(-1))*prcnt, 2)) '%']});
col_bar.Label.String = 'Odchylka velikosti magnetické indukce';
newmap = jet;
colormap(newmap);

set(gca, 'XTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1])
set(gca, 'YTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1]) 
set(gca, 'XTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})
set(gca, 'YTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})

draw_info

imwrite(obr, 'size_compare.jpg')




