% modeling food or temp, script by Nina Marn
% last modified: 2025-Apr-28

clear all 
save results_fT.mat
close all
datelog = date;
save ('results_fT.mat', 'datelog', '-append')

%% colors 
red = [1 0 0] ; %  30   % -50%  <-- temp 30 , or food -50%
orange = [1 0.4 0]; % 28  %  -30% <-- temp 28 , or food -30%
yello = [1 1 0]; % 26  %   -20% <-- temp 26 , or food -20%
green = [0 0.6 0]; % 24  % - 10% <-- temp 24 , or food -10%
blue = [0 0 1]; % 22  % 0 <-- temp 22 , or food current (corresponding to f=0.81)
dblue= [0 0 0.4]; % 20  %  +20% <-- temp 20 , or food +20%
purple = [0.6 0 0.6]; % 18 % +50% <-- temp 18 , or food +50%
black = [0 0 0 ]; % 16  % +100% <-- temp 16 , or food +100%

colors = [red; orange; yello; green; blue; dblue; purple; black; red; orange; yello; green; blue; dblue; purple; black];

 %% 1 - initialize time, parameters, etc
  simu = init ;
     K1 = simu.cPar.K; T_env = simu.Tinit;    Xinit = simu.finit .* simu.cPar.K ./ (1-simu.finit);  % f = x/ (1+x) = X/K / (1 + X/K)
% check values -- {p_Am} = 2.7e+03 J/cm2.d; z = 60; K: 0.0031 c-mol X/l, half-saturation coefficient
% Xinit = 0.0280 (mdfyX = 1)
     
%% simulate conditions

limit = 4; % this will simulate current conditions +7points lower and 7points higher than current
scenario = 'Temp'; % options: Food, Temp

% switch scenario
%     case 'Food'                        
%         markers = ['o', '.', 'x','.', 's','*']; 
   mdfyX = [linspace(0.5,1,limit), linspace(1,2,limit)] ; % to ensure f is simulated
     mdfyX(limit) = [] ;% food(ff) with the double entry removed

    mdfyX= fliplr(mdfyX); % better for plotting
               
        t_f= 0; Lw_f= 0; Ww_f =0; R_f = 0; % initialize (delete later this entry)
        LR_f=0; tR_f=0;
        
        for ii = 1: length(mdfyX)
%           simu.Xinit2 =  Xinit * mdfyX(ii);
%             f2(ii)= simu.Xinit2/(simu.Xinit2+K1);
           simu.Xinit =  Xinit * mdfyX(ii);
            f2(ii)= simu.Xinit/(simu.Xinit+K1);
            fprintf('Current food is %2.5f \n', f2(ii))
            
            %% 2 - calculate state variables
            simu.tEVHR = indiv(simu);
            
            %% 3 - calculate observable quantities
            simu.obs = get_obs(simu); % t , L_w , W_w, E_w, F
             % spawning date indices
             % i_sp = find(and((E_R == 0),(E_H>=E_Hp)));
            i_sp = find(and((simu.tEVHR(:,5) == 0),( simu.tEVHR(:,4)>=simu.par.E_Hp) ) ) ;
            i_sp = i_sp - 1 ; % look at the preceding line with E_R value before spawning
            
            if ii==limit % current (for plotting!)
                ct_f = simu.obs(:,1);
                cWw_f = simu.obs(:,3);
                cLw_f = simu.obs(:,2);
                cR_f = simu.obs(i_sp,5);
                ctR_f = simu.obs(i_sp,1);
                cLR_f = simu.obs(i_sp,2);
            end
            
            t_f = [t_f; simu.obs(:,1)]; 
            Lw_f = [Lw_f; simu.obs(:,2)]; 
            % save separately tL curve:
            f_Res(ii).tLw = [simu.obs(:,1)/365 simu.obs(:,2)];
            Ww_f = [Ww_f; simu.obs(:,3)]; 
            if  isempty(i_sp) % if no repro
                tR_f = [tR_f; NaN]; % special time vector for plotting
                LR_f = [LR_f; NaN]; % special length vector for plotting
                R_f = [R_f; 0];
                Ri_f(ii) = 0;
                cumF_f(ii) = 0;
            else
                tR_f = [tR_f ; simu.obs(i_sp,1)]; % this vector should be shorter than others! (important for plotting)
                LR_f = [LR_f ; simu.obs(i_sp,2)]; % this vector should be shorter than others! (important for plotting)
                R_f = [R_f ; simu.obs(i_sp,5)]; % this vector should be shorter than others! (important for plotting)
                Ri_f(ii) = max(simu.obs(i_sp,5));
                cumF_f(ii) = sum(simu.obs(i_sp,5)); % cummulative repro output at each food level
            end
            Li_f(ii) = max(simu.obs(:,2)); 
            Wi_f(ii) = max(simu.obs(:,3)); % the weight fluctuates due to reproduction - this ensures it is the maximum weight
            
            %%%% find datapoints for puberty
            index =find(simu.obs(:,5),1,'first'); % the first point when repro starts
            if  numel(index) % maturity reached
                Ap_f(ii) = simu.obs(index,1);
                Lp_f(ii) = simu.obs(index,2);
                Wp_f(ii) = simu.obs(index,3);
            else % no reprod
                Ap_f(ii) = NaN;
                Lp_f(ii) = NaN;
                Wp_f(ii) = NaN;
            end
            
                     
            
            %% 4 - make plots
            simu.col = colors(ii, :);
             simu.mark = '.'; simu.fig = 1;
             get_plots(simu)
%                            
        end 
        t_f(1)=[]; Lw_f(1)=[]; Ww_f(1) =[]; LR_f(1)=[];  tR_f(1)=[]; R_f(1)=[]; % delete the initial entry
        
       
         %%% for the table
           
   %%.
      fprintf (' **** DIFFERENT FOOD LEVELS ***** \n')      
   fprintf (' mdfy,   f,     ap,    Lp,      Wp,     Li,     Wi,       Ri  ,    cumF \n')     
   fprintf ('======================================================= \n')
        for p = 1: length(mdfyX)
            mdfy = mdfyX(p);
            if mdfy <= 1
                fprintf('%2.0f & %1.3f & %3.2f & %3.2f & %3.2f & %3.2f & %3.2f & %i & %i \\\\ \n',...
                    (mdfy-1)*100, f2(p) , Ap_f(p)/365, Lp_f(p), Wp_f(p)/1000, Li_f(p), Wi_f(p)/1000, round(Ri_f(p)), round(cumF_f(p)))               
             else
             fprintf('+%2.0f & %1.3f & %3.2f & %3.2f & %3.2f & %3.2f & %3.2f & %i & %i  \\\\ \n',...
                    (mdfy-1)*100, f2(p) , Ap_f(p)/365, Lp_f(p), Wp_f(p)/1000, Li_f(p), Wi_f(p)/1000, round(Ri_f(p)), round(cumF_f(p)))
             end
        end
        fprintf ('======================================================= \n')
        
         save ('results_fT.mat', 'mdfyX', 'f2', 'Ap_f', 'Lp_f', 'Wp_f','Li_f', 'Wi_f', 'Ri_f', ...
             'cumF_f', 'f_Res', '-append')
        
        %%% plots for all points %%%

        
     figure (10)
     subplot(1,2,1)
     hold on
     plot(t_f/365, Lw_f, 'k*', 'MarkerSize', 2)
%      plot(t_f/365, Lw_f,  'k*', 'MarkerSize')
     plot(ct_f/365, cLw_f, 'r*', 'MarkerSize', 2)
     title('case Food')
     xlabel('time (yr)')
     ylabel('length, SCL (cm)')
     
      
     figure (20)
     subplot(1,2,1)
     hold on
     plot(tR_f/365, R_f, 'k*')
     plot(ctR_f/365, cR_f, 'r*')
     title('case Food')
     xlabel('time (yr)')
     ylabel('seasonal reproduction (#)')
        
     figure (30)
     subplot(1,2,1)
     hold on
     plot(Lw_f, Ww_f, 'k*', 'MarkerSize', 2)
    plot(cLw_f, cWw_f, 'r*', 'MarkerSize', 2)
     title('case Food')
     xlabel('length, SCL (cm)')
     ylabel('mass (kg)')
     
     figure (40)
     subplot(1,2,1)
     hold on
     plot(Lw_f, Ww_f, 'k*', 'MarkerSize', 2)
     plot(cLw_f, cWw_f, 'r*', 'MarkerSize', 2)
     title('combined')
     xlabel('length, SCL (cm)')
     ylabel('mass (kg)')
     
     figure(50)
     subplot(1,2,1)
     hold on
     plot(LR_f, R_f, 'k*')   
     plot(cLR_f, cR_f, 'r*')   
     title('case Food')
     xlabel('length, SCL (cm)')
     ylabel('eggs per clutch (#)')
     
%      figure(6)
%      subplot(1,2,1)
%      hold on
%      plot(LR_f, R_f, 'k*')   
%      plot(cLR_f, cR_f, 'r*')   
%      title('combined')
%      xlabel('length, SCL (cm)')
%      ylabel('eggs per clutch (#)')
        
        
%     case 'Temp'
        
        % different temperature
         Ts = [linspace(C2K(14),T_env,limit) linspace(T_env,C2K(27),limit)] ; % to ensure T is simulated
    Ts(limit) = [] ; % temp(tt) with the double entry removed
      Ts = fliplr(Ts); % better for plotting
        simu.Xinit = Xinit;
        
         t_T= 0; Lw_T= 0; Ww_T =0; R_T = 0;  LR_T=0;  tR_T = 0; % initialize (delete later this entry)
                
        for ii = 1: length(Ts)
            simu.Tinit = Ts(ii); 
            fprintf('Current temperature is %2.2f C\n', Ts(ii)-273.15)
            %% 2 - calculate state variables
            simu.tEVHR = indiv(simu);
            
            %% 3 - calculate observable quantities
            simu.obs = get_obs(simu); % t , L_w , W_w, E_w, F
            % spawning date indices
             % i_sp = find(and((E_R == 0),(E_H>=E_Hp)));
            i_sp = find(and((simu.tEVHR(:,5) == 0),( simu.tEVHR(:,4)>=simu.par.E_Hp) ) ) ;
            i_sp = i_sp - 1 ; % look at the preceding line with E_R value before spawning
            
            
            
            if ii==limit % current (for plotting!)
                ct_T = simu.obs(:,1);
                cLw_T = simu.obs(:,2);
                cWw_T = simu.obs(:,3);
                cR_T = simu.obs(i_sp,5);
                ctR_T = simu.obs(i_sp,1);
                cLR_T = simu.obs(i_sp,2);
            end
            
             t_T = [t_T; simu.obs(:,1)]; 
            Lw_T = [Lw_T; simu.obs(:,2)]; 
            Ww_T = [Ww_T; simu.obs(:,3)]; 
             % save separately tL curve:
            T_Res(ii).tLw = [simu.obs(:,1)/365 simu.obs(:,2)];
           
            if  isempty(i_sp) % if no repro
                tR_T = [tR_T; NaN];
                LR_T = [LR_T; NaN]; % special length vector for plotting
                R_T = [R_T; 0];
                Ri_T(ii) = 0;
                cumF_T(ii) = 0;
            else
                tR_T = [tR_T; simu.obs(i_sp,1)]; 
                LR_T = [LR_T ; simu.obs(i_sp,2)]; % this vector should be shorter than others! (important for plotting)
                R_T = [R_T ; simu.obs(i_sp,5)]; % this vector should be shorter than others! (important for plotting)
                Ri_T(ii) = max(simu.obs(i_sp,5));
                cumF_T(ii) = sum(simu.obs(i_sp,5)); % cummulative repro output at each food level
            end           
            Li_T(ii) = max(simu.obs(:,2)); 
            Wi_T(ii) = max(simu.obs(:,3)); % the weight fluctuates due to reproduction - this ensures it is the maximum weight
            
              %%%% find datapoints for puberty
            index =find(simu.obs(:,5),1,'first'); % the first point when repro starts
            if  numel(index) % maturity reached
                Ap_T(ii) = simu.obs(index,1);
                Lp_T(ii) = simu.obs(index,2);
                Wp_T(ii) = simu.obs(index,3);
            else % no reprod
                Ap_T(ii) = NaN;
                Lp_T(ii) = NaN;
                Wp_T(ii) = NaN;
            end
            
            %% 4 - make plots
             simu.col = colors(ii, :);simu.fig = 2;
                 get_plots(simu)
                        
        end 
        
            t_T(1)=[]; Lw_T(1)=[]; Ww_T(1) =[];LR_T(1)=[]; tR_T(1)=[]; R_T(1)=[]; % delete the initial entry  
          
        %%% for the table 
      
   %%  
        fprintf (' **** DIFFERENT TEMPERATURES ***** \n')      
        fprintf (' T,     ap,    Lp,    Wp,      Li,     Wi,      Ri ,  cumF \n')     
       fprintf ('======================================================= \n')
       
        for p = 1: length(Ts)            
                fprintf('%2.2f & %2.2f & %4.1f & %1.3f  & %3.2f& %3.2f & %3.2f & %i \\\\ \n',...
                   Ts(p)-273.15, Ap_T(p)/365, Lp_T(p), Wp_T(p)/1000, Li_T(p), Wi_T(p)/1000, round(Ri_T(p)), round(cumF_T(p)))           
        end
        fprintf ('======================================================= \n')
        
        save ('results_fT.mat', 'Ts', 'Ap_T', 'Lp_T', 'Wp_T', 'Li_T', 'Wi_T', 'Ri_T',...
            'cumF_T', 'T_Res', '-append')

           %%% plots for all points %%%
             
     figure (10)
     subplot(1,2,2)
     hold on
     plot(t_T/365, Lw_T, 'k*', 'MarkerSize', 2)
     plot(ct_T/365, cLw_T, 'r*', 'MarkerSize', 2)
     title('case Temp')
     xlabel('time (yr)')
     ylabel('length, SCL (cm)')
     
     figure (20)
     subplot(1,2,2)
     hold on
     plot(tR_T/365, R_T, 'k*')
     plot(ctR_T/365, cR_T, 'r*')
     title('case Temp')
     xlabel('time (yr)')
     ylabel('seasonal reproduction (#)') 
           
     figure(30)
     subplot(1,2,2)     
     hold on
     plot(Lw_T, Ww_T, 'ko')
     plot(cLw_T, cWw_T, 'ro')
       title('case Temp')
     xlabel('length, SCL (cm)')
     ylabel('mass (kg)')
     
%       figure (4)
%      subplot(1,2,2)
%      hold on
%      plot(Lw_T, Ww_T, 'ko')
%      plot(cLw_T, cWw_T, 'ro')
%      title('combined')
%      xlabel('length, SCL (cm)')
%      ylabel('mass (kg)')
     
     figure(50)
     subplot(1,2,2)
     hold on
     plot(LR_T, R_T, 'ko')   
     plot(cLR_T, cR_T, 'ro')   
     title('case Temp')
     xlabel('length, SCL (cm)')
     ylabel('eggs per clutch (#)')
     
%      figure(6)
%      subplot(1,2,2)
%      hold on
%      plot(LR_T, R_T, 'ko')   
%      plot(cLR_T, cR_T, 'ro')   
%      title('combined')
%      xlabel('length, SCL (cm)')
%      ylabel('eggs per clutch (#)')
         
% end

%% for curve fitting
% x_L_W = [Lw_f; Lw_T]; y_L_W = [Ww_f; Ww_T];
% x_L_R = [LR_f; LR_T]; y_L_R = [R_f; R_T];
% 
%  save ('results_fT.mat', 'x*', 'y*', '-append')

