%% --VIZUALIZACE ORIENTACE MAGNETICKÉHO POLE-- %%
% skript slouží k porovnání magnetického pole jednoho a vícero magentických
% dipólù
clear; clc; constants;

n_of_steps = 16;
[B_x_1, B_z_1, vec_sizes_1, B_x_14, B_z_14, vec_sizes_14] = compute_fields(rozsah, n_of_steps, m_1, m_14);

step_size = (2*rozsah)/n_of_steps;
x = -rozsah:step_size:rozsah;
z = rozsah:-step_size:-rozsah;

max_size = (max(max(vec_sizes_1)));
max_size_3 = (max(max(vec_sizes_14)));
max_size_nl = (max([max_size max_size_3])); %
max_size = log(max_size_nl);
min_size = (min(min(vec_sizes_1(vec_sizes_1>0))));
min_size_3 = (min(min(vec_sizes_14(vec_sizes_14>0))));
min_size_nl = (min([min_size min_size_3])); %
min_size = log(min_size_nl);
interval_size = max_size-min_size;
colour_step = interval_size/(pocet_barev-1);

%% VYKRESLENÍ
figure
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
        
        quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', 'r', 'MaxHeadSize', 10);
        if i==length(x) && j==length(z)
            q1 = quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', 'r', 'MaxHeadSize', 10);
        end
    end
end
hold off

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
        
        quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', 'b', 'MaxHeadSize', 10)
        if i==length(x) && j==length(z)
            q3 = quiver(point(1)-x_size, point(2)-z_size, 2*x_size, 2*z_size, 'color', 'b', 'MaxHeadSize', 10);
        end
    end
end
hold off
title('Srovnání orientace polí')
xlabel('x')
ylabel('z')
legend([q1, q3], {'1 dipól', '14 dipólù'})

draw_info


