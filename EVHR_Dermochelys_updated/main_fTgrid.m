% modeling food and temp for plotting as a grid!  script by Nina Marn
% last modified: 2024-Sep-19
% (Type 2 simulations)

clear all 
load results_fT.mat
close all
datelog = date;
% DONT FORGET TO SAVE (here and last line) -- this will overwrite the previous results!
 save ('results_fTgrid2.mat', 'datelog')


 %% 1 - initialize time, parameters, etc
  simu = init ;
     K1 = simu.cPar.K; T_env = simu.Tinit;    Xinit = simu.finit .* simu.cPar.K ./ (1-simu.finit)
%      Xinit = f .* simu.par(22) ./ (1-f);  % f = x/ (1+x) = X/K / (1 + X/K)
% T = T_env;

%% simulate conditions
%     mdfyX = [0.5 0.7 0.8 0.9 1 1.2 1.5 2]; % food (ff)
limit = 11; % this will simulate current conditions +15points lower and 15points higher than current
    mdfyX = [linspace(0.5,1,limit) linspace(1,2,limit)] ; % to ensure f is simulated
    mdfyX(limit) = [] ;% food(ff) with the double entry removed

  % Ts= [14 16 18 20 22 24 26 28 30];  % different temperature (tt)
 Ts = [linspace(C2K(14),T_env,limit) linspace(T_env,C2K(30),limit)] ; % to ensure T is simulated
    Ts(limit) = [] ; % temp(tt) with the double entry removed

    % initialize outputs                            
 imsc.Li = zeros(length(mdfyX), length(Ts)); 
 imsc.Wi = zeros(length(mdfyX), length(Ts)); 
 imsc.Ri = zeros(length(mdfyX), length(Ts)); 
 imsc.cumF = zeros(length(mdfyX), length(Ts)); 
 imsc.ap = zeros(length(mdfyX), length(Ts)); 
 imsc.Lp = zeros(length(mdfyX), length(Ts)); 
 imsc.Wp = zeros(length(mdfyX), length(Ts)); 
 res(length(mdfyX),length(Ts)).tLWR = zeros(0, 4); 
 
 %%% 
    for ff = 1: length(mdfyX)
          Xinit2 =  Xinit * mdfyX(ff);
            f2(ff)= Xinit2/(Xinit2+K1); simu.Xinit = Xinit2;
             fprintf('Current food is %2.5f \n', f2(ff))
             
         for tt = 1: length(Ts)
            simu.Tinit = Ts(tt);    
             fprintf('Current temperature is %2.2f C\n', Ts(tt)-273.15)
             
            %% 2 - calculate state variables
            simu.tEVHR = indiv(simu);
              % spawning date indices
             % i_sp = find(and((E_R == 0),(E_H>=E_Hp)));
            i_sp = find(and((simu.tEVHR(:,5) == 0),( simu.tEVHR(:,4)>=simu.par.E_Hp) ) ) ;
            i_sp = i_sp - 1 ; % look at the preceding line with E_R value before spawning
            
            
            %% 3 - calculate observable quantities
            simu.obs = get_obs(simu); % t , L_w , W_w, E_w, F
            
            res(ff,tt).tLWR = [simu.obs(:,1) simu.obs(:,2) simu.obs(:,3) simu.obs(:,5)];
            % save specific variables for plotting with imagesc
            res(ff,tt).i_sp = i_sp; % save the reproduction indexes
            imsc.Li(ff,tt) = max(simu.obs(:,2)); 
            imsc.Wi(ff,tt) = max(simu.obs(:,3)); % the weight fluctuates due to reproduction - this ensures it is the maximum weight
            if  isempty(i_sp)
            imsc.Ri(ff,tt) = 0;
            imsc.cumF(ff,tt) = 0;
            else
            imsc.Ri(ff,tt) = max(simu.obs(i_sp,5)); % maximum reproduction output in a given scenario
            imsc.cumF(ff,tt) = sum(simu.obs(i_sp,5)); % cummulative repro output at each food level          
            end
            %%%% find datapoints for puberty
%             index =find(simu.obs(:,5),1,'first'); % the first point when repro starts
              index = find(simu.tEVHR(:,4)>=simu.par.E_Hp,1,'first');
             if  numel(index) % maturity reached
                imsc.ap(ff,tt) = simu.obs(index,1);
                imsc.Lp(ff,tt) = simu.obs(index,2);
                imscs.Wp(ff,tt) = simu.obs(index,3);
             else % no reprod
                 imsc.ap(ff,tt) = NaN;
                 imsc.Lp(ff,tt) = NaN;
                 imsc.Wp(ff,tt) = NaN;                                
             end
%                                 
                
        end     
    end
    
      save ('results_fTgrid2.mat', 'mdfyX', 'f2', 'Ts', 'res', 'imsc', 'limit', 'simu', 'T_env')
          
                    