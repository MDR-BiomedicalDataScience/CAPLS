% CAPLS - "Covariate-Adjusted Projections to Latent Structures"
%   Joram M. Posma (2013-2019)
% 
% model=CAPLS(X,Y,plab,varargin)
% 
% (X,Y,plab) are needed, if plab is not a ppm vector, then it is assumed it's related to MS -> different plot (first row is time, second is m/z)
% 
% Optional inputs:
%   'C' 'cvr' 'part' 'osc' 'scal' 'nBoot' 'alp' 'mtest' 'mcomp' 'RCVt' 'Q2Ct' 'RM'
% Defaults:
%   []  10    10     0    'mc'    25      0.05  'bo'    2       0.25   0.1    []
% 
% Inputs:
%
% Data matrix
%   X=[n,p]
% Outcome variable
%   Y=[n,1]
% Variable labels
%   plab=[1,p] (or [2,p] for MS)
% 
% Matrix of covariates
%   C=[n,m]
% Number of cross-validation rounds
%   cvr=[1,1]
% Partitioning of the data
%   part=[1,1]
% Perform Orthogonal Signal Correction on X
%   osc=[1,1] % 0 (PLS), 1(OPLS)
% Number of bootstrap resamplings for estimating Beta variance in unbiased manner
%   nBoot=[1,1]
% Significance level
%   alp=[1,1]
% Type of multiple testing
%   mtest='bh', 'st', 'si'
% Type of scaling
%   scal='mc' (0), 'as' (1), 'pa' (0.5)
% Maximum number of components to consider
%   mcomp=[1,1]
% Threshold for the robustness of cross-validation
%   RCVt=[1,1] the higher the closer Q2Y has to be to R2Y
% Threshold to include a confounder
%   Q2Ct=[1,1]
% Sample ID for repeated-measures design
%   RM=[n,1] each sample must have at least two measurements
% 
% Examples:
% 
% model=CAPLS(X,Y,ppm);                     % NMR
% model=CAPLS(X,Y,[time;mz]);               % MS
% model=CAPLS(X,Y,1:size(X,2));             % targeted data
% model=CAPLS(X,Y,ppm,'C',C);               % add covariate adjustment for variable(s) in matrix C
% model=CAPLS(X,Y,ppm,'mtest','st');        % different type of multiple testing
% model=CAPLS(X,Y,ppm,'cvr',1000,'part',7); % MCCV with 1000 rounds and leaving 1/7th of the data out in each iteration
% 
% Notes:
% How to do MCCV: make cvr bigger than part
%   e.g. cvr = 100 and part = 5 is MCCV of 100 iterations with 1/5th of the data left out
%       for validation at each iteration
% Algorithm will try to start the Parallel Computing Toolbox to speed it up, it is recommended
%   to start it yourself before running the algorithm (as it will also shut it down if it was
%   not already running)
% The first variable importance plot requires bootstrap resampling to get an unbiased estimate
%   from the Beta variance, a low number of MCCV iterations can result in variables not being
%   considered significantly contributing to the model (even if the model is good) as there
%   may be large variance of individual coefficients. Likewise, it can occur that a bad model
%   still results in some variables having a consistent beta sign and magnitude. When this
%   happens check with univariate methods what these variables explain from the outcome, if
%   found significant there it means there is too much noise in the PLS model for it to give
%   a good predictive model. Penalized regression techniques can be the next step to try.
% 
% References
%   cite (MCCV design, CAPLS, RCV):
%       JM Posma, et al. (2018) Journal of Proteome Research 17(4): 1586–1595 doi: 10.1021/acs.jproteome.7b00879
%   cite (MCCV method and RM design):
%       I Garcia-Perez and JM Posma, et al. (2017) The Lancet Diabetes & Endocrinology 5(3): 184–195, doi: 10.1016/S2213-8587(16)30419-3
%   cite (Skyline plot):
%       P Elliott and JM Posma, et al. (2015) Science Translational Medicine 7: 285ra62, doi: 10.1126/scitranslmed.aaa5680