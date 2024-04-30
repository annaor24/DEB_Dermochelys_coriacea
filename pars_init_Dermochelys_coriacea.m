function [par, metaPar, txtPar] = pars_init_Dermochelys_coriacea(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 31.2901;      free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.14328;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.2;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.059061;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.23981;    free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 34.0321;    free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5766.0171;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.063e+04; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.587e+09; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.300e-09;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Lw_del = 40;      free.Lw_del = 0;   units.Lw_del = 'cm';      label.Lw_del = 'physical SCL at shape change to del_Ma, from Jones data'; 
par.del_M = 0.24228;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Ma = 0.22701;  free.del_Ma = 1;   units.del_Ma = '-';       label.del_Ma = 'shape coefficient of adults'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Jone = 0.95152;  free.f_Jone = 1;   units.f_Jone = '-';       label.f_Jone = 'scaled functional response for Jones 2009 tL and tWw data'; 
par.f_LN = 1.0309;    free.f_LN  = 1;   units.f_LN = '-';         label.f_LN = 'scaled functional response for LN data'; 
par.f_Wyne = 0.71357;  free.f_Wyne = 1;   units.f_Wyne = '-';       label.f_Wyne = 'scaled functional response for Wyneken 2023 tL and tWw data'; 
par.f_tL1 = 1;        free.f_tL1 = 0;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL1 data'; 
par.t_0 = 19.3614;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.22;       free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.22;       free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
