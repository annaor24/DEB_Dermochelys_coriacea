function simu = init(simu)
%---------------------------------------------------------------
% Define simulation and individual features
%
% simu: structure with individual features (parameters, env...)
%           (simu(i).par = parameters of individual i )
%
% called by:main.m
%
% last modified: 2025/Jun/16 - Nina Marn
% original EVHR file setup (for fish) created 2013/03/12 by Laure Pecquerie
%---------------------------------------------------------------

% setup
 t0 = 1; % initial time (hatching /start of feeding) % 1st July (midseason)
 % originally August 1st --> important when having seasonal T !!! 
 tm = 35 * 365; % final time (duration of simulation)
 ts = t0; % hatching time (same as spawning ?)
 fprintf(1, 'Simulation run: %2.1f years.  \n', tm/365)
 
 %% environment
 % choose if environment constant or variable
 env = 1; % 1 = constant, 2 = variable
  % initial forcing variable <--environment
 T_env = C2K(21.13); % EP temp assumed: 22.5, NWA: 21.13
 f_env = 0.9 ; % EP f assumed: 0.895, NWA: 0.9
 temp_crit = 0; % if working with critical high and low temp
 delR = 365*2.5; fprintf('Repro frequency: every %4.2f years \n', delR/365)  % EP delR assumed: 3.5, NWA: 2.5

style1 = '-';
style2 = '--';

 if env == 1
%      col = 'b'; 
        col = [0 0.749019622802734 0.749019622802734]; % light blue
%      col = [0.749019622802734 0.749019622802734 0 ]; % yellow-green
     sty = style1;
     mark = 'none'; % marker default
 else
     col = 'b'; 
 end


%% % setup turtle parameters
load results_Dermochelys_coriacea % <--- has all primary parameters obtained by AmP routines
par.f_AmP = par.f; % AmP has an f for zero variate data!
% par.F_m = par.F_m /2;
cPar = parscomp_st(par); cPar.K  % <--- creates compound parameters, like p_Am, K_X, scaled parameters
% vars_pull(cPar); vars_pull(par) % DEBtool scripts to unpack matlab structures

 
 % initiate state variable values
 V_0 = 0000.1; % cm^3, initial structural volume
 E_H0 = 0; % J, initial cum.energy invested into maturation
 E_R0 = 0; % J, reproduction buffer


% K_X = K; % half saturation coeff
% K_X = p_Am /(kap_X*F_m); % half saturation coeff
T_typ = T_env ; % baseline simulation temp -- compare to species T_typ!

fprintf(1, 'Typical temperature: %2.4f C,  \n', T_typ-273.15)
%repro
stats = statistics_st('std', par, T_typ, par.f_AmP); % to obtain ep_min ; <-- if script too slow and parameters final, this can be hard-coded

if temp_crit % (if we want to work with critical high and low temp!)
    T_H = C2K(30) ; % error if lower than T_ref!!
    T_L = C2K(15) ;
    T_AH = 20000;  % same values as for ProcVirg
    T_AL = 18000;
    fprintf('Critical temps: high %2.4f C, low %2.4f C \n', T_H-273.15, T_L-273.15)
    pars_T = [par.T_A, T_L, T_H, T_AL, T_AH];
    par.pars_T = pars_T;
end
% 
% par.K_X = K_X; 
par.T_typ = T_typ; 

% final output
simu.par = par; 
simu.cPar = cPar;
simu.delR = delR; % repro frequency
simu.ep_min = stats.ep_min *1.002;  % -, scaled reserve density whereby maturation and growth cease at puberty
    
    

%% packup %%%
  
% simulation 
simu.t0 = t0; 
simu.tm = tm; 
simu.ts = ts; 
simu.env = env; 
simu.finit = f_env; 
simu.Tinit = T_env; 
simu.Xinit = f_env .* cPar.K ./ (1-f_env);  % f = x/ (1+x) = X/K / (1 + X/K)


%% % individual
p_UE0 = [cPar.V_Hb; cPar.g; par.k_J; cPar.k_M; par.v]; % pars for initial scaled reserve
[UE0, Lb, info] = initial_scaled_reserve (f_env, p_UE0);
E_0 = UE0 * cPar.p_Am; 

simu.EVHR_init = [E_0 ; V_0 ; E_H0 ; E_R0]; % initial vector for individual
simu.Lb = Lb;
simu.col = col; 
simu.sty = sty; 
simu.mark = mark;
