clear;
clc;
%含参变量
% w：锚链型号 
% m1:小球
% m2:钢桶
syms h T0 T1 T2 T3 T4 T5 T6 theta0 theta1 theta2 theta3 theta4 theta5 theta6 m1 m2 w
p = 1.025*10^3;
v1 = 36; %最大风速
v2 = 1.5;%最大水速
g = 9.8;
Fg = p*g*pi*(50/2)^2*1*10^(-6);%钢管浮力
Gg = 10*g;%一节钢管重力
Gl = m1 * g;%小球重力 
Gb = m2 * g;%锚链重力
Gt = 100*g;%钢桶重力
Ft1 = p*g*pi*(30/2)^2*1*10^(-4);%钢桶浮力
depth =  16;%水深 ：16-20 每次循环可更改 然后每次水深可显示一次结果

%浮标
eq1 = 0.625*2*(2-h)*v^2 + 374*2*(2-h)*v^2 == T0*sin(theta0);
eq2 = p*g*h*pi*(2/2)^2 == g*1000+T0*cos(theta0);

%每节钢管
eq3 = T0*cos(theta0)+Fg == T1*cos(theta1)+Gg;
eq4 = T0*sin(theta0) == T1*sin(theta1);

eq5 = T1*cos(theta1)+Fg == T2*cos(theta2)+Gg;
eq6 = T1*sin(theta1) == T2*sin(theta2);

eq7 = T2*cos(theta2)+Fg == T3*cos(theta3)+Gg;
eq8 = T2*sin(theta2) == T3*sin(theta3);

eq9 = T3*cos(theta3)+Fg == T4*cos(theta4)+Gg;
eq10 = T3*sin(theta3) == T4*sin(theta4);

%钢桶
eq11 = T5*cos(theta5)+Gt+Gb == T4*cos(theta4)+Ft;
eq12 = T5*sin(theta5) == T4*sin(theta4);

%锚链
eq13 = T5*cos(theta5) == T6*cos(theta6)+Gl;
eq14 = T5*sin(theta5) == T6*sin(theta6);


eq15 = T5*sin(theta5)/7*(sqrt(1+(cot(theta5))^2)-sqrt(1+(cot(theta6))^2))+cos(theta0)+cos(theta1)+cos(theta2)+cos(theta3)+cos(theta5)+h == depth;

%TODO ：变为test_fun可用？
result = solve([eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10, eq11, eq12, eq13, eq14, eq15], [h, T0, T1, T2, T3, T4, T5, T6, theta0, theta1, theta2, theta3, theta4, theta5, theta6]);

%m1 ,m2,w 上下界
lb = [0,0,3.2];
ub = [10000,10000 28.12];
options = optimoptions('particleswarm','SwarmSize',5000,'HybridFcn',@fmincon);

%TODO 需修改传入参数
x = particleswarm(test_fun(),3,lb,ub,options);

%输入的是含m1,m2的含参的theta（i） 和 Ti 和 h
%TODO 输入参数 m1 m2 w 与theta（i） 和 Ti 和 h 关联 ？
function z = test_fun(in)
%权重：自行设置
k1 = ;
k2 = ;
k3 = ;
temp = k1*4*1*(cos(theta0)+cos(theta1)+cos(theta2)+cos(theta3))+1*sin(theta5)+ dblquad(@(l,theta)l*sin(theta),0,m2./w,thea5,90-theta6)
   + k2* result.h + k3*theta5;
end


