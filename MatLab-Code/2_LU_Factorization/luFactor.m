function [L,U,P] = luFactor(A)
%Created by Daniel Fleischmann
%luFactor.m is used to decompose a 3x3 matrix to it's upper and lower 
%triangular matrix and the piviot matrix.
%Inputs
% A = a 3x3 Matrix of constants 
% Outputs
% L = Lower triangular matrix
% U = Upper triangular martix
% P = Piviot matrix
%  This is only to be used with a 3x3 and has not been fixed with for loops
%  to undergo anything else as I'm ubable to understand how matlab goes
%  about it and with adding partial piviting to the 2nd colum.
format long % change to long format in MatLab
%Check for invalid inputs
if nargin <1 && nargin >1
    error ('Use only 1 input martix too many or too few inputs used')
end

% check to make sure varible A is a matrix setup
check = isvector(A);
if check ~= 0
    error ('Error Input must be a matrix char A not a number')
end
% Check to make sure matrix A is square
[r,c] = size(A);
if r ~= c
    error('Matrix is not square')
elseif r ~= 3 && c ~=3
    error('Martrix was only desinged for a 3x3 at the moment since for testing purposes only was a 3x3 and assumed to test many different numbers not sizes of matrixs')
end
Ainv = inv(A);% creates the original inverse of A for piviting later.
v = Ainv*A;
L = diag(v);% create L diagnal 1's and zeros
L = diag(L');% transforms back to array 
U = zeros(r,c);

% First Pivit if needed rows only and A2 is first pivit iteration
[~,row] = max(abs(A(:,1)));
A([1,row],:) = A([row,1],:); % Swaps row 1 with highest value
%first LU step colum 1
L(2,1) = A(2,1)/A(1,1); % first lower number
L(3,1) = A(3,1)/A(1,1); % second lower number
U(2,:) = A(2,:)-(L(2,1)*A(1,:)); % fills in answers for row 2
U(3,:) = A(3,:)-(L(3,1)*A(1,:));
% Second Pivit if needed rows only and U is second pivit iteration
[~,row] = max(abs(U(:,2)));
U([2,row],:) = U([row,2],:); % Swaps row 2 with highest value in Colume2
L([2,row],1) = L([row,2],1);

L(3,2) = U(3,2)/U(2,2); % colum 2 lower number
U(3,:) = U(3,:)-(L(3,2)*U(2,:)); % fills in answers for row 3
U(1,:) = A(1,:); % fill in top row of Upper
% Obtain the piviot identity and clean up so only single positive answer.
Pind = L*U;
Pind = Pind * Ainv;
Pind = abs(Pind);
P = round(Pind);
end

