function obs = get_obs(simu)
  %---------------------------------------------------------------
  % Compute physical length, weight, fecundity, and energy content from state variables
  %  
  % 
  % obs : (n, 5) matrix with 
  %         t: d, time,
  %			Lw: cm, physical length
  %         Ww: g, total wet weight,
  %			F: #, fecundity
  %         Ew: J/g, energy content per unit wet weight
  %     
  %
  % called by : main.m
  % 
  % 2013/03/15 - Laure Pecquerie
  %-------------------------------------------------------------


%% unpack parameters, state variables
par = simu.par; cPar = simu.cPar; 
vars_pull(par); vars_pull(cPar); 

t = simu.tEVHR(:,1);
E = simu.tEVHR(:,2);
V = simu.tEVHR(:,3);
E_R = simu.tEVHR(:,5);

  %% shape vector 
%%setup for change in shape
L_d = Lw_del*del_Ma; % structural length when change in shape complete; Lw_del is a parameter set to 40cm SCL
L =  V.^(1/3); L_b = L(1); %length at birth (hopefully)
del_vec = ((L-L_b)*del_Ma + (L_d-L)*del_M) ./(L_d-L_b); % calculate weighted shape coeff
 del_vec(del_vec<del_Ma)=del_Ma;  % replace unrealistic values with adult shape coeff
  
L_w = L ./ del_vec; % cm, physical length
% L_w = V.^(1/3) / del_M; % cm, physical length


W_V = d_V * V; % dry weight of structure
W_E_and_R = w_E / mu_E * (E + E_R);  % dry W of E and E_R
W = W_V + W_E_and_R; % total dry weight
W_w = w * W;% assume the same water content in structure and reserves

% calculate what part of wet weight is wet weight of repro buffer! 
W_R= w_E / mu_E * (E_R);
percentW_R= W_R./W;
index= find(percentW_R>0);
newPercentW_R = percentW_R(index);
% fprintf('Maximum percentage of repro buffer contribution is %2.4f \n', max(newPercentW_R))




E_V = mu_V * d_V / w_V * V ;
E_w = (E_V + E + E_R) ./ W_w ;

F = kap_R * E_R / simu.EVHR_init(1); % Fecundity = egg number = kap_R * E_R / E_0

obs = [t , L_w , W_w, E_w, F];