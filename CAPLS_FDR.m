% ###########################################################################
% #### FDR - False Discovery Rate ###########################################
% #  Function to calculate the Benjamini-Hochberg (BH) and                  #
% #   Storey-Tibshirani (ST) FDR                                            #
% #### BHFDR ################################################################
% #  pFDR=FDR(p)                                                            #
% #     p:    vector with p-values                                          #
% #     pFDR: vector with FDR adjusted p-values of same length as p         #
% #### STFDR ################################################################
% #  qFDR=FDR(p,nBoot)                                                      #
% #     p:    vector with p-values                                          #
% #     nB:   number of bootstrap replicates to use (nB>100)                #
% #     qFDR: vector with q-values                                          #
% #  [~,pi0]=FDR(...)                                                       #
% #     pi0:  proportion of variable that are truly null                    #
% #           based on the bootstrap resampling                             #
% #### Dependencies #########################################################
% #  None                                                                   #
% #  Statistics and Parallel Computing Toolboxes will speed up computations #
% #### References ###########################################################
% #  Y Benjamini, Y Hochberg, (1995) J Stat Roy Soc B Met 57(1):289-300     #
% #  J Storey, R Tibshirani, (2002) PNAS 100(16):9440-9445                  #
% #### Author ###############################################################
% #  <a href="mailto:jmp111@imperial.ac.uk">J.M. Posma</a> - 2012 - Imperial College London                            #
% ###########################################################################