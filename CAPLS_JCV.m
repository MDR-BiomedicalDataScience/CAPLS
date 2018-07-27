% Training/test set partitioning for CV (with option for repeated-measures scaling)
% [inout,Yn]=CAPLS_JCV(Y,nCV,RM)
% Y = [n,c] or [n,1]
% nCV = scalar
% RM = [n,1]
% inout = [n,nCV] 1 for test object, 0 otherwise for each iteration
% Yn = [n,1] if Y contains information of multiple classes, this is the
%            single variable case
% J.M.P. - 28/05/2015