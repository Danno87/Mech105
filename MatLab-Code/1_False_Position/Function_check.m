%% test parse function checking sanity
clc
clear
u = 0.55;
g = 9.81;
m = 25;
F= 150; % in kg
ang = 66.8176%in degrees
test2= ((u*m*g)/(cosd(ang)+u*sind(ang)))-F
%% AF function test
test = @(x) ((u*m*g)/(cosd(x)+u*sind(x)))-F
%% assign variables for function false position test
clc
clear
u = 0.55;
g = 9.81;
m = 25;
F= 150; % in kg
test = @(x) ((u*m*g)/(cosd(x)+u*sind(x)))-F

%% fprint

fprintf('%d\n',root);
fprintf('%d\n',(fx));
fprintf('%d\n',(ea));
fprintf('%d\n',(iter));%prints outputs