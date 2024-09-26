function pars = set_par_NA
  %--------------------------------------------------------------- 
  % Parameters (values, unit and description)
  % pars: n-vector of parameters
  %    
  % called by : init.m
  %
  % modified 2016/01/26 Nina Marn, created: 2013/03/15 - Laure Pecquerie
  % notation corresponds to the add_my_pet routines
  % Reference: <http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/add_my_pet.pdf *add_my_pet manual*> 
  %--------------------------------------------------------------- 

  % temperature correction
  T1 = 293.15; % 1, K, Reference temperature; ANNA - CHANGE FROM 293
  TA = 8000; % 2, K, Arrhenius temperature; ANNA CHANGE from 7000
  
  % feeding and asismilation
  F_m = 6.5; % 3, 1/d.cm^2, {F_m}, max specific searching rate ANNA - SAME
%   kap_X = 0.8; % 4, - , diggestion efficiency of food to reserve 
kap_X = 0.1433; % 4, - , diggestion efficiency of food to reserve ANNA CHANGE FROM 0.8
  p_Am = 906.1; % 5, J/cm^2/d, maximum surface-specific assimilation rate ANNA INTENDED CHANGE FROM 906.1; OUR pAM IS W/KG
%   p_Am = 1169.4; % -II-  for hatchlings
 
% mobilisation, maintenance, growth & reproduction
  v = 0.05906;     % 6, cm/d, energy conductance ANNA CHANGE from 0.0708
  kap = 0.2398;    % 7, -, allocation fraction to soma = growth + somatic maintenance ANNA CHANGE FROM 0.6481
  kap_R = 0.95;    % 8, -, reproduction efficiency ANNA - SAME 
  p_M = 34.03;     % 9, J/d.cm^3, [p_M], vol-specific somatic maintenance ANNA CHANGE FROM 13.25
  p_T = 0;         % 10, J/d.cm^2, {p_T}, surface-specific som maintenance ANNA - SAME
  k_J = 0.002;   % 11, 1/d, maturity maint rate coefficient ANNA - SAME
  E_G = 5766;      % 12, J/cm^3, [E_G], spec cost for structure ANNA CHANGE FROM 7847

  % life stages: E_H is the cumulated energy from reserve invested in maturation
  E_Hb = 6.063e+04;      % 13, J, E_H^b, maturity at birth ANNA CHANGE FROM 3.809E+04
  E_Hp = 1.587e+09;  % 14, J, E_H^p, maturity at puberty ANNA CHANGE FROM 8.73+07

  % param to compute observable quantities (Auxiliary pars)
  del_M = 0.2423;   % 15, -, shape coefficient to convert vol-length to physical length ANNA CHANGE FROM 0.3744
  % del_Ma = 0.227;   % 15, -, shape coefficient to convert vol-length to physical length ANNA INTENDED CHANGE: addition for adult shape coefficient; is it relevant?

  d_V  = 0.28; 	   % 16, g/cm^3, specific density of structure (dry weight)ANNA INTENDED CHANGE; UNSURE HOW
  mu_V = 500000;   % 17, J/mol ANNA INTENDED CHANGE; UNSURE HOW
  mu_E = 550000;   % 18 , J/mol ANNA INTENDED CHANGE; UNSURE HOW
  w_V = 23.9000;   % 19, g/mol ANNA INTENDED CHANGE; UNSURE HOW
  w_E = 23.9000;   % 20 , g/mol ANNA INTENDED CHANGE; UNSURE HOW
  w =  3.85;    % 21, -, wet / dry weight coefficient (calculated from  KraeBenn1981: 3.69-3.97) ANNA INTENDED CHANGE; UNSURE HOW
  % compounds parameters
  K = p_Am/ (kap_X * F_m);  % 22, same unit as food, half-saturation coefficient
  
  
  %% pack parameters
  pars = [ T1 ; TA ; F_m ; kap_X ; p_Am ; v ;  kap ; kap_R ;...
      p_M ; p_T ; k_J ; E_G ; E_Hb ; E_Hp ; del_M ; d_V  ; ...
      mu_V ; mu_E ; w_V ; w_E ; w ; K ];
