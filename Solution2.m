clear;
clc;
syms h T0 T1 T2 T3 T4 T5 T6 theta0 theta1 theta2 theta3 theta4 theta5 theta6
p = 1.025*10^3;
v = 12;
g = 9.8;
Fg = p*g*pi*(50/2)^2*1*10^(-6);
Gg = 10*g;
Gl = 7*22.05*g;
Gb = g*1200;
Gt = 100*g;
Ft = p*g*pi*(30/2)^2*1*10^(-4);
eq1 = 0.625*2*(2-h)*v^2 == T0*sin(theta0);
eq2 = p*g*h*pi*(2/2)^2 == g*1000+T0*cos(theta0);
eq3 = T0*cos(theta0)+Fg == T1*cos(theta1)+Gg;
eq4 = T0*sin(theta0) == T1*sin(theta1);
eq5 = T1*cos(theta1)+Fg == T2*cos(theta2)+Gg;
eq6 = T1*sin(theta1) == T2*sin(theta2);
eq7 = T2*cos(theta2)+Fg == T3*cos(theta3)+Gg;
eq8 = T2*sin(theta2) == T3*sin(theta3);
eq9 = T3*cos(theta3)+Fg == T4*cos(theta4)+Gg;
eq10 = T3*sin(theta3) == T4*sin(theta4);
eq11 = T5*cos(theta5)+Gt+Gb == T4*cos(theta4)+Ft;
eq12 = T5*sin(theta5) == T4*sin(theta4);
eq13 = T5*cos(theta5) == T6*cos(theta6)+Gl;
eq14 = T5*sin(theta5) == T6*sin(theta6);
eq15 = T5*sin(theta5)/7*(sqrt(1+(cot(theta5))^2)-sqrt(1+(cot(theta6))^2))+cos(theta0)+cos(theta1)+cos(theta2)+cos(theta3)+cos(theta5)+h == 18;
result = vpasolve([eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10, eq11, eq12, eq13, eq14, eq15], [h, T0, T1, T2, T3, T4, T5, T6, theta0, theta1, theta2, theta3, theta4, theta5, theta6]);
disp('h');
disp(result.h);
disp('T0');
disp(result.T0);
disp('T1');
disp(result.T1);
disp('T2');
disp(result.T2 );
disp('T3');
disp(result.T3);
disp('T4');
disp(result.T4);
disp('T5');
disp(result.T5);
disp('T6');
disp(result.T6);
disp('theta0');
disp(format(result.theta0));
disp('theta1');
disp(format(result.theta1));
disp('theta2');
disp(format(result.theta2));
disp('theta3');
disp(format(result.theta3));
disp('theta4');
disp(format(result.theta4));
disp('theta5');
disp(format(result.theta5));
disp('theta6');
disp(format(result.theta6));

function thetaO = format(thetaI)
    thetaI = double(thetaI);
    while(thetaI >= 2*pi)
        thetaI = thetaI-2*pi;
    end
    while(thetaI <= 0)
        thetaI = thetaI+2*pi;
    end
    thetaO = thetaI/pi*180;
end