function [x, yaus] = runge_kutta(ableitung, startvektor_y, xstart, xend, step)
%% Funktionsbeschreibung
% Realisierung des Range-Kutta-Verfahren
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
h=0.25;
y= zeros(2,length(x));
yaus=startvektor_y(1);
y(1,1)=startvektor_y(1);
y(2,1)=startvektor_y(2);

for i=1:step
    k1=h*f_symb(ableitung,x(i),y(:,i));
    k2=h*f_symb(ableitung,x(i)+0.5*h,y(:,i)+0.5*k1);
    k3=h*f_symb(ableitung,x(i)+0.5*h,y(:,i)+0.5*k2);
    k4=h*f_symb(ableitung,x(i)+h,y(:,i)+k3);
    y(:,i+1)=y(:,i)+(1/6)*(k1+2*k2+2*k3+k4);
    yaus(i+1)=y(1,i+1);
    
    
    %Ausgabe
    if(i<=4)
        fprintf("=== Schritt %i ===\n",i+1)
        fprintf("x = %1.02f \n",x(i+1))
        fprintf("y1 = %1.02f \n", y(1,i+1))
        fprintf("y2 = %1.02f \n", y(2,i+1))
    end
end  