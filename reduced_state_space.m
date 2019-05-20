%% --REDUCED STATE-SPACE-- %%
% skript pro výpoèet lineárního systému a parametrù regulátoru

%% A
% matice dynamiky

r_a = sqrt(a^2+a^2+z_r^2);
a_11 = ((3*perm_vak_4pi*m_2*m_0)/m) * ( 4/r_a^5 - (20*a^2)/r_a^7 + (140*a^2*z_r^2)/r_a^9 - (20*z_r^2)/r_a^7 );
a_15 = ((3*perm_vak_4pi*m_2*m_0)/m) * ( (4*z_r)/r_a^5 - (20*z_r*a^2)/r_a^7 );
a_22 = ((3*perm_vak_4pi*m_2*m_0)/m) * ( 4/r_a^5 - (20*a^2)/r_a^7 + (140*a^2*z_r^2)/r_a^9 - (20*z_r^2)/r_a^7 );
a_24 = -((3*perm_vak_4pi*m_2*m_0)/m) * ( (4*z_r)/r_a^5 - (20*z_r*a^2)/r_a^7 );
a_42 = ((perm_vak_4pi*m_2*m_0)/I_1) * ( (-12*z_r)/r_a^5 + (60*a^2*z_r)/r_a^7 );
a_44 = -((perm_vak_4pi*m_2*m_0)/I_1) * ( (12*z_r^2)/r_a^5 - 4/r_a^3 );
a_51 = ((perm_vak_4pi*m_2*m_0)/I_2) * ( (12*z_r)/r_a^5 - (60*a^2*z_r)/r_a^7 );
a_55 = ((perm_vak_4pi*m_2*m_0)/I_2) * ( 4/r_a^3 - (12*z_r^2)/r_a^5 );

A = [ 0     0     0     0     1     0     0     0;
      0     0     0     0     0     1     0     0;
      0     0     0     0     0     0     1     0;
      0     0     0     0     0     0     0     1;
      a_11  0     0     a_15  0     0     0     0;
      0     a_22  a_24  0     0     0     0     0;
      0     a_42  a_44  0     0     0     0     0;
      a_51  0     0     a_55  0     0     0     0];

%% B 
% matice øízení
  
r_b = sqrt(a^2+z_r^2);
b_11 = -((3*perm_vak_4pi*m_0*Ks)/m) * ( -(2*a)/r_b^5 + (10*a*z_r^2)/r_b^7 );
b_22 = -((3*perm_vak_4pi*m_0*Ks)/m) * ( -(2*a)/r_b^5 + (10*a*z_r^2)/r_b^7 );
b_42 = ((perm_vak_4pi*m_0*Ks)/I_1) * ( -(6*a*z_r)/r_b^5 );
b_51 = ((perm_vak_4pi*m_0*Ks)/I_2) * ( (6*a*z_r)/r_b^5 );

B = [0 0 0 0 b_11 0    0    b_51;
     0 0 0 0 0    b_22 b_42 0   ]';
 
%% C 
% matice výstupu stavu

c_11 = perm_vak_4pi*m_0 * ( (-3*z_r*(-4*s^2+z_r^2))/(s^2+z_r^2)^(7/2) );
c_15 = perm_vak_4pi*m_0 * ( (3*s^2)/(s^2+z_r^2)^(5/2) - 1/(s^2+z_r^2)^(3/2) );
c_22 = c_11;
c_24 = -c_15;

C = [c_11 0    0    c_15 0 0 0 0;
     0    c_22 c_24 0    0 0 0 0];

%% D 
% matice výstupu øízení
 
D = zeros(2, 2);

%% LQR
% stavová zpìtná vazba s maticí K urèená metodou LQR

Q = [1 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0;
     0 0 0 1 0 0 0 0;
     0 0 0 0 0.01 0 0 0;
     0 0 0 0 0 0.01 0 0;
     0 0 0 0 0 0 0.01 0;
     0 0 0 0 0 0 0 0.01];
R = [1 0;
     0 1];

K = lqr(A, B, Q, R);

%% Test symetrie systému

G = [0 1;
     1 0];
 
T = [0 1 0 0 0 0 0 0;
     1 0 0 0 0 0 0 0;
     0 0 0 -1 0 0 0 0;
     0 0 -1 0 0 0 0 0;
     0 0 0 0 0 1 0 0;
     0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 -1;
     0 0 0 0 0 0 -1 0];
 
if isequal(T*A,A*T) && isequal(T*B,B*G) && isequal(T*B(:,1),B(:,2)) && isequal(T*B(:,2),B(:,1)) && isequal(Q,T'*Q*T) && isequal(R,G'*R*G)
    disp('Symetrie - OK')
else
    disp('Symetrie - CHYBA')
end

%% Rekonstruktor stavu
% výpoèet ziskové matice Kr

Q_r = 10*eye(8);
R_r = 0.01*eye(2);

Kr = (lqr(A',C',Q_r,R_r))';
