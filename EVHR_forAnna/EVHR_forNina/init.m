function simu = init(simu)
%---------------------------------------------------------------
% Define simulation and individual features
%
% simu: structure with individual features (parameters, env...)
%           (simu(i).par = parameters of individual i )
%
% called by:main.m
% calls: set_par.m
%
% created: 2013/03/12 - Laure Pecquerie
% modified: 2014/01/20 - Nina Marn
%---------------------------------------------------------------

% setup
 t0 = 1; % initial time (hatching /start of feeding) % 1st July (midseason)
 % originally August 1st --> important when having seasonal T !!! 
 tm = 30 * 365; % final time (duration of simulation) ANNA CHANGE TO AVERAGE NWA LEATHERBACK LIFESPAN (30 YEARS) FROM 66
 ts = t0; % hatching time (same as spawning ?)
 
 % choose if environment constant or variable
 env = 1; % 1 = constant, 2 = variable
 
 % color for plots
% red = [1 0 0] ; %  30   % -50%
% orange = [1 0.4 0]; % 28  %  
% yello = [1 1 0]; % 26  %   -30%
% green = [0 0.6 0]; % 24  % -20%
% blue = [0 0 1]; % 22  % - 10%
% dblue= [0 0 0.4]; % 20  %  0
% purple = [0.6 0 0.6]; % 18 % +20%
% black = [0 0 0 ]; % 16  % +50%
 
% mdfy = 0.5; 
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

 % initial forcing variable
 T = 21.13 + 273; % ANNA CHANGE FROM 21.8 
 f = 0.8987 ; % ANNA CHANGE FROM 0.81 TO AVERAGE FROM ALL OUR f values: WYNE = 0.71357, JONE = 0.95152, LN (WILD) = 1.0309
 
 % initiate state variable values
 V_0 = 0000.1; % cm^3, initial structural volume
 E_H0 = 0; % J, initial cum.energy invested into maturation
 E_R0 = 0; % J, reproduction buffer

%%% chose a population
  simu.par = set_par_NA; % load parameters
%    simu.par = set_par_Med; % load parameters
%%%%%
 
 
% simulation 
simu.t0 = t0; 
simu.tm = tm; 
simu.ts = ts; 
simu.env = env; 
simu.Tinit = T; 
simu.Xinit = f .* simu.par(22) ./ (1-f);  % f = x/ (1+x) = X/K / (1 + X/K)


% % individual
p_Am = simu.par(5);
v = simu.par(6);
kap = simu.par(7);
p_M = simu.par(9);
kJ = simu.par(11);
E_G = simu.par(12);
E_Hb = simu.par(13);
VHb = (E_Hb/p_Am)/ (1 - kap);
g = (E_G/kap) / (p_Am/v);
kM = p_M /E_G;

p_UE0 = [VHb; g; kJ; kM; v]; % pars for initial scaled reserve
[UE0 Lb info] = initial_scaled_reserve (f, p_UE0);
E_0 = UE0 * p_Am; 

simu.EVHR_init = [E_0 ; V_0 ; E_H0 ; E_R0]; % initial vector for individual
simu.col = col; 
simu.sty = sty; 
simu.mark = mark;
