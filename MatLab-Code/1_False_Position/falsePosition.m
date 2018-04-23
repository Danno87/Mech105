function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% Created by Daniel Fleischmann
%falsePosition.m is a function that can be used to find the roots of some
%function with the given inputs by using the false position and 2 guesses
%for x where the root will lie between the x brackets.
%MAKE SURE TO ASSIGN ALL VALUES TO YOUR FUNCTION BEFORE RUNNING
%for HW9 u,m,g,F need to have values and the function needs to be anonymous 
%Inputs 
%func - the function being evaluated in the format of an anonymous function
% and after the @ is any var you want to have replaced later by xl or xu
% example from HW9 would be
%(Varible name you wantto call in function) = @(x) ((u*m*g)/(cosd(x)+u*sind(x)))-F
% this will already be in degrees if radians is wanted instead use cos and
% sin instead of cosd and sind
%xl - the lower guess (Bracket)
%xu - the upper guess (Bracket)
%es - the desired relative error(default is 0.0001%)
%maxiter - the number of iterations desired(default is 200)
%Outputs to have results use to call out[root,fx,ea,iter]=falsePosition(inputs)
%root - the estimated root location
%fx - the function evaluated at the root location
%ea - the approximate relative error(%)
%iter- how many iterations were performed
%This function will look to see if sign change and if to little inputs are
%used and if so will give out an error.
% end of help section
format long % change to long format
if nargin <3 % if people just hate doing things right and want answers
    error('not enough inputs min inputs is 3 try again')
elseif nargin == 3 % if es and maxiter not specified
    es = 0.000001; %0.0001 percent
    maxiter = 200;
    disp('Defaults used for es and maxiter')
elseif nargin ==4 % if maxiter is not specified
    maxiter = 200;
    disp('Default used for maxiter')
end

tstroot = func(xu)*func(xl);
if tstroot>0
    error ('No Root in brackets')
end
iter = 0; % set iteration to 0 as the counter has not begun
re = 100; % relitive error is set to 100 until the first re is 
%actually found
fxu=func(xu);% simplify later parse equations for function x upper
fxl=func(xl);% simplify later parse equations for function x lower
xr = xu; %sets xr to someting for first iteration so old xr has a value 


while re > es && iter < maxiter
    %While loop uses error or max iterations to determine length specified
    %False Position funciton
    oldxr = xr; % keeps last xr to perform Reletive error check
    xr = xu-((fxu*(xl-xu))/(fxl-fxu));%Parse formula  
    %xr = (xl+xu)/2; %bisection replacement
    re = abs((xr-oldxr)/xr); % checks and replaces relitive error for run
    if func(xr)>0
        xu = xr; %replaces xu bound for next iteration
    elseif func(xr)<0 
        xl = xr; %replaces xl bound for next iteration
    else
        %re=0; % sets error to zero and is done
    end
    iter = iter+1; %counter for while loop
end
%finishing by chagine varibles to output names
root = xr;
fx = func(xr);
ea = re*100; %changing to percent

end

