%% Rungue-Kutta dos funciones 

function [t,x,y] = rungekuttadoble(f, g, t0, tf, x0, y0, n)
    %Intervalo entre valores "h"
    h = (tf-t0)/n;
    %Matriz de tiempo con espaciado h
    t = t0:h:tf;
    %Matriz con 0, memory allocation
    x=zeros(1,n+1);
    y=zeros(1,n+1);
    
    x(1) = x0;
    y(1) = y0;
    %Método de Euler
    for i = 1:n
        k1 = h * f(t(i), x(i), y(i));
        l1 = h * g(t(i), x(i), y(i));
        k2 = h * f((t(i)+(h/2)), (x(i)+(k1/2)), (y(i)+l1/2));
        l2 = h * g((t(i)+(h/2)), (x(i)+(k1/2)), (y(i)+l1/2));
        k3 = h * f((t(i)+(h/2)), (x(i)+(k2/2)), (y(i)+l2/2));
        l3 = h * g((t(i)+(h/2)), (x(i)+(k2/2)), (y(i)+l2/2));
        k4 = h * f((t(i)+h), (x(i)+k3), (y(i)+l3));
        l4 = h * g((t(i)+h), (x(i)+k3), (y(i)+l3));
        
        x(i+1) = x(i) + (1/6)*(k1+k4+(2*(k3+k2)));
        y(i+1) = y(i) + (1/6)*(l1+l4+(2*(l3+l2)));
        
    end
end