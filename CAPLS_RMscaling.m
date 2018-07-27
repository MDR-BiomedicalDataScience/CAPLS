% X - data matrix [n,p]
% I - subject index [n,1]
% lambda - scaling factor (0<=scalar<=1)
%          (1: within-subject auto-scaling, 0: within-subject mean-centering)
%
% Xr - data matrix scaled for repeated measures [n,p]
% c - centering matrix [n,p]
% v - variance^(1/2) matrix [n,p]
%
% Xr = (X-c)./v
%
% v(i,j)==1 if lambda=0, Xj is constant or if stdev(Xj)=1
%
% J.M.P. - 28/05/2015