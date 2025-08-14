% function Panda_run(traj,kp)
% clear;
close all;
clc;
load traj1.mat;
traj=traj1;

% load traj1_delay3.mat
% traj_c=traj1_delay3;

% load traj_Clover_delay.mat
% traj_c=traj_Clover_delay;

load traj_Rose3_delay.mat;
traj_c=traj_Rose3_delay;


% load P.mat;
% invP=inv(P*P')*P;

%%
SD = 0.00; % standard derivation
vari = SD^2; % noise variance



%% for controller

basepar=baseparmes();

fricpar=FrictionPar();

robot_par=[basepar;fricpar];

N=length(robot_par);
% basepar=[basepar;fricpar];

Ts = 0.001; Umax = 500;

taud = 23; % integral duration
Lambda=10*eye(7);
Kc =diag([20,20,20,20,8,8,5]);%*0.02; % control gains
% Kc =diag([20,20,15,15,8,8,5]);


GammaW = 0.2*eye(N);
% alpha=5;
% alpha2=10;
alpha=75;
alpha2=25;
diff_alpha1=75;
diff_alpha2=20;
kapa1=1;kapa2=0;

P0=0.2;  % Decreasing Kc for Regressor and High delay
% P0=0.15;  % Decreasing Kc for Low delay


P1=1;    % Decreasing Lambda

q0=[0, -0.60, 0, -2.25, 0, 1.5, 0.8]'
q1=traj_c.qd.Data(:,1,1)
% q1=q0;
% q1=[0, -pi/6, 0, -3*pi/4, 0 ,pi, pi/4]';
% q0=traj.qd.Data(:,:,1);
% q0=traj.qd.Data(1,:)';
I=eye(7);



f=30;