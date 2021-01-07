function [x,y] = euler(ableitung, startvektor_y, xstart, xend, schritte)
% Input:
%     ableitung       rechte seite des DGL systems als cell array
%     startvektor_y   Vektor mit Anffangswerten der gesuchten Funktion
%     xstart          Erste Stützstelle
%     xend            Letzte Stützstelle
%     schritte        Anzahl der Schritte
%     
% Output:
%     x               Stützstellenvektor im Intervall [xstart; xend]
%     y               Werte der gesuchten Funktion

