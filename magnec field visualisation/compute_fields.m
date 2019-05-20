function [B_x_1, B_z_1, vec_sizes_1, B_x_14, B_z_14, vec_sizes_14] = compute_fields( rozsah, n_of_steps, m_1, m_14 )
%COMPUTE_FIELDS Vr�t� informace o vektorov�m pol�ch magnetick� indukce

% INPUTS
% rozsah - rozsah prostoru pro v�po�et [m]
% n_of_steps - po�et krok� uvnit� rozsahu pro v�po�et
% m_1 - magnetick� moment samostatn�ho magnetick�ho dip�lu
% m_14 - magnetick� moment ka�d�ho z mno�iny 14 magnetick�ch dip�l�

% RETURNS
% B_x_1 - Hodnoty magnetick� indukce v sou�adnici x v p��slu�n�ch bodech
%        (pro 1 dip�l)
% B_z_1 - Hodnoty magnetick� indukce v sou�adnici z v p��slu�n�ch bodech
%        (pro 1 dip�l)
% vec_sizes_1 - Velikosti magnetick� indukce v p��slu�n�ch bodech
%        (pro 1 dip�l)
% B_x_14 - Hodnoty magnetick� indukce v sou�adnici x v p��slu�n�ch bodech
%        (pro 14 dip�l�)
% B_z_14 - Hodnoty magnetick� indukce v sou�adnici z v p��slu�n�ch bodech
%        (pro 14 dip�l�)
% vec_sizes_14 - Velikosti magnetick� indukce v p��slu�n�ch bodech
%        (pro 14 dip�l�)

%% INICIALIZACE
perm_vak_4pi = evalin('base', 'perm_vak_4pi');
step_size = (2*rozsah)/n_of_steps;
x = -rozsah:step_size:rozsah;
z = rozsah:-step_size:-rozsah;
e = evalin('base', 'e');
dipoles_positions = evalin('base', 'dipoles_positions');
magnet_dimensions = evalin('base', 'magnet_dimensions');


%% 1 DIP�L
B_x_1 = zeros(length(z), length(x));
B_z_1 = zeros(length(z), length(x));
vec_sizes_1 = zeros(length(z), length(x));

dipole_position = [0 0];

for i=1:length(x)
    for j=1:length(z)
        if sum(abs([x(i) z(j)]-dipole_position)) < e
            continue
        end
        B_x_1(j, i) = perm_vak_4pi * ( (3*x(i)*m_1*z(j))/sqrt(x(i)^2+z(j)^2)^5 );
        B_z_1(j, i) = perm_vak_4pi * ( (3*z(j)^2*m_1)/sqrt(x(i)^2+z(j)^2)^5 - m_1/sqrt(x(i)^2+z(j)^2)^3);
        vec_sizes_1(j, i) = sqrt(B_x_1(j, i)^(2)+B_z_1(j, i)^(2));
    end
end

%% 14 DIP�L�
B_x_14 = zeros(length(z), length(x));
B_z_14 = zeros(length(z), length(x));
vec_sizes_14 = zeros(length(z), length(x));



for dipole_i=1:length(dipoles_positions)
    for i=1:length(x)
        for j=1:length(z)
            if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
                continue
            end
            B_x_14(j, i) = B_x_14(j, i) + (perm_vak_4pi * ( (3*(x(i)-dipoles_positions(1, dipole_i))*m_14*(z(j)-dipoles_positions(2, dipole_i)))/sqrt((x(i)-dipoles_positions(1, dipole_i))^2+(z(j)-dipoles_positions(2, dipole_i))^2)^5 ));
            B_z_14(j, i) = B_z_14(j, i) + (perm_vak_4pi * ( (3*(z(j)-dipoles_positions(2, dipole_i))^2*m_14)/sqrt((x(i)-dipoles_positions(1, dipole_i))^2+(z(j)-dipoles_positions(2, dipole_i))^2)^5 - m_14/sqrt((x(i)-dipoles_positions(1, dipole_i))^2+(z(j)-dipoles_positions(2, dipole_i))^2)^3));
        end
    end
end

for dipole_i=1:length(dipoles_positions)
    for i=1:length(x)
        for j=1:length(z)
            if abs(x(i))<magnet_dimensions(1) && abs(z(j))<magnet_dimensions(2)
                continue
            end
            vec_sizes_14(j, i) = sqrt(B_x_14(j, i)^(2)+B_z_14(j, i)^(2));
        end
    end
end


end

