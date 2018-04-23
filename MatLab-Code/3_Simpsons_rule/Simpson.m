function [I] = Simpson(x,y)
%Simpson function by Daniel Fleischmann
% Inputs must be in a column not a row!!!
% x = the x values of evenly spaced points from xa to xb
% y = the f(x) values that are the answer of the functions
% Outputs
% I = answer from eather simpson 1/3 rule or both simpson 1/3 and trap rule
%
%This function will use you x and y values with respect to x and then apply
%the simpsons 1/3 rule if it has an odd row number, or if the rows are even
%will apply the trapezoidal rule to the last input and add both the
%simpsons and tapezoidal rule for the answer of I.

%% Error checking to make sure inputs meet criteria
format long

if nargin < 2 % this is to check only 2 Inputs are used
    error('To few inputs must provide x and y intups')
elseif nargin > 2
    error (' To many inputs must only provide x and y')
else
    disp('Your a lucky one you may now enter to test if you are worthy')
    
end

% Error checking if x is eaually spaced

distx = diff(x); % Disatance checking of x
if range(distx) ~= 0 
    error('X values not equally spaced')
else
    disp('You have passed the equality test move on to find a friend')
end

% Error Checking is x and y are the same size

[xm,xn] = size(x);
[ym,yn] = size(y);
if xm ~= ym || xn ~= yn
    error(' x and y column sizes are not equal')
else
    disp('x and y are now friends and are the same level')
end

%% Getting all the inputs ready for Simpson formula
OorE = mod(xm,2); % Test for if trap will be used 0=even 1=odd
a = x(1,1); % first number in x column
if OorE == 0 % to change value for if trap needs to be used
    disp('Lost a number to the evil trap monster')
    b = x(xm-1,1); % last number in x column
else
    b = x(xm,1); % last number in x column
end

fx0 = y(1,1); % first number of f(x) or y column
if OorE == 0
    disp('choosing the even path are you sure?')
    fx1 = y(2:2:(ym-1),1); %first sum part
    sfx1 = sum(fx1); % sum of all fx1
    fx2 = y(3:2:(ym-2),1); % second sum part
    sfx2 = sum(fx2); % sum of all fx2
    fx3 = y(ym-1,1); % last variable for simpson 1/3 rule
    n = (xm-2); % with trap
    ta = (xm-1); % Trap a
    tb = (xm); % trap b
    fta = y(ym-1,1); %trap f(x1)
    ftb = y(ym,1); % trap f(x2)
else
    disp ('choosing the odd path are we not all odd?')
    fx1 = y(2:2:(ym-1),1); %first sum part
    sfx1 = sum(fx1); % sum of all fx1
    fx2 = y(3:2:(ym-1),1); % second sum part
    sfx2 = sum(fx2); % sum of all fx2
    fx3 = y(ym,1); % last variable for simpson 1/3 rule
    n = (xm-1); % without trap 
end

%% The Simpson formula
if OorE == 0
    warning('Trapezoidal rule has been used on the last interval')
    simps = (b-a)*((fx0+(4*sfx1)+(2*sfx2)+fx3)/(3*n)); %simpson formula
    trapans = (tb-ta)*((fta+ftb)/2); % trap formula
    
else
    disp(' You doged the trapezodial and move on to fight simpson alone')
    simps = (b-a)*((fx0+(4*sfx1)+(2*sfx2)+fx3)/(3*n)); % simpson formula 

end

%% Output total vectors used

if OorE == 0 % tells is answer needs trap included with answer or not
    I = simps+trapans;
else
    I = simps;
end
    
    
end