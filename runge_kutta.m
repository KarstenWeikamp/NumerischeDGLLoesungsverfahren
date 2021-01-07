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
%Schrittweite
h=(xend-xstart)/(step);

%Diskreter x-Vektor
x= linspace(xstart,xend,step);
y= {};
yaus=startvektor_y(1);
y{1}=startvektor_y;


for i=2:step
    k1{i-1}=h*f_symb(ableitung,x(i-1),y{i-1});
    k2{i-1}=h*f_symb(ableitung,x(i-1)+0.5*h,y{i-1}+0.5*k1{i-1});
    k3{i-1}=h*f_symb(ableitung,x(i-1)+0.5*h,y{i-1}+0.5*k2{i-1});
    k4{i-1}=h*f_symb(ableitung,x(i-1)+h,y{i-1}+k2{i-1});
    y{i}=y{i-1}+(1/6)*(k1{i-1}+2*k2{i-1}+2*k3{i-1}+k4{i-1});
    c = y{i};
    yaus(i)=c(1);
    
    
    %Ausgabe
    if(i<=5)
        fprintf("=== Schritt %i ===\n",i)
        fprintf("x = %1.02f \n",x(i))
        fprintf("y1 = %1.02f \n", c(1))
        fprintf("y2 = %1.02f \n", c(2))
    end
end  