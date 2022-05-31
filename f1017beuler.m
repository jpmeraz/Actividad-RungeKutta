close all
clear all
clc


%Variables
M = 0.02 % Kg
R = 100 % Ohms
L = 0.3 % metros
B = 2.5 % Teslas
tf = 15;

%Intervalos de t
n = 1000;

%Valores iniciales
t0 = 0;
x0 = 0; %Corriente 1
y0 = 0.2; %Velocidad Inicial ms^-2

%Función
f = @(t,x,y) y;
g = @(t,x,y) -(((B^2)*(L^2)*y)/(R*M));

%Llamado de función
[t,x,y] = rungekuttadoble(f, g, t0, tf, x0, y0, n)

figure(1)
hold on
g1 = plot(t,y)
l1 = "Velocidad"
g2 = plot(t,x)
l2 = "Aceleración"


legend([g1,g2], [l1,l2]);

hold off