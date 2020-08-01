% Tm:ê������ Tm(1):�¶� Tm��2���϶�
% Tg���ֹ����� 
%a:ê���ڲ��� a(1)��ê���϶˵���������ֱ����  a(2�����¶�
%b:�ֹ��ڲ��� 
%c:��ˮ���
F_wind = @(x,y)(2-y).*2 .* 0.625.*x.^2;
m = [1000 10 100 1200 22.05*7];
h = [2 1 1];
r = [1 0.055 0.15];
p = 1025;%��ˮ�ܶ�
k = [];%����Ħ��ϵ��
number_of_steel = 4;
number_of_chain = 50;
function F = solve_power(Tm,Tg,a,b,c)

%ê�������������
    F(1) =  Tm(2)* cos(a(1))- m(5)*g - Tm(1)*cos(a(2));
    F(2) =  Tm(1)*sin(a(2)) -  Tm(2)*sin(a(1));

%��Ͱ
F(3) = Tm(2)*cos(a(1)) + m(3)*g + m(4)*g - Tg(4)*cos(b(4)) - p*g*pi*r(3)^2*h(3);
F(4) = Tm(2)*sin(a(1)) - Tg(4)*sin(b(4));

%����
F(5) = F_wind(12,c) - Tg(1)* sin(b(1));
F(6) = p*g*pi*r(1)^2 *c- m(1)*g -T(1) * cos(b(1));

%���
F(7)= c + @(i)sum(h(2)*cos(b(i))) + Tm(2)*sin(a(1))*(sqrt(1+ cot(a(1))^2)-sqrt(1+ tan(a(2))^2)) + cos(a(1))*h(3);
%�ֹ�
for i = 1:number_of_steel
    F(i + 7) = Tg(i)* cos(b(i))+  p*g*pi*r(3)^2 *h(3)- m(5)*g - Tg(i+1)*cos(b(i+1));
    F(i + 7 + number_of_steel ) = Tg(i)*sin(b(i)) -  Tg(i+1)*sin(b(i+1));
end

end

