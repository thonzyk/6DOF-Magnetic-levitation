%% --VIZUALIZACE MAGNETICKÉHO POLE-- %%
% skript slouží k porovnání magnetického pole jednoho a vícero magentických
% dipólù
clear; clc; constants;

n_of_steps = 20;
[B_x_1, B_z_1, vec_sizes_1, B_x_14, B_z_14, vec_sizes_14] = compute_fields(rozsah, n_of_steps, m_1, m_14);
step_size = (2*rozsah)/n_of_steps;
x = -rozsah:step_size:rozsah;
z = rozsah:-step_size:-rozsah;

max_size = (max(max(vec_sizes_1)));
max_size_3 = (max(max(vec_sizes_14)));
max_size_nl = (max([max_size max_size_3]));
max_size = log(max_size_nl);
min_size = (min(min(vec_sizes_1(vec_sizes_1>0))));
min_size_3 = (min(min(vec_sizes_14(vec_sizes_14>0))));
min_size_nl = (min([min_size min_size_3]));
min_size = log(min_size_nl);
interval_size = max_size-min_size;
colour_step = interval_size/(pocet_barev-1);


%% VYKRESLENÍ
figure
h1 = subplot(1, 2, 1);
hold on
for i=1:length(x)
    for j=1:length(z)
        if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
            continue
        end
        
        scale = step_size/vec_sizes_1(j, i);
        x_size = (B_x_1(j, i)*scale)/2;
        z_size = (B_z_1(j, i)*scale)/2;
        point = [x(i) z(j)];
        
        
        colour_i = round((log(vec_sizes_1(j, i))-min_size)/colour_step)+1;
        colour = color_gradient(colour_i, :);
        
        quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', colour, 'MaxHeadSize', 10)
    end
end
hold off
title('Magnetické pole 1 dipólu')
xlabel('x')
ylabel('z')
draw_info

h2 = subplot(1, 2, 2);
hold on
for i=1:length(x)
    for j=1:length(z)
        if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
            continue
        end
        
        scale = step_size/vec_sizes_14(j, i);
        x_size = (B_x_14(j, i)*scale)/2;
        z_size = (B_z_14(j, i)*scale)/2;
        point = [x(i) z(j)];
        
        
        colour_i = round((log(vec_sizes_14(j, i))-min_size)/colour_step)+1;
        colour = color_gradient(colour_i, :);
        
        quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', colour, 'MaxHeadSize', 10)
    end
end
hold off
title('Magnetické pole 14 dipólù')
xlabel('x')
ylabel('z')
originalSize = get(gca, 'Position');
col_bar = colorbar('Ticks',[0,.25,.5,.75,1],...
         'TickLabels',{num2str(round(min_size_nl, 4)), num2str(round(exp(min_size+(max_size-min_size)*0.25), 4)), num2str(round(exp((min_size+max_size)*0.5), 4)), num2str(round(exp(min_size+(max_size-min_size)*0.75), 4)),num2str(round(max_size_nl, 3))});
col_bar.Label.String = 'Magnetická indukce [T]';
set(h2, 'Position', originalSize);
newmap = jet;
colormap(newmap);
draw_info
