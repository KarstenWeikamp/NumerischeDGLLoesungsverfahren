function [x,yaus] = heun(ableitung, startvektor_y, xstart, xend, step)
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
%Schrittweite
h=(xend-xstart)/(step);

%Diskreter x-Vektor
x= linspace(xstart,xend,step);
y= {};
yaus=startvektor_y(1);
y{1}=startvektor_y;

%% Rekursion
for i=2:step
    %Prädiktor
    y1{i}=y{i-1}+h*f_symb(ableitung,x(i-1),y{i-1});
    y{i}=y{i-1}+0.5*h*(f_symb(ableitung,x(i-1),y{i-1})+f_symb(ableitung,x(i),y1{i}));
    
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