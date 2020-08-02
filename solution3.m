clear;
clc;
%���α���
% w��ê���ͺ� 
% m1:С��
% m2:��Ͱ
syms h T0 T1 T2 T3 T4 T5 T6 theta0 theta1 theta2 theta3 theta4 theta5 theta6 m1 m2 w
p = 1.025*10^3;
v1 = 36; %������
v2 = 1.5;%���ˮ��
g = 9.8;
Fg = p*g*pi*(50/2)^2*1*10^(-6);%�ֹܸ���
Gg = 10*g;%һ�ڸֹ�����
Gl = m1 * g;%С������ 
Gb = m2 * g;%ê������
Gt = 100*g;%��Ͱ����
Ft1 = p*g*pi*(30/2)^2*1*10^(-4);%��Ͱ����
depth =  16;%ˮ�� ��16-20 ÿ��ѭ���ɸ��� Ȼ��ÿ��ˮ�����ʾһ�ν��

%����
eq1 = 0.625*2*(2-h)*v^2 + 374*2*(2-h)*v^2 == T0*sin(theta0);
eq2 = p*g*h*pi*(2/2)^2 == g*1000+T0*cos(theta0);

%ÿ�ڸֹ�
eq3 = T0*cos(theta0)+Fg == T1*cos(theta1)+Gg;
eq4 = T0*sin(theta0) == T1*sin(theta1);

eq5 = T1*cos(theta1)+Fg == T2*cos(theta2)+Gg;
eq6 = T1*sin(theta1) == T2*sin(theta2);

eq7 = T2*cos(theta2)+Fg == T3*cos(theta3)+Gg;
eq8 = T2*sin(theta2) == T3*sin(theta3);

eq9 = T3*cos(theta3)+Fg == T4*cos(theta4)+Gg;
eq10 = T3*sin(theta3) == T4*sin(theta4);

%��Ͱ
eq11 = T5*cos(theta5)+Gt+Gb == T4*cos(theta4)+Ft;
eq12 = T5*sin(theta5) == T4*sin(theta4);

%ê��
eq13 = T5*cos(theta5) == T6*cos(theta6)+Gl;
eq14 = T5*sin(theta5) == T6*sin(theta6);


eq15 = T5*sin(theta5)/7*(sqrt(1+(cot(theta5))^2)-sqrt(1+(cot(theta6))^2))+cos(theta0)+cos(theta1)+cos(theta2)+cos(theta3)+cos(theta5)+h == depth;

%TODO ����Ϊtest_fun���ã�
result = solve([eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10, eq11, eq12, eq13, eq14, eq15], [h, T0, T1, T2, T3, T4, T5, T6, theta0, theta1, theta2, theta3, theta4, theta5, theta6]);

%m1 ,m2,w ���½�
lb = [0,0,3.2];
ub = [10000,10000 28.12];
options = optimoptions('particleswarm','SwarmSize',5000,'HybridFcn',@fmincon);

%TODO ���޸Ĵ������
x = particleswarm(test_fun(),3,lb,ub,options);

%������Ǻ�m1,m2�ĺ��ε�theta��i�� �� Ti �� h
%TODO ������� m1 m2 w ��theta��i�� �� Ti �� h ���� ��
function z = test_fun(in)
%Ȩ�أ���������
k1 = ;
k2 = ;
k3 = ;
temp = k1*4*1*(cos(theta0)+cos(theta1)+cos(theta2)+cos(theta3))+1*sin(theta5)+ dblquad(@(l,theta)l*sin(theta),0,m2./w,thea5,90-theta6)
   + k2* result.h + k3*theta5;
end


