% Random Matrix Theory (RMT) to estimate number of significant components
%   of square input matrix X, by calculating the theoretical eigenvalue
%   distribution of matrix X
%-------------------------------------------------------------------------
% X = association matrix (dim [n,n])
% J = numerically computed Jacobian matrix (dim [n*(n+1)/2,n*(n+1)/2])
% m = no. eigenvalues X larger than the maximum of theoretical eigenvalues
%   of random matrices
%-------------------------------------------------------------------------
% Recommendation: if data from X is auto-scaled in the analysis, X would
%   ideally be the correlation matrix, if it is only mean-centered it can
%   be the covariance matrix
% J.M.P. - 10/10/2013