function [Robot_model, L] = mountRobot(dof, a1, a2, a3, a4, alpha1, alpha2, alpha3, alpha4, d1, d2, d3, d4)
%Recebe dados do Manipulador em DH e retorna a Estrutura do Robô e os Links

switch dof
    case 1
        L(1) = Link([0 d1 a1 deg2rad(alpha1) 0], 'standard');
        
        L(1).m = 4.43;
        L(1).r = [ 0 0 -0.08];
        L(1).I = [ 0.195 0.195 0.026 0 0 0];
        L(1).qlim=[deg2rad(-90) deg2rad(90)];
        
        Robot_model = SerialLink(L);
        Robot_model.name = 'ROBOT_1_D_o_F';
    case 2
        L(1) = Link([0 d1 a1 deg2rad(alpha1) 0], 'standard');
        L(2) = Link([0 d2 a2 deg2rad(alpha2) 0], 'standard');
        L(1).m = 4.43;
        L(2).m = 10.2;
        L(1).r = [ 0 0 -0.08];
        L(2).r = [ -0.216 0 0.026];
        L(1).I = [ 0.195 0.195 0.026 0 0 0];
        L(2).I = [ 0.588 1.886 1.470 0 0 0];
        L(1).qlim=[deg2rad(-90) deg2rad(90)];
        L(2).qlim=[deg2rad(-90) deg2rad(90)];
        Robot_model = SerialLink(L);
        Robot_model.name = 'ROBOT_2_D_o_F';
    case 3
        L(1) = Link([0 d1 a1 deg2rad(alpha1) 0], 'standard');
        L(2) = Link([0 d2 a2 deg2rad(alpha2) 0], 'standard');
        L(3) = Link([0 d3 a3 deg2rad(alpha3) 0], 'standard');
        
        L(1).m = 4.43;
        L(2).m = 10.2;
        L(3).m = 4.8;
        
        L(1).r = [ 0 0 -0.08];
        L(2).r = [ -0.216 0 0.026];
        L(3).r = [ 0 0 0.216];
        
        L(1).I = [ 0.195 0.195 0.026 0 0 0];
        L(2).I = [ 0.588 1.886 1.470 0 0 0];
        L(3).I = [ 0.324 0.324 0.017 0 0 0];
        
        L(1).qlim=[deg2rad(-90) deg2rad(90)];
        L(2).qlim=[deg2rad(-90) deg2rad(90)];
        L(3).qlim=[deg2rad(-90) deg2rad(90)];
        
        Robot_model = SerialLink(L);
        Robot_model.name = 'ROBOT_3_D_o_F';
    otherwise
        L(1) = Link([0 d1 a1 deg2rad(alpha1) 0], 'standard');
        L(2) = Link([0 d2 a2 deg2rad(alpha2) 0], 'standard');
        L(3) = Link([0 d3 a3 deg2rad(alpha3) 0], 'standard');
        L(4) = Link([0 d4 a4 deg2rad(alpha4) 0], 'standard');
        
        %massa dos links [g]
        L(1).m = 4.43;
        L(2).m = 10.2;
        L(3).m = 4.8;
        L(4).m = 1.18;
        
        %centro de gravidade
        L(1).r = [ 0 0 -0.08];
        L(2).r = [ -0.216 0 0.026];
        L(3).r = [ 0 0 0.216];
        L(4).r = [ 0 0.02 0];
        
        L(1).I = [ 0.195 0.195 0.026 0 0 0];
        L(2).I = [ 0.588 1.886 1.470 0 0 0];
        L(3).I = [ 0.324 0.324 0.017 0 0 0];
        L(4).I = [ 3.83e-3 2.5e-3 3.83e-3 0 0 0];

        % set limites das juntas
        L(1).qlim=[deg2rad(0) deg2rad(180)];
        L(2).qlim=[deg2rad(0) deg2rad(180)];
        L(3).qlim=[deg2rad(0) deg2rad(180)];
        L(4).qlim=[deg2rad(0) deg2rad(180)];

        Robot_model = SerialLink(L);
        Robot_model.name = 'ROBOT_4_D_o_F';
end


% preach = [0.2, 0.2, 0.3];
% % create links using D-H parameters
% L(1) = Link([ 0 0 0 pi/2 0], 'standard');
% L(2) = Link([ 0 .15005 .4318 0 0], 'standard');
% L(3) = Link([0 .0203 0 -pi/2 0], 'standard');
% L(4) = Link([0 .4318 0 pi/2 0], 'standard');
% %define link mass

% %define center of gravity
% L(1).r = [ 0 0 -0.08];
% L(2).r = [ -0.216 0 0.026];
% L(3).r = [ 0 0 0.216];
% L(4).r = [ 0 0.02 0];
% %define link inertial as a 6-element vector
% %interpreted in the order of [Ixx Iyy Izz Ixy Iyz Ixz]
% L(1).I = [ 0.195 0.195 0.026 0 0 0];
% L(2).I = [ 0.588 1.886 1.470 0 0 0];
% L(3).I = [ 0.324 0.324 0.017 0 0 0];
% L(4).I = [ 3.83e-3 2.5e-3 3.83e-3 0 0 0];
% % set limits for joints
% L(1).qlim=[deg2rad(-160) deg2rad(160)];
% L(2).qlim=[deg2rad(-125) deg2rad(125)];
% L(3).qlim=[deg2rad(-270) deg2rad(90)];
% %build the robot model
% rob = SerialLink(L, 'name','rob');
% qready = [0 -pi/6 pi/6 pi/3   ];
% m = [1 1 1 1 0 0];   % mask matrix
% T0 = fkine(rob, qready);
% t = [0:.056:2];
% % do inverse kinematics

% qreach =  rob.ikine(T0, preach, m); 
% qreach =  rob.ikcon(T0, preach);

% [q,qd,qdd]=jtraj(qready,qreach,t);
% %compute inverse dynamics using recursive Newton-Euler algorithm
% tauf = rne(rob, q, qd, qdd);
% % forward dynamics
% [t1,Q,Qd] = rob.fdyn(2,tauf(5,:),q(5,:), qd(5,:));

end