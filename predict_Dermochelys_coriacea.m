function [prdData, info] = predict_Dermochelys_coriacea(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_pAm = tempcorr(temp.pAm, T_ref, T_A);
  TC_pXm = tempcorr(temp.pXm, T_ref, T_A);
  TC_Jone = tempcorr(temp.tL_Jone, T_ref, T_A); % Jones experiments
  TC_Wyne = tempcorr(temp.tL_Wyne, T_ref, T_A); % Wyneken experiments
  TC_tJOe = tempcorr(temp.tJO_e, T_ref, T_A);
  %TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve
  Ww_0 = E_0 * w_E/ mu_E/ d_V;       % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  Wd_b = Ww_b * d_V;                % g, dry weight at birth at f 
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % feeding
  L = (350000/(1+f*ome))^(1/3); % cm, struc length
  pT_Am = TC_pAm * p_Am * L^2/ 24/ 60/ 60/ 350 ; % W/kg, specific assimilation rate
  pT_Xm = TC_pXm * p_Am * L^2/ kap_X/ 24/ 60/ 60/ 350; % W/kg, intake rate 

  % trying to make LN work
  Lw_p = L_p/ del_M_a;            % cm, physical length at puberty at f
  Lw_i = L_i/ del_M_a;            % cm, ultimate physical length at f


  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wdb = Wd_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.pAm = pT_Am;
  prdData.pXm = pT_Xm;
  
  %% uni-variate data
  
  % time-length-weight
  tvel = get_tp(pars_tp, f_Jone, [], tL_Jone(:,1)*k_M*TC_Jone);
  EL_Jone = L_m * tvel(:,4);   % cm, structural length 
  ELw_Jone = EL_Jone/ del_M; % cm, physical length
  EWw_Jone = EL_Jone.^3 .* (1 + tvel(:,3) * ome);   % g, weight
  EWw2_Jone = (LW_Jone(:,1)*del_M).^3 .* (1 + tvel(:,3) * ome);   % g, weight for LW data
  
  tvel = get_tp(pars_tp, f_tL1, [], tL1(:,1)*k_M*TC_Jone);
  ELw_1 = L_m * tvel(:,4)/ del_M;   % cm, length 
    
  tvel = get_tp(pars_tp, f_Wyne, [], tL_Wyne(:,1)*k_M*TC_Wyne);
  EL_Wyne = L_m * tvel(:,4);   % cm, structural length 
  ELw_Wyne = EL_Wyne/del_M; %cm , physical length
  EWw_Wyne = EL_Wyne.^3 .* (1 + tvel(:,3) * ome);   % g, weight
  EWw2_Wyne = (LW_Wyne(:,1)*del_M).^3 .* (1 + tvel(:,3) * ome);   % g, weight for LW data
  %
  % time-weight, O2 consumption for embryo at f and T
  vT = v * TC_tJOe; pT_M = p_M * TC_tJOe; 
  LE_0 = [1e-6; E_0];    % cm, J, initial conditions
  t = max(0,tJO_e(:,1)-t_0); n=length(t);for i=2:n; if t(i)<=t(i-1); t(i)= t(i-1)+1e-3;end; end
  [t, LE] = ode45(@get_LE, t, LE_0, [], L_b, TC_tJOe* p_Am, kap, TC_tJOe* p_M, TC_tJOe* v, E_G);
  L = LE(:,1); L3 = L .^3;       % cm, structural length, volume
  E = LE(:,2);                   % J, reserve
  ee = E ./ L3/ E_m;             % -, scaled reserve density
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); % 1/d, specific growth rate
  pTC = (vT ./ L - r) .* E;      % J/d, mobilisation  (p.39 2.12)
  pTA = 0 * L;                   % J/d, asimilation 
  pTM = L3 * pT_M;               % J/d, somatic maintenance
  pTG = kap * pTC - pTM .* L3;   % J/d, growth
  pTD = pTM + (1 - kap) * pTC;   % J/d, disipation (without reproduction)
  J_O = eta_O * [pTA pTD pTG]';  % mol/d, organic fluxes
  J_M = (- n_M\n_O * J_O)';      % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4; % M, mol of gas per litre at 20 C and 1 bar 
  EJT_Oe = - J_M(:,3)/ X_gas / 24e-3; % mL/ h  


   % length - fecundity per nest; % Fecundity = [egg number]/# of nests = [kap_R * R_T /E0]/nest.LF
    R =  reprod_rate(LN(:,1)*del_M_a, f_LN, pars_R);  % #/d, reproduction rate at T, 
    % do NOT correct for temp here, because temp correction in R and fecund cancel out
    %     N =length(data.LF);  
    EN = R * 365 ./ fecund.LN;  % #/ clutch

  % pack to output
  prdData.tL_Jone = ELw_Jone;
  prdData.tW_Jone = EWw_Jone;
  prdData.LW_Jone = EWw2_Jone;
  prdData.tW_Wyne = EWw_Wyne;
  prdData.LW_Wyne = EWw2_Wyne;
  prdData.tL1 = ELw_1;
  prdData.tL_Wyne = ELw_Wyne;
  prdData.tJO_e = EJT_Oe;
  prdData.LN = EN;

end

function dLE = get_LE(t, LE, L_b, p_Am, kap, p_M, v, E_G)
  L = LE(1); E = LE(2);  %ER = LER(3); % unpack state vars   

  r = ((E * v/ L^4) - (p_M / kap)) / ((E/ L^3) + (E_G / kap)); % 1/d, specific growth rate
  pC = E * (v/ L -  r);            % J/d, mobilization

  dL = L * r/ 3;                   % cm/d growth
  dE = - pC;                    % J/d reserve dynamics

  dLE = [dL; dE];                 % pack output

end  