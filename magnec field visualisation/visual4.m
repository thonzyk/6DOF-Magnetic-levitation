%% --VIZUALIZACE ODCHYLKY ORIENTACE MAGNETICKÉHO POLE-- %%
% skript slouží k porovnání magnetického pole jednoho a vícero magentických
% dipólù
n_of_steps = 400;

[B_x_1, B_z_1, vec_sizes_1, B_x_14, B_z_14, vec_sizes_14] = compute_fields(rozsah, n_of_steps, m_1, m_14);
step_size = (2*rozsah)/n_of_steps;
x = -rozsah:step_size:rozsah;
z = rozsah:-step_size:-rozsah;

%% ROZDÍLY POLÍ
odchylky_uhlu = zeros(length(z), length(x));

for i=1:length(x)
    for j=1:length(z)
        
        vec_1 = [B_x_1(j, i) B_z_1(j, i)];
        vec_3 = [B_x_14(j, i) B_z_14(j, i)];
        odchylka = acos( dot(vec_1, vec_3)/(norm(vec_1)*norm(vec_3)) );
        
        if odchylka > pi
            odchylka = 2*pi - odchylka;
        end
        
        odchylky_uhlu(j, i) = odchylka;
    end
end

max_size_nl = (max(max(odchylky_uhlu)));
max_size = log(max_size_nl);
min_size_nl = 0.00872664626;
min_size = log(min_size_nl);
interval_size = max_size-min_size;
colour_step = interval_size/(pocet_barev-1);

odchylky_uhlu_01 = odchylky_uhlu./max_size_nl;

%% VYKRESLENÍ
obr = zeros(n_of_steps, n_of_steps, 3);

for i=1:length(x)
    for j=1:length(z)
        if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
            continue
        end
        
        colour_i = round((log(odchylky_uhlu(j, i))-min_size)/colour_step)+1;
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
title('Odchylka orientace magnetické indukce')
xlabel('x [m]')
ylabel('z [m]')
rad = 57.2957795;
col_bar = colorbar('Ticks',[0,.25,.5,.75,1],...
'TickLabels',{['<' num2str(round(min_size_nl*rad, 2)) '^{\circ}'], [num2str(round(exp(min_size+(max_size-min_size)*0.25)*rad, 2)) '^{\circ}'], [num2str(round(exp((min_size+max_size)*0.5)*rad, 2)) '^{\circ}'], [num2str(round(exp(min_size+(max_size-min_size)*0.75)*rad, 2)) '^{\circ}'], [num2str(round(max_size_nl*rad, 2)) '^{\circ}']});
col_bar.Label.String = 'Odchylky orientace magnetické indukce [deg]';
newmap = jet;
colormap(newmap);

set(gca, 'XTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1])
set(gca, 'YTick', [1 n_of_steps*0.25+1 n_of_steps*0.5+1 n_of_steps*0.75+1 n_of_steps+1]) 
set(gca, 'XTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})
set(gca, 'YTickLabel', {num2str(-rozsah) num2str(-rozsah*0.5) num2str(0) num2str(rozsah*0.5) num2str(rozsah)})

imwrite(obr, 'angle_compare.jpg')

draw_info



