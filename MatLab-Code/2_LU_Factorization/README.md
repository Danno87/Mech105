# LU Factorization README
### (with Partial Pivoting)
luFactor.m is used to decompose a 3x3 matrix to it's upper and lower triangular matrix and the piviot matrix. It will use partial piviting in nessary otherwise the function will skip this step. Just priovide a 3x3 matrix.

## the function should be typed as such [L,U,P] = luFactor(A)

### Errors included will be checking if it is a 3x3, a square matrix, and if too little inputs are used. 

## Inputs A = a 3x3 Matrix of constants 

## Outputs
### L = Lower triangular matrix
### U = Upper triangular martix
### P = Piviot matrix

## Limitations
This is only to be used with a 3x3 and has not been fixed with for loops to undergo anything else as I'm unable to understand how matlab goes about it and with adding partial piviting to the 2nd colum.
