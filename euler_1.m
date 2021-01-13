function [x, yaus] = euler_1(ableitung, startvektor_y, xstart, xend, step)
%% Funktionsbeschreibung
% Realisierung des Euler-Cauchy-Verfahren
%Input:
%     ableitung       rechte seite des DGL systems als cell array
%     startvektor_y   Vektor mit Anffangswerten der gesuchten Funktion
%     xstart          Erste Stützstelle
%     xend            Letzte Stützstelle
%     schritte        Anzahl der Schritte
%     
% Output:
%     x               Stützstellenvektor im Intervall [xstart; xend]
%     y               Werte der gesuchten Funktion

%% Initialisierung

%Diskreter x-Vektor
x= linspace(xstart,xend,step+1);
h=diff(x);
y= zeros(2,length(x));
yaus=startvektor_y(1);
y(1,1)=startvektor_y(1);
y(2,1)=startvektor_y(2);

%% Rekursion
for i = 1:step
    y(:,i+1)=y(:,i)+h(i)*f_symb(ableitung,x(i),y(:,i));
    yaus(i+1)=y(1,i+1);
    
    
    %Ausgabe
    if(i<=5)
        fprintf("=== Schritt %i ===\n",i+1)
        fprintf("x = %1.02f \n",x(i+1))
        fprintf("y1 = %1.02f \n", y(1,i+1))
        fprintf("y2 = %1.02f \n", y(2,i+1))
    end
end  