function d = flux(t, EVHR, simu)
  %---------------------------------------------------------------
  % Define differential equations of the state variables
  %  
  % t: n-vector with time points
  % EVHR: 4-vector with state variables
  %         E , J, reserve energy
  %         V , cm^3, structural volume
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % d: 4-vector with d/dt E, V, E_H, E_R
  %
  % called by : indiv.m, 
  % calls : food.m, temp.m, 
  %
  % 2013/03/15 - Laure Pecquerie
  %--------------------------------------------------------------
  % Environmental conditions
  if simu.env == 1
      X = simu.Xinit ;
      T = simu.Tinit;   
  else
      X = food(t);
      T = temp(t); 
  end
   
  %% unpack state vars
  E  = EVHR(1); % J, reserve energy
  V  = EVHR(2); % cm^3, structural volume
  E_H  = EVHR(3); % J , cumulated energy inversted into maturity 
  E_R  = EVHR(4); % J, reproduction buffer
  
  % read parameter values
  par = simu.par; cPar = simu.cPar;
%   vars_pull(par);  vars_pull(cPar); 
  
  % scaled functional response
  f = X/ (X + cPar.K); % -,   scaled functional response
  
  % simplest temperature correction function, 
  % see Kooijman 2010 for more detailed formulation (e.g. p. 21)
%   c_T = exp(T_A/ T_ref - T_A/ T) ;
  c_T = tempcorr(T, par.T_ref, par.T_A);
  
  pT_Am = c_T * cPar.p_Am ;
  v_T = c_T * par.v; % 
  pT_M = c_T * par.p_M;
  pT_T = c_T * par.p_T; % 
  kT_J = c_T * par.k_J; 
  pT_Xm = pT_Am / par.kap_X;
  
  % Fluxes

  if E_H < par.E_Hb
       pX = 0; % embryo stage -> f=0
%       tpX=pX
%       save ('tpX', 'tpX')
  else
      pX = f * pT_Xm * V^(2/3);
%       load ('tpX')
%       tpX = tpX+pX
%       save ('tpX', 'tpX')
  end
  
  pA = par.kap_X * pX;
  pM = pT_M * V;
  pT = pT_T * V^(2/3);
  pS = pM + pT;
  pC = (E/V) * (par.E_G * v_T * V^(2/3) + pS ) / (par.kap * E/V + par.E_G ); %eq. 2.12 p.37 Kooijman 2010
  pJ = kT_J * E_H;
  
  % Differential equations
  dE = pA - pC; % dE/dt
  dV = (par.kap * pC - pS) / par.E_G;% dV/dt
  if E_H < par.E_Hp
      dH = (1 - par.kap) * pC - pJ; % dEH/dt
      dR = 0; % dER/dt
  else
      dH = 0;
      dR = (1 - par.kap) * pC - pJ;
  end
  
  d = [dE; dV; dH; dR]; 