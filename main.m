close all
clear all
clc


%Variables
M = 0.02 % Kg
R = 100 % Ohms
L = 0.3 % Metros
B = 2.5 % Teslas
tf = 15; % Segundos

%Intervalos de t
n = 1000;

%Valores iniciales
t0 = 0; % Segundos
x0 = 0; %Posición Inicial m
y0 = 0.2; %Velocidad Inicial ms^-2

% Y Corresponde a la velocidad  
  
%Funciónes
f = @(t,x,y) y;
g = @(t,x,y) -(((B^2)*(L^2)*y)/(R*M));

%Llamado de función Runge Kutta
[t,x,y] = rungekuttadoble(f, g, t0, tf, x0, y0, n)

figure(1)
hold on
g1 = plot(t,y)
l1 = "Velocidad"
g2 = plot(t,x)
l2 = "Aceleración"


legend([g1,g2], [l1,l2]);

hold off
