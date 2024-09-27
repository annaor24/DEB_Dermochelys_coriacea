% setupCray -- setting up the crayfish for simulations

function simu = setupTurtle(crayfish)
crayfish
eval(['load results_', crayfish{:}, '.mat'])

cPar = parscomp_st(par);
vars_pull(cPar); vars_pull(par)

K_X = p_Am /(kap_X*F_m); % half saturation coeff

% temp parameters 
% T_typ =  metaData.T_typical; % typical body temp
 T_typ =  C2K(12.5); % baseline simulation temp
fprintf(1, 'Typical temperature: %2.4f C,  \n', T_typ-273.15)
stats = statistics_st('std', par, T_typ, f); % to obtain ep_min

if strcmp(crayfish,'Austropotamobius_torrentium')
    delR = 365*2; fprintf('Repro frequency: every %4.2f years \n', delR/365)
    T_H = C2K(21) ; % error if lower than T_ref!!
    T_L = C2K(7) ;    
elseif strcmp(crayfish,'Astacus_astacus')
    delR = 365; fprintf('Repro frequency: every %4.2f years \n', delR/365)
    T_H = C2K(22) ; % error if lower than T_ref!!
    T_L = C2K(7)  ;
%     ep_min = 0.469976;  
elseif strcmp(crayfish,'Pacifastacus_leniusculus')
    delR = 365; fprintf('Repro frequency: every %4.2f years \n', delR/365)
    T_H = C2K(28) ;
    T_L = C2K(7)  ;
%     ep_min = 0.452628; 	
else % 'Procambarus_virginalis'
    delR = 365/5; fprintf('Repro frequency: every %4.2f weeks \n', delR/7)
    T_H = C2K(32) ;
    T_L = C2K(15) ;
%     ep_min = 0.188942; 	
end
T_AH = 20000;  % same values as for ProcVirg
T_AL = 18000; 
pars_T = [T_A, T_L, T_H, T_AL, T_AH]; 

fprintf('Critical temps: high %2.4f C, low %2.4f C \n', T_H-273.15, T_L-273.15)

% packup
par.K_X = K_X; 
par.T_typ = T_typ; 
par.pars_T = pars_T;
% final output
simu.par = par; 
simu.cPar = cPar;
simu.delR = delR; % repro frequency
simu.ep_min = stats.ep_min *1.002;  % -, scaled reserve density whereby maturation and growth cease at puberty
end
