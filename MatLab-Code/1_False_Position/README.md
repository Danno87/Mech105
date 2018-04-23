# False_Position README

falsePosition.m is a function that can be used to find the roots of some function with the given inputs by using the false position and 2 guesses for x where the root will lie between the x brackets. This function will look to see if sign change and if too little inputs are
used and if so will give out an error.
#### MAKE SURE TO ASSIGN ALL VALUES TO YOUR FUNCTION BEFORE RUNNING for HW9 u,m,g,F need to have values and the function needs to be anonymous

## Inputs 
### func- The function being evaluated in the format of an anonymous function and after the @ is any var you want to have replaced later by xl or xu
 
 example from HW9 would be
(Varible name you wantto call in function) = @(x) ((u*m*g)/(cosd(x)+u*sind(x)))-F
 this will already be in degrees if radians is wanted instead use cos and
 sin instead of cosd and sind
### xl - the lower guess (Bracket)
### xu - the upper guess (Bracket)
### es - the desired relative error(default is 0.0001%)
### maxiter - the number of iterations desired(default is 200)

## Outputs
to have results use to call out[root,fx,ea,iter]=falsePosition(inputs)
### root - the estimated root location
### fx - the function evaluated at the root location
### ea - the approximate relative error(%)
### iter- how many iterations were performed

## Limitations
Right now this function will come to the right answer, but will take twice as long because of a flaw in the replacment boundry issue.
