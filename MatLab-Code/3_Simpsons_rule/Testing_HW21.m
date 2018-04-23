%% Tesing Parimiters 
clc
clear
X = [140:1:149]
X = X'
CDER = [15.72;15.53;15.19;16.56;16.21;17.39;17.36;17.42;17.60;17.75]
OUR = [15.49;16.16;15.35;15.13;14.20;14.23;14.29;12.74;14.74;13.68]
OUR2 = [15.49;16.16;15.35;15.13;14.20;14.23;14.29;12.74;14.74]
X2 = [140:1:148]
X2 = X2'
testodd = 1
CDE = [X,CDER]
OU = [X,OUR]


%% Testing functions

distx= diff(X)
if range(distx) ~= 0 
    error('X values not equally spaced')
else
    warning('Good Job')
end
    
%%Same length arrays
[Xm,Xn] = size(X)
[Ym,Yn] = size(OUR)
if Xm ~= Ym || Xn ~= Yn
    error(' x and y column sizes are not equal')
else
    disp('The grind continues')
end