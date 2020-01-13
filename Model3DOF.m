delete(instrfindall);    %limpa todos os instrumentos anterioarmente abertos na serial
clear all;
close all;
clc;

%Control Robot Arm with 3DoF(RRR) with Arduino and simulation with MATLAB

% Convert Degree -> Radians: GUI
% Th_1 = str2double(handles.Theta_1.String)*pi/180;
% Th_2 = str2double(handles.Theta_2.String)*pi/180;
% Th_3 = str2double(handles.Theta_3.String)*pi/180;

%Link Distance
L_0 = 30;           %Distance Plan-0 and Junta1
L_1 = 30;           %Distance Junta1 and Junta2
L_2 = 90;           %Distance Junta2 and Junta3
L_3 = 120;          %Distance Junta3 and End-efector

% Denavid-Hatenberg Params
L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

% Create Robot and Plot
Robot = SerialLink(L);
Robot.name = 'TEST_3_D_o_F';
Robot.base = transl(0, 0, L_0);
Robot.plot([0 0 0], 'workspace', [-300 300, -300 300, -300 300],'tilesize',100);
% Robot.teach();

% Matrix Forward Kinematics
T = Robot.fkine([45 45 45], 'deg').double();

Taux=transl(150, 80, 0)*trotx(pi);
% qn = [0 0.6 -1];
% q = Robot.ikine(Taux, qn, [1 1  0 1]);

[J, err] = Robot.ikcon(Taux);

Robot.plot([0 0 0], 'workspace', [-300 300, -300 300, -300 300],'tilesize',100);
grid minor
T0 = [1 0 0 100;
        0 1 0 0;
        0 0 1 50;
        0 0 0 1];
    
T1 = [1 0 0 0;
0 1 0 100;
0 0 1 50;
0 0 0 1];
ts = 30;
J = [100 0 50];
tc = ctraj(T0, T1, ts);
tj = jtraj(T0, T1, 3);
% T = transl(p) * troty(pi/2);
qi = [0 0 0];
qf = [pi/2 -pi/2 0];
t = 0:0.1:3;

qj = jtraj(qi, qf, t);

% qqr = Robot.ikine(T1, 'q0', J, 'mask',[1, 1, 1, 0, 0, 0], 'rlimit',300);
% qrt = jtraj(qr, qqr, 5);
% ae = [138 8];
% for i = 1:ts
%     J = Robot.ikine(tc(:, :,i), 'q0', [J(1) J(2) J(3)], 'mask',[1, 1, 1, 0, 0, 0], 'rlimit',300);
%     Robot.animate(J);
%     pause(0.25)
% end
Robot.animate(qj);