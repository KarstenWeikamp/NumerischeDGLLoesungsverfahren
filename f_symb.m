function [f] = f_symb(ableitung, x_w, y_w)
% Auswertung der symbolisch angegebener Funktionstupel an der Stelle (x_w, y_w)
% Beispiel des Funktionsaufrufs:
% [f] = f_symb({'@(x,y) y(2)'; '@(x,y) (y(1)*y(2)-2*x^3)'}, 0, [0 1])

% Input:
%       ableitung              rechte Seite der DGL bzw. des DGLS 
%       x_w                    Stützstelle, an der die Ableitung berechnet wird
%       y_w                    Wert der Funktion an x_w
% 
% Output:
%       f                      Wert(e) der Ableitung(en)


f = zeros(size(ableitung));

anz_gl = size (ableitung);

syms x y;






for i=1:anz_gl
    
    % Gleichungen (rechte Seite) zeilenweise aus Funktionstupel "auslesen"
    f_strich = str2func(cell2mat(ableitung(i)));
    
    % Nummerischen Wert  an der Stelle (x_w, y_w) bestimmen
    f(i)= subs(f_strich(x_w, y_w));
    
end    

end

