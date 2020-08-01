clear;
clc;
syms h Tg1 Tg2 Tg3 Tg4 theta1 theta2 theta3 theta4 theta T2 T1 phi G
eq1 = 90*(2-h) == Tg1*sin(theta1);
eq2 = 3.22*10^4*h-10^4 == Tg1*cos(theta1);
eq3 = Tg1*cos(theta1) == Tg2*cos(theta2)+79.874;
eq4 = Tg2*cos(theta2) == Tg3*cos(theta3)+79.874;
eq5 = Tg3*cos(theta3) == Tg4*cos(theta4)+79.874;
eq6 = Tg1*sin(theta1) == Tg2*sin(theta2);
eq7 = Tg2*sin(theta2) == Tg3*sin(theta3);
eq8 = Tg3*sin(theta3) == Tg4*sin(theta4);
eq9 = T2*cos(theta)+12275.47+G == Tg4*cos(theta4);
eq10 = T2*sin(theta) == Tg4*sin(theta4);
eq11 = T2*cos(theta) == T1*cos(phi)+1543.5;
eq12 = T1*sin(phi) == T2*sin(theta);
eq13 = T2*sin(theta)/7*(sqrt(1+(cot(theta))^2)-sqrt(1+(cot(phi))^2))+cos(theta)+cos(theta1)+cos(theta2)+cos(theta3)+cos(theta4)+h == 18;
result = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10, eq11, eq12, eq13);
