function [data, auxData, metaData, txtData, weights] = mydata_Dermochelys_coriacea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Dermochelyidae';
metaData.species    = 'Dermochelys_coriacea'; 
metaData.species_en = 'Leatherback turtle'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0bTd', 'biMp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.3); % K, body temp --> changed to T_am on 2024/09/20
metaData.data_0     = {'ab'; 'tp'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wdb'; 'Wwi'; 'Ri'; 'pXi'; 'pAi'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'; 't-JOe'; 'LN'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Michael Kearney','Bas Kooijman'};    
metaData.date_mod_1     = [2023 06 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Anna Ortega','Nina Marn'};    
metaData.date_mod_2     = [2023 04 11];              
metaData.email_mod_2    = {'anna.ortega@research.uwa.edu.au'};            
metaData.address_mod_2  = {'The University of Western Australia'};  

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2024 09 13];


%% set data
% zero-variate data

data.ab = 63; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = {'ESA2020'};
  temp.ab = C2K(29.88); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Average incubation period is frmom 59-67 days; pivotal temperature is averaged at 29.88C.';
data.ap = 19.25; units.ap = 'yr'; label.ap = 'age at puberty'; bibkey.ap = {'ESA2020'};
  temp.ap = C2K(21.13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = {'Mean maturation for NWA leatherbacks in 19.25 years, and mean water temp is averaged between high lat (15-17C) and low lat (25-27.5C) water temperature mean values.', 
      'from growth models in Zug et al value is between 6.8 and 16.1 yrs'};
data.am = (19.25+11)*365; units.am = 'd'; label.am = 'life span'; bibkey.am = {'ESA2020'};
  temp.am = C2K(21.13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Mean longevity aftern maturation is 11 years in the NW Atlantic, 19.25+11*365 for d';

data.Lb = 6.18; units.Lb = 'cm'; label.Lb = 'length at birth, SCL'; bibkey.Lb = {'Wyne2023'};
  comment.Lb = 'Previous data averaged with Wyneken 2023 day of hatching measurements.';
data.Lp = 125.6; units.Lp = 'cm'; label.Lp = 'length at puberty, SCL'; bibkey.Lp = {'AvenTayl2009'};
  comment.Lp = {'Based on an Avens 2020 study about mean age at maturation (minimum is 109.56 cm SCL). They use ossicles to estimate age because, upon reaching puberty', 
  'Mean maturation CCL for NWA is 129.2 cm converted to SCL = 125.6 using Avens 2009 methods (better regression than Jones et al., 2011 when tested on nesting female data).'};
data.Li = 151.07; units.Li = 'cm'; label.Li = 'ultimate length, SCL'; bibkey.Li = {'AvenGosh2020', 'ESA2020', 'ZugParh1996'};
  comment.Li = {'Li = 151.07, averaged from 19 different studies measuring the size of nesting females (AvenGosh2020, ESA2020, and studies in ZugParh1996). ', 
  'Giro2021: Max SCL values for both sexes measured on the Atlantic French coast (n = 300) and males (n = 92)', 
  'Jones2011 has Li around 140cm from models'};

data.Ww0 = 81.66; units.Ww0 = 'g'; label.Ww0 = 'initial wet weight'; bibkey.Ww0 = {'Hsu2020'};
  comment.Ww0 = {'Parismina, Costa Rica leatherback nesting data from 2018 (egg weight)', ...
      'mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight '};
data.Wwb = 46.22; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'Hsu2020'};
  comment.Wwb = 'Average between 47.10 g (Hsu2020, n = 17) and 45.34 g (Wyne2023, n = 38)';
data.Wdb = 9.776; units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = {'Thom1993'};
  comment.Wdb = 'No new NWA data (there is EP data but not relevant to this task)';
data.Wwi = 683.33*1e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'Wood1982'};
  comment.Wwi = 'Guiness book of animal facts and feats - Gerald L Wood, 1982 cites Duron 1978 for a record of a capture male in a fishing ent at Longeville, Vendee Dept, W France that was 800 kg, with two other records off of West France at 650 and 600 kg. All averaged for this value.';

data.Ri = 0.4147; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = {'ESA2020'};
  temp.Ri = C2K(21.13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on updated averages of clutch frequency (5), clutch size (81.74), and remigration interval (2.7) for the NW Atlantic stock.';

data.pAm  = 0.41;    units.pAm  = 'W/kg'; label.pAm  = 'mass-specific metabolic rate '; bibkey.pAm  = 'Jone2009';   
  temp.pAm = C2K(20);  units.temp.pAm = 'K'; label.temp.pAm = 'temperature';
  comment.pAm = {'about 350 kg; assume that production is small (=no energy fixed in structure or gametes) and metab rate corresponds to assim rate. ', ... 
      'AO note: Average between trendline for mass-specific growth rate for 100, 200, 300, 400 kg individuals is .407,', ...
      'but all data from Wall2008 averages to 0.95 for resting, active, laying, field, max, and calculated values', ...
      'mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate '}; 

data.pXm  = 0.81;    units.pXm  = 'W/kg'; label.pXm  = 'maximum intake of jellyfish of fully grown individual'; bibkey.pXm  = 'Jone2009';   
  temp.pXm = C2K(20);  units.temp.pXm = 'K'; label.temp.pXm = 'temperature';
  comment.pXm = {'about 350 kg, 82 kg jelly fish/d for 250-450 kg turtle wit 200 J/g  = 82/350*200000/24/60/60 W/kg. ', ...
      'AO note: Energy budget calculations between EP and NWA, but suggests that average required feeding rate for ', ...
      'St. Croix (NWA) leatherbacks for a 2.85 remigration interval is 127 kg/d. Leatherback prey energy content is ', ... 
      '310 kJ/kg wet mass from Davenport & Balazs 1991).'};

% uni-variate data
% Table 3.1 in Jones 2009: used ONLY PARTLY, because data after 1.3 years dominated by 2 individuals, 
% the general trend represented well by data in Table 3.2 (see below)
% SCL = straight carapace length  
tLW_Jone = [ ... (time since birth (yr) SCL (cm) weight (kg)
0.003 6.31  0.046 % N = 20 turtles 
0.01  6.53  0.05 % (N=19)
0.03  7.22  0.06 % N=20
0.05  7.81  0.08
0.07  8.31  0.10
0.08  8.91  0.12
0.10  9.59  0.15
0.12 10.28  0.18
0.14 10.76  0.21
0.16 11.33  0.24
0.18 12.10  0.28 % N = 16
0.20 12.77  0.32 % N = 19
0.22 13.20  0.37 % N = 18
0.24 13.64  0.41 
0.26 14.35  0.45
0.28 14.92  0.51
0.30 15.49  0.56
0.32 16.04  0.62
0.33 16.49  0.68 % N = 16
0.35 17.50  0.82 % N = 12
0.37  18.23 0.91 % N = 10
0.39 18.88  1.01
0.41 19.41  1.10
0.43 20.10  1.21
0.45 20.55  1.28
0.47 21.19  1.39
0.49 22.04  1.51
0.51 22.61  1.68
0.53 23.68  1.87 % N = 9
0.55 24.40  2.03
0.56 25.14  2.28
0.58 25.82  2.40
0.60 26.27  2.63
0.62 27.57  2.81 % N = 7
0.64 28.10  3.03
0.66 28.61  3.20
0.68 29.31  3.47
0.70 30.21  3.77 % N = 6
0.72 30.92  4.15
0.74 31.74  4.30
0.76 32.29  4.51
0.78 32.89  4.85
0.79 33.36  5.10
0.83 34.30  5.49 % N = 5
0.85 35.21  5.92
0.87 35.36  6.15
0.89 36.21  6.61
0.91 36.81  6.75
0.93 38.26  7.55 % N = 4
0.95 39.06  8.00
0.97 39.75  8.40
0.99 40.44  8.76
1.01 41.28  9.12
1.02 42.61  9.68
1.04 42.53  9.89
1.06 43.21 10.57
1.08 43.75 11.30
1.10 44.97 11.53
1.12 45.46 11.63
1.14 46.02 12.26
1.16 46.08 11.89
1.18 46.34 12.05
1.22 47.36 12.87
1.24 47.57 12.79
1.25 47.86 13.23
1.31 50.30 15.44 % N = 3
1.33 52.00 17.26 % N = 2
1.35 53.10 17.99
1.37 53.90 18.68
1.39 52.60 17.28 % N = 1
1.45 54.50 18.76
1.47 55.45 18.72
1.49 56.30 19.88
1.51 56.10 20.20
1.53 56.70 20.02
1.55 57.10 20.28
1.56 57.70 21.14
1.59 58.20 23.06
1.60 58.70 22.92
1.62 59.50 23.56
1.67 61.50 25.60
1.69 60.20 25.38
1.72 62.50 27.20
1.85 67.00 31.96
1.93 69.00 34.84];
Nind = find(tLW_Jone(:,1)>=1.31); % find rows where there are three or fewer individuals 

tLW_Jone(:,1) = 365 * tLW_Jone(:,1); % convert yr to d
tLW_Jone(:,3) = 1e3 * tLW_Jone(:,3); % convert kg to g

data.tL_Jone = tLW_Jone(1:Nind(1)-1,1:2); % all data with four or more individiduals 
units.tL_Jone   = {'d', 'cm'};  label.tL_Jone = {'time since birth', 'straight carapace length, Jones'};  
temp.tL_Jone    = C2K(24);  units.temp.tL_Jone = 'K'; label.temp.tL_Jone = 'temperature';
bibkey.tL_Jone = 'Jone2009';
comment.tL_Jone = ['data from Table 3.1, captive animals, fed with Pacific Ocean squid, Todarodes pacificus; '...
  '(mantle and tentacles only), vitamins (ReptaviteTM), and calcium (Rep-CalTM), '...
  'blended with unflavored gelatin in hot water.'];
%
data.tW_Jone = tLW_Jone(1:Nind(1)-1,[1 3]); 
units.tW_Jone   = {'d', 'g'};  label.tW_Jone = {'time since birth', 'wet weight, Jones'};  
temp.tW_Jone    = C2K(24);  units.temp.tW_Jone = 'K'; label.temp.tW_Jone = 'temperature';
bibkey.tW_Jone = 'Jone2009';

data.LW_Jone = tLW_Jone(1:Nind(1)-1,[2 3]); 
units.LW_Jone   = {'cm', 'g'};  label.LW_Jone = {'straight carapace length', 'wet weight, Jones'};  
bibkey.LW_Jone = 'Jone2009';
% 
% % data below used for information only (only 3 or fewer individuals)
% data.tL_Jone_i = tLW_Jone(Nind,1:2); % all data with four or more individiduals 
% units.tL_Jone_i   = {'d', 'cm'};  label.tL_Jone_i = {'time since birth', 'straight carapace length, Jones'};  
% temp.tL_Jone_i    = C2K(24);  units.temp.tL_Jone_i = 'K'; label.temp.tL_Jone_i = 'temperature';
% bibkey.tL_Jone_i = 'Jone2009';
% comment.tL_Jone_i = '(informative) data from Table 3.1, where only 3 or fewer individuals- NOT used in fitting';
% data.tW_Jone_i = tLW_Jone(Nind,[1 3]); 
% units.tW_Jone_i   = {'d', 'g'};  label.tW_Jone_i = {'time since birth', 'wet weight, Jones'};  
% temp.tW_Jone_i    = C2K(24);  units.temp.tW_Jone_i = 'K'; label.temp.tW_Jone_i = 'temperature';
% bibkey.tW_Jone_i = 'Jone2009';
% data.LW_Jone_i = tLW_Jone(Nind,[2 3]); 
% units.LW_Jone_i   = {'cm', 'g'};  label.LW_Jone_i = {'straight carapace length', 'wet weight, Jones'};  
% bibkey.LW_Jone_i = 'Jone2009';


% Table 3.2 in Jones 2009 : captive reared turtles
tLW_cap = [0.20	13.29	0.34	%this study
0.43	20.69	1.28	%this study
1.25	46.45	11.54	%this study
0.60	24.65	2.36	%this study
1.31	48.40	13.04	%this study
0.60	24.06	2.20	%this study
1.93	69.00	34.84	%this study
0.33	15.01	0.58	%this study
0.68	28.38	3.42	%this study
0.26	14.62	0.46	%this study
0.18	11.57	0.26	%this study
1.37	55.40	20.36	%this study
0.81	34.74	5.44	%this study
0.24	12.05	0.30	%this study
0.35	16.00	0.70	%this study
0.33	17.15	0.75	%this study
0.91	35.13	5.58	%this study
0.33	13.69	0.37	%this study
0.33	14.95	0.46	%this study
0.51	19.87	1.20	%this study
1.71	43.50	7.27	%Deraniyagala, 1939
0.46	16.00	NaN	%Deraniyagala, 1939
0.08	5.40	NaN	%Bels et al., 1988
0.12	6.60	NaN	%Bels et al., 1988
0.12	7.80	NaN	%Bels et al., 1988
0.13	7.00	NaN	%Bels et al., 1988
0.16	7.80	NaN	%Bels et al., 1988
0.21	8.00	NaN	%Bels et al., 1988
0.22	8.10	NaN	%Bels et al., 1988
3.70	85.00	49.50	%Bels et al., 1988
0.12	8.10	NaN	%Bels et al., 1988
0.17	7.90	NaN	%Bels et al., 1988
0.30	8.90	NaN	%Bels et al., 1988
0.41	10.40	NaN	%Bels et al., 1988
0.41	10.80	NaN	%Bels et al., 1988
0.50	14.30	NaN	%Bels et al., 1988
0.22	13.20	NaN	%Frayr, 1970
0.67	21.6	1.04	%Phillips, 1977
0.56	37.00	4.50	%Birkenmeier, 1970
0.27	17.00	NaN	%Birkenmeier, 1970
0.23	14.00	NaN	%Birkenmeier, 1970
0.19	12.00	NaN	%Birkenmeier, 1970
0.13	10.50	NaN	%Birkenmeier, 1970
0.12	12.50	NaN	%Birkenmeier, 1970
0.13	12.50	NaN	%Birkenmeier, 1970
0.13	12.00	NaN	%Birkenmeier, 1970
];

tLW_cap(:,1) = 365 * tLW_cap(:,1); % convert yr to d
tLW_cap(:,3) = 1e3 * tLW_cap(:,3); % convert kg to g

data.tL_cap = tLW_cap(:,1:2); % age, length
units.tL_cap   = {'d', 'cm'};  label.tL_cap = {'time since birth', 'straight carapace length, Jones captive mix'};  
temp.tL_cap    = C2K(24);  units.temp.tL_cap = 'K'; label.temp.tL_cap = 'temperature';
bibkey.tL_cap = 'Jone2009';
comment.tL_cap = 'data from Table 3.2, captive animals. ''This study''from Jones 2009, other data from corresponding refs)';

use = find(~isnan(tLW_cap(:,3)));
data.tW_cap = tLW_cap(use,[1,3]); % age, wet weight
units.tW_cap   = {'d', 'g'};  label.tW_cap = {'time since birth', 'wet weight, Jones captive mix'};  
temp.tW_cap    = C2K(24);  units.temp.tW_cap = 'K'; label.temp.tW_cap = 'temperature';
bibkey.tW_cap = 'Jone2009';
comment.tW_cap = 'data from Table 3.2, captive animals. ''This study''from Jones 2009, other data from corresponding refs)';

data.LW_cap = tLW_cap(use,[2,3]); % SCL, wet weight
units.LW_cap   = {'cm', 'g'};  label.LW_cap = {'straight carapace length', 'wet weight, Jones captive mix'};  
bibkey.LW_cap = 'Jone2009';


% Table 3.3. , data from wild stradings or bycatch
LW_wild = [39.00	7	%MTN(1996)
8.50	0.096	%Deraniyagala, 1939
10.40	0.19	%J.Wyneken (pers.comm)
25.00	3.1	%J.Wyneken (pers.comm)
70.40	44.5	%NOAA (NMFS/PIFSC)
85.30	74.1	%NOAA (NMFS/PIFSC)
70.00	35.45	%NOAA (NMFS/PIFSC)
67.50	33.6	%NOAA (NMFS/PIFSC)
20.00	1.85	%MTN(2004)
31.00	3.3	%MTN(2004)
11.50	0.17	%M.Conti (pers.comm)
];
LW_wild = sort(LW_wild); %sort by length
data.LW_wild = [LW_wild(:,1), LW_wild(:,2)*1e3]; % SCL, wet weight
units.LW_wild   = {'cm', 'g'};  label.LW_wild = {'straight carapace length', 'wet weight, Jones wild'};  
bibkey.LW_wild = 'Jone2009';



% tL-data from Jone2009 and literature; temp 24 C? -- NM note: adult data from Zug et al - scheletochronology! 
% (plot Reader)
data.tL_skel = [ ... % SCL (cm), time since birth (yr)
8.810	131.930
9.880	129.633
13.683	139.585
14.188	132.695
14.880	127.592
15.288	134.226
16.325	138.820
16.637	150.813
17.361	148.262
18.182	130.144
20.473	152.344
21.261	142.137
21.485	125.550
22.582	139.585
22.865	143.413];
data.tL_skel(:,1) = 365 * data.tL_skel(:,1); % convert yr to d
units.tL_skel   = {'d', 'cm'};  label.tL_skel = {'time since birth', 'straight carapace length skel'};  
temp.tL_skel    = temp.am ;  units.temp.tL_skel = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL_skel = 'Jone2009'; comment.tL_skel = 'triangles in Fig 3.2, probably wild, Zug and Parham 1996 cited in Jone2009';


% Wyneken 2023 data
tLW_Wyn = [ ... (time since birth (d) SCL (cm) weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	4	4	4	4	4	5	5	5	6	6	6	6	6	6	7	8	8	8	8	8	8	8	8	8	8	8	8	8	8	9	9	9	9	9	9	9	9	9	11	11	11	11	11	12	12	12	12	12	12	13	13	13	14	15	15	15	15	15	15	15	15	15	15	15	15	15	16	16	16	16	16	16	16	16	16	17	19	19	19	19	19	19	19	19	19	20	21	21	21	22	22	22	22	22	22	22	22	22	22	22	22	22	22	22	22	22	23	23	23	23	23	25	26	26	26	26	26	26	26	26	26	27	28	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	30	30	30	30	30	32	32	32	32	32	32	33	33	33	33	34	34	34	34	34	34	34	35	35	35	35	36	36	36	36	36	37	37	37	37	37	39	39	39	39	39	39	40	40	40	40	41	42	42	42	42	43	43	43	43	43	44	44	44	44	44	46	46	46	46	46	46	47	47	47	47	48	50	50	50	50	50	50	50	50	50	52	52	52	52	53	54	56	56	57	58	58	58	61	64
6.12	5.87	6.03	5.85	6.05	6	5.76	5.59	5.95	5.91	6.08	6.16	6.11	6.12	6.19	6.16	6.1	6.26	5.94	5.94	6.12	6.1	6.11	5.88	6.05	6.12	6.33	6.3	6.11	6.09	6.35	5.91	5.88	5.88	5.78	6.15	6.11	6.18	6.86	6.37	6.5	6.49	6.63	6.69	6.78	6.71	6.42	6.56	6.4	6.8	6.65	6.65	6.26	7.03	7.03	7.03	6.72	7.05	7.33	6.96	6.94	7.1	7.2	6.77	6.66	6.51	6.43	6.81	6.6	6.56	7.12	6.72	6.85	6.75	6.88	6.91	7.33	6.95	6.85	7.06	6.99	7.21	7.44	7.3	7.32	7.26	7.04	6.87	7.24	7.15	6.78	7.32	7.19	7.1	7.49	7.49	7.52	7.33	7.37	8.15	7.6	7.68	7.6	7.8	7.27	7.28	7.38	7.3	7.33	7.07	7.24	7	6.75	7.56	7.63	7.45	7.49	7.51	7.63	7.76	7.96	7.74	7.51	7.3	7.2	7.82	7.46	7.72	7.5	7.48	8.12	7.84	7.89	7.74	7.9	8.68	8.12	8.22	8.06	8.2	7.47	7.52	7.42	7.14	7.75	7.6	7.9	7.64	7.8	8.03	8.19	7.87	7.87	7.92	8.18	7.97	8.3	8.14	7.94	7.54	7.57	8.15	7.97	7.79	8.42	8.45	8.45	8.24	8.38	8.22	7.85	9.04	8.6	8.73	8.54	8.84	8.07	7.94	8.22	8.07	8.03	8.48	8.18	8.03	8.18	8.7	8.37	8.36	8.62	8.35	8.25	7.92	8.82	9.43	8.88	9.15	8.82	9.12	8.1	8.72	8.7	8.72	8.32	8.34	8.05	8.63	8.22	8.38	8.36	8.68	8.4	8.38	8.72	8.68	8.51	8.67	8.95	8.7	8.76	8.96	8.63	8.49	8.12	8.38	8.96	9.06	9.06	8.7	8.69	8.53	8.9	8.61	8.69	8.66	8.72	8.6	8.7	9.27	9.04	8.69	9.03	9.36	8.9	8.76	8.99	8.63	8.93	8.43	8.55	9.46	9.22	9.35	8.72	8.33	8.8	8.61	8.83	8.9	9.11	8.74	9.21	9.15	8.74	9.28	8.82	8.65	9.1	8.8	9	9.44	8.75
44.2	44	43.8	44.2	44.2	45	46.2	46.2	38.8	41	46.6	47.2	46	47.2	48.2	45	46	46	44.8	44.8	43.8	46.4	46	43.8	47.2	47.4	49.4	48.2	48.4	48.2	48.8	41.2	40.2	42.8	40.6	47	49	45.2	51.2	50.6	51	48.8	50.8	54	54.6	55.2	49.8	52.5	49.9	57.6	56	54	47.8	62	59.4	58.2	56.2	57.8	66.6	64.4	61.8	67	62.8	55.8	53.8	54	49.2	58.8	54.6	55.4	63	61.8	59.8	60.2	62.8	60.6	59.8	57.8	58.2	62.6	63.2	69.4	71	71.2	68.4	69.6	67.2	61.4	65.8	64	61	65.8	64.8	63.8	77.4	73.2	72.6	69.6	72.8	90.8	81	81.6	79	82	74.4	70.2	75.6	75.4	69.6	63	63	66.2	58.2	77.4	71.8	73.2	69.4	72.8	77	81.2	84.4	82.6	79.6	74	68.4	79.9	77.2	77.2	75.6	75.4	92.6	87	85.8	83.8	86	112.2	101	103.4	100.8	98.8	75.4	75.2	78.6	70	86	83	87.6	86.4	83	88.2	87.4	88.6	85	85.2	92.2	92.8	96.6	97	96	86.8	78.2	92.4	88.8	86	109.4	107.4	101.2	98.6	98.8	91.8	87.6	122.8	111.4	114	116	116.8	100	91.6	98.6	95.8	93.2	93.8	97	93	94.2	107.2	99.6	111	106.6	111	103	103.4	123.4	138.6	123.4	127.8	123.4	125.4	87	108.4	107.9	108.7	107.8	101.8	96.6	107.4	97.8	107.8	104.8	113	113.6	106	108.8	112	102.2	102.2	119.2	108.2	122.8	118.6	119.4	112.6	115.4	98.8	112.6	122.6	117.8	109.4	111.6	102.6	120.8	109.2	115.4	113	105.8	119.2	114.2	116.8	121.8	108.2	115.8	129.6	115.8	123	122	123.8	118.8	121.6	108	124.2	132.4	131	114.2	106.6	120.6	111	117.2	127	131	127.8	117.2	125	112.9	129.2	117.2	103.8	130	116.4	118.6	137.4	107.8
]';
data.tL_Wyne = tLW_Wyn(:,1:2);
units.tL_Wyne   = {'d', 'cm'};  label.tL_Wyne = {'time since birth', 'straight carapace length'};  
temp.tL_Wyne    = C2K(24);  units.temp.tL_Wyne = 'K'; label.temp.tL2tL_Wyne = 'temperature';
bibkey.tL_Wyne = 'Wyne2023';
comment.tL_Wyne = 'captive animals fed Jeanette Wyeneken diet';
%
data.tW_Wyne = tLW_Wyn(:,[1 3]); 
units.tW_Wyne   = {'d', 'g'};  label.tW_Wyne = {'time since birth', 'wet weight'};  
temp.tW_Wyne   = C2K(24);  units.temp.tW_Wyne = 'K'; label.temp.tW_Wyne = 'temperature';
bibkey.tW_Wyne = 'Wyne2023';

data.LW_Wyne = tLW_Wyn(:,[2 3]); 
units.LW_Wyne   = {'cm', 'g'};  label.LW_Wyne = {'SCL, Wyne', 'wet weight'};  
bibkey.LW_Wyne = 'Wyne2023';


% Wyneken 2009 data
tLW_Wyn09 = [ ... (time since birth (d) SCL (cm) weight (g)
0	0	0	0	0	0	0	0	8	8	8	8	8	8	10	10	16	16	16	16	16	16	17	17	23	23	23	23	23	23	24	24	30	30	30	30	30	30	31	32	37	37	37	37	37	37	39	44	44	44	44	44	44	46	51	51	51	51	53	58	58	60
5.95	5.685	6.03	5.98	6.56	5.98	6.55	6.15	6.69	6.79	6.59	6.66	6.75	6.97	6.33	7.12	7.18	7.49	7.14	7.39	7.21	7.62	7.04	7.56	7.45	7.64	7.48	7.84	7.45	7.59	7.4	7.82	8.03	8.11	8.03	8.01	8.03	8.4	8.19	7.59	8.28	8.48	8.16	8.32	8.24	8.65	7.81	8.27	8.76	8.29	8.56	8.22	8.85	8.17	8.47	8.71	8.41	8.99	8.77	9.28	8.9	8.7
40.71	45.39	46.09	44.08	47.67	44.08	46.06	49.08	53.46	50.9	50.23	54.49	49.11	56.76	47.58	68.15	64.36	62.35	60	66.84	64.36	66.98	61.83	81.5	78.79	78.14	78.26	84.5	79.16	83.13	67.13	93.33	92.35	87.32	89.38	93.24	90.88	99.1	100.39	78.47	98.45	98.78	94.28	101.84	101.62	107.43	90.18	99.34	111.66	94.12	105.28	104.24	111.38	101.12	99.23	110.23	93.2	114.32	107.06	129.06	110.97	109.34
 ]';
data.tL_Wyne09 = tLW_Wyn09(:,1:2);
units.tL_Wyne09   = {'d', 'cm'};  label.tL_Wyne09 = {'time since birth', 'straight carapace length'};  
temp.tL_Wyne09    = C2K(21.5);  units.temp.tL_Wyne09 = 'K'; label.temp.tL2tL_Wyne09 = 'temperature';
bibkey.tL_Wyne09 = 'Wyne2023';
comment.tL_Wyne09 = 'captive animals fed Jeanette Wyeneken diet in 2009';
%
data.tW_Wyne09 = tLW_Wyn09(:,[1 3]); 
units.tW_Wyne09   = {'d', 'g'};  label.tW_Wyne09 = {'time since birth', 'wet weight'};  
temp.tW_Wyne09   = C2K(21.5);  units.temp.tW_Wyne09 = 'K'; label.temp.tW_Wyne09 = 'temperature';
bibkey.tW_Wyne09 = 'Wyne2023';

data.LW_Wyne09 = tLW_Wyn09(:,[2 3]); 
units.LW_Wyne09   = {'cm', 'g'};  label.LW_Wyne09 = {'SCL, Wyne', 'wet weight'};  
bibkey.LW_Wyne09 = 'Wyne2023';

% Wyneken 2013 data
tLW_Wyn13 = [ ... (time since birth (d) SCL (cm) weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	6	6	6	6	6	7	7	7	7	7	7	7	13	13	13	13	13	14	14	14	14	14	14	14	20	20	20	20	20	21	21	21	21	21	21	21	27	27	27	27	27	28	28	28	28	28	28	28	34	34	34	34	34	35	35	35	35	35	35	35	41	41	41	41	41	42	42	42	42	42	42	42	48	48	48	48	48	49	49	49	49	50	50	50	55	55	55	55	55	57	57	57	57	57	63	63	63	63	63	64	64	64	64	64	70	70	70	70	70	70	70	71	71	77	77	77	77	77	77	77	83	83	83	84	84	90	90	90	91	94	97	97	97	98	101	105	105	107	107	107	111	111	111	112	112	118	118	118	119	119	125	125	125	129	132	133
5.55	5.87	5.63	5.61	5.82	6.31	6.28	6.06	6.16	5.96	5.98	6.05	6.12	6.4	6.22	6.03	6.21	6.89	6.71	6.62	6.8	6.36	6.28	6.59	6.58	6.81	6.65	6.64	6.64	7.39	7.27	7.17	7.51	6.71	6.56	6.83	7.21	7.16	7.06	7.06	7.08	7.79	7.53	7.58	7.79	7.32	7.53	7.21	7.48	7.69	7.51	7.67	7.41	8.63	8.22	8.29	8.73	7.7	7.8	7.69	8.12	8.32	8.09	8.2	8.11	9.01	8.43	8.41	9.01	8.06	8.1	7.91	8.62	8.49	8.51	8.58	8.38	9.15	8.64	8.76	9.37	8.26	8.32	8.2	8.64	8.65	8.65	8.66	8.42	9.32	8.81	8.81	9.23	8.62	8.6	8.53	9.14	9.05	8.68	8.81	8.25	10.04	9.5	8.67	8.81	8.71	9.48	9.12	9.26	9.58	9.03	9.93	9.47	8.61	9.1	8.81	9.28	9.31	9.25	9.27	9.19	8.77	9.17	10.03	9.6	9.78	9.51	9.83	9.45	9.99	10	9.28	9.03	9.8	9.76	10.26	9.97	9.81	10.17	9.9	11.26	10.29	10.62	10.61	10.5	11.65	11.6	11.81	11.34	11.1	11.19	10.92	11.2	11.63	11.1	12.51	11.28	11.98	12.06	12	12.39	11.48	11.86	12.24	11.84	12.14	12.61	12.56
44.3	46.5	43.2	42.9	43.5	45.2	45.7	45.8	46.2	48.7	49.1	50.4	45	50.3	45.8	46.1	44.5	53.5	54	53.1	57.5	50.4	48.3	50.1	59.3	62.3	56.2	59.5	57.8	68.7	72.1	67.4	76.6	60	57.9	62	71.1	71.8	67.3	73.5	69.4	85	89.6	82.7	93.2	73.7	79.1	74.5	88.3	88.7	82.2	91	80.8	109.4	104.8	102	119.1	89.2	90	87.1	108.2	108.1	99	111.5	97.7	125.9	121.6	112.7	139.2	98.2	103.1	94.3	127.8	119.6	117.3	122.5	109.6	144.8	139.1	134	156	105.9	108.9	107.2	136	133.2	126.4	140.3	119.1	147.2	142.6	128.1	141.9	108.7	109.3	106.5	149.8	142.6	127.3	142.3	134.7	171.7	161.4	118.7	134.1	120.8	150.6	142.8	148.9	168.1	132.7	178.5	173.3	126.1	139.5	120.5	179.6	156.1	167.9	179.3	153.3	124.4	141.6	193	190.4	179.6	177.4	193.4	168.8	161.4	196.1	148.9	179.2	198.3	177.7	218.5	163.3	187.8	218.1	190.1	242.3	186.9	210.3	228.1	213.5	201.9	256.6	280.7	222.5	224.8	258.1	233.6	247.8	267.5	237.6	302.2	226.6	264	286.2	255.3	305	251.6	281.7	313	262.4	277.5	316.1	305.5
 ]';
data.tL_Wyne13 = tLW_Wyn13(:,1:2);
units.tL_Wyne13   = {'d', 'cm'};  label.tL_Wyne13 = {'time since birth', 'straight carapace length'};  
temp.tL_Wyne13    = C2K(22);  units.temp.tL_Wyne13 = 'K'; label.temp.tL2tL_Wyne13 = 'temperature';
bibkey.tL_Wyne13 = 'Wyne2023';
comment.tL_Wyne13 = 'captive animals fed Jeanette Wyeneken diet';
%
data.tW_Wyne13 = tLW_Wyn13(:,[1 3]); 
units.tW_Wyne13   = {'d', 'g'};  label.tW_Wyne13 = {'time since birth', 'wet weight'};  
temp.tW_Wyne13   = C2K(22);  units.temp.tW_Wyne13 = 'K'; label.temp.tW_Wyne13 = 'temperature';
bibkey.tW_Wyne13 = 'Wyne2023';

data.LW_Wyne13 = tLW_Wyn13(:,[2 3]); 
units.LW_Wyne13   = {'cm', 'g'};  label.LW_Wyne13 = {'SCL, Wyne', 'wet weight'};  
bibkey.LW_Wyne13 = 'Wyne2023';

% Wyneken 2014 data
tLW_Wyn14 = [ ... (time since birth (d) SCL (cm) weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	4	4	4	5	5	5	5	5	5	5	7	7	7	7	8	8	8	9	9	9	9	9	9	9	9	9	10	10	10	10	10	10	10	10	11	11	11	12	12	12	12	12	12	12	12	12	12	12	15	15	15	16	16	16	16	16	16	16	16	16	17	17	17	17	17	17	17	17	18	18	18	19	19	19	19	19	19	19	19	19	19	19	22	22	22	23	23	23	23	23	23	23	23	23	24	24	24	24	24	24	25	25	25	26	26	26	26	26	26	26	26	26	26	26	28	28	29	29	29	30	30	30	30	30	30	30	30	30	31	31	32	32	32	33	33	33	33	33	33	33	33	33	33	33	33	33	36	36	36	37	37	37	37	37	37	37	37	37	38	38	38	38	40	40	40	40	40	40	41	41	41	42	42	42	42	42	44	44	44	44	44	44	44	44	44	45	45	45	45	45	45	45	47	47	47	47	47	47	47	47	49	49	51	51	51	51	51	53	53	53	53	53	53	53	54	54	54	54	54	54	54	54	54	54	54	54	54	56	56	57	57	59	59	60	60	60	60	61	61	61	61	61	61	62	62	62	63	63	63	63	63	63	63	65	65	65	65	66	66	68	68	68	68	68	68	68	68	69	69	70	70	70	70	72	72	72	73	74	74	74	74	75	75	75	75	75	75	76	76	77	77	77	77	80	81	81	81	81	81	81	81	82	82	82	82	82	83	83	84	84	84	84	87	88	88	88	88	88	88	88	89	89	89	89	90	90	90	91	91	91	91	94	95	95	95	95	95	95	95	96	97	97	98	98	98	98	98	101	102	102	102	102	102	102	103	103	103	103	104	104	105	105	107	109	109	109	109	109	110	111	111	112	115	115	115	115	116	117	118	118	118	122	122	123	125	125	130	130	131	131	136	136	138	138	144	144
6.3	6.28	6.02	6.19	5.95	6.24	6.11	6.12	6.38	6.09	6.07	6.26	5.95	5.94	5.9	5.9	5.75	6	5.92	6.04	6.15	5.83	6	5.86	5.57	5.56	5.66	5.75	5.74	5.82	5.63	5.67	6	6.31	6.24	6	6.07	5.47	6.54	6.06	6.22	6.58	6.13	5.97	7.07	7.2	6.85	7.16	6.67	6.33	6.82	6.82	6.9	6.96	6.9	7.09	6.62	6.61	6.66	6.71	6.64	6.33	6.43	6.3	6.36	6.39	6.41	6.54	6.49	6.33	6.54	7.32	7.5	7.14	7.33	6.77	7.04	6.96	6.6	6.92	6.6	6.75	7.28	6.85	7.25	7.26	7.3	7.32	7.3	7.53	7.12	7.02	7.01	7	7.01	6.73	6.92	6.71	6.92	6.91	7.09	6.58	7.03	6.75	6.91	7.86	8.08	7.67	7.98	7.22	7.48	7.36	7.05	7.34	6.91	7.02	7.66	7.37	7.62	7.78	7.9	7.75	7.85	8.05	7.49	7.46	7.21	7.51	7.56	7.21	7.35	7.13	7.28	7.35	7.65	7.23	7.38	8.24	8.33	8.46	8.74	7.72	7.96	7.96	7.55	7.85	7.69	7.35	7.46	7.6	8.27	7.82	8.14	8.23	8.34	8.29	8.13	8.46	7.92	7.83	7.65	7.85	8.15	7.7	7.79	7.49	7.61	8.46	8.76	8.42	8.77	7.88	8.93	8.1	7.65	8.08	7.65	7.65	7.9	8.05	8.29	7.97	8.31	8.36	8.59	8.53	8.24	8.76	8.51	8.51	8.19	8.5	8.14	7.87	7.86	8.06	8.65	9.05	8.5	8.95	7.66	8.03	8.39	7.84	8.12	8.2	8.65	8.69	8.18	8.31	8.44	8.73	8.74	8.63	9.16	8.47	8.35	8.22	8.44	8.69	8.49	8.92	8.13	7.85	8.03	8.13	8.89	9.11	8.95	9.25	8.69	8.55	7.79	8.07	7.91	8.14	9.05	9.56	9.26	9.31	9.74	8.78	8.54	8.28	8.75	8.28	8.23	8.03	9.43	9.6	8.64	8.74	8.5	8.26	8.56	8.16	7.94	8.14	8.11	7.58	7.9	8.04	8.65	8.77	9.06	8.64	8.36	9.56	10.12	9.6	10.3	8.64	8.1	8.82	8.53	7.8	8.33	8.71	8.39	8.52	9.8	9.65	8.71	8.77	8.93	8.53	8.08	9.1	9.14	9.34	8.74	8.76	9.24	9.42	9.09	8.62	8.2	8.67	8.46	8.05	8.33	9.003	8.54	8.47	8.87	9.18	8.53	9.87	10.33	10	8.98	9.38	9.02	9.15	9.15	10.15	9.26	9.05	8.52	8.25	8.67	9.15	8.71	9.01	9.01	8.85	8.96	9.09	10	10.7	10.27	9.5	9.62	9.6	8.8	9.24	9.01	9.06	8.69	8.02	9.6	8.91	9.2	8.83	9.02	9.07	9.02	10.08	10.78	10.34	9.81	9.15	9.23	9.15	9.71	9.18	9.59	9.05	9.86	9.3	9.17	10.67	9.81	9.39	9.31	9.46	10.21	10.11	9.43	9.1	8.98	9.86	9.43	10	10.35	9.55	10.68	9.25	9.85	9.74	9.33	9.75	9.68	10.14	10	8.05	9.52	9.08	9.84	10.16	9.61	10.32	9.28	9.1	10.4	9.33	10.06	11.19	9.94	9.59	9.29	10.06	10.1	10.2	9.94	9.49	9.53	9.2	10.06	10.35	11.73	10.56	10.26	9.84	9.99	10.98	10.38	10.99	10.9	9.57	11.4	11.18	11.49	10.11	11.21	11.75	11.16	10.15	11.38	9.96
46.4	45.1	43.8	44.8	47.8	46.2	46.1	47.5	45.3	43.2	43.8	45.4	41.8	47.5	46.2	47.3	44.9	44.2	45.9	48.6	48	47.3	47.9	48.5	42.2	46.3	43.1	42.8	45	44.8	44.2	43.4	46.4	46	34.6	37.3	32.6	55	40.3	46.7	42.1	61.3	47.2	45	61.7	63.2	59.3	62.9	60.7	47.3	42.4	59.1	58.5	60.2	61	60.2	54.5	55.3	53.3	56.4	51.4	49.9	53.3	52.5	58.6	56.1	56	56.7	57.9	53.2	57.8	70.1	71.7	69	70.7	59.7	60.1	60.4	58.3	60.4	58.5	56.4	67.9	67	65.8	77.3	76	78.6	76	75.6	55	54	60.3	60.2	70.2	61.5	68.4	62.1	71.6	69.8	69.3	65.4	71	63.6	69.2	83	86	82.3	89.3	73.7	76.1	72.9	72.2	75.6	65.7	63.1	84.7	76.8	76.2	96.4	80.6	97.4	86.8	87.1	76.1	78.4	72.5	78.9	80.6	72.5	74.9	71.5	80.4	77.7	87.9	71.4	83.6	98.8	97.9	98.9	95.2	86.4	85.1	83.6	85.6	84.8	82.9	78.6	78	76.9	101.7	93.6	93.3	99.4	101.9	101.7	97.2	96.1	93.1	94.2	85.9	92.4	92.5	89.1	94.8	75.8	89.2	99.5	105.1	99.1	109.9	91.5	95.7	90.4	92.2	93.6	84	80.9	94.9	90.7	96.5	96.3	96.2	114.1	120.5	116.7	111.5	107.7	108.5	106.8	97.4	105.3	97.7	95.7	96.4	96.1	107.2	116.7	113	121	93.9	92.7	106	87	101.4	101.6	101.4	107.8	106.1	106.3	122.3	121.8	121.3	117.7	118.5	110.9	108.7	97.5	106.9	113.3	107.8	107.2	104.8	90.9	111.4	107.4	109.6	123.1	116.3	123.2	106	107.6	102.3	100.8	99.1	99.5	138.5	145.4	141.3	138.9	141.6	128.5	120	115.6	122.7	118.1	98	107.1	129.7	137.6	108.5	103.8	116.8	115.6	113.3	102.9	93.7	117	107.6	102.3	101.7	102.7	98.6	118	116.9	125.2	126.1	154.9	162.2	153.9	150.3	114.5	96.8	128.3	117.7	112.2	111.9	129.9	102.5	115.4	139.7	137	118.8	111.4	124	125.5	110.2	145.5	138.9	133.5	129.5	120.8	119.1	137.3	135	119.8	102.9	137	125.3	115.5	117	142.3	110.8	128.5	126.1	127.7	120.8	175.9	183.4	175	130.8	148.3	142.8	142	133.4	154.5	137.3	136.6	128.5	109.9	128.1	149.8	118.9	137.9	131.9	132.4	126.6	142.1	186.8	190.1	188.1	147.4	146.5	148.8	139.1	152.4	140.9	137.9	109.2	128.8	156	130.6	138.3	137.9	132.2	132.6	146.6	192	202.3	197.3	157.2	147.5	153	142	158.6	133.4	148.6	126.6	168.5	131.6	141	168.3	150	149.6	137.7	157	201.7	198.4	162.9	144.9	142.6	156.9	157.1	158.2	183.1	147	165.3	150.2	157.5	157.1	148.6	169.9	175	217.2	169.1	146.7	149.9	162.8	146.1	188.7	150.7	167.7	146.9	142.2	170	149.2	172.8	225.6	178	156.8	155	163.4	175.2	190.9	155.1	162	161.9	162.9	171.4	177.3	221.4	192.3	210.5	165.3	167.6	237.2	180.7	205.9	226.1	162.5	241.7	224.9	243.3	162.4	224.4	237.2	253.3	177	271.4	171
]';
data.tL_Wyne14 = tLW_Wyn14(:,1:2);
units.tL_Wyne14   = {'d', 'cm'};  label.tL_Wyne14 = {'time since birth', 'straight carapace length'};  
temp.tL_Wyne14    = C2K(21.5);  units.temp.tL_Wyne14 = 'K'; label.temp.tL2tL_Wyne14 = 'temperature';
bibkey.tL_Wyne14 = 'Wyne2023';
comment.tL_Wyne14 = 'captive animals fed Jeanette Wyeneken diet';
%
data.tW_Wyne14 = tLW_Wyn14(:,[1 3]); 
units.tW_Wyne14   = {'d', 'g'};  label.tW_Wyne14 = {'time since birth', 'wet weight'};  
temp.tW_Wyne14  = C2K(21.5);  units.temp.tW_Wyne14 = 'K'; label.temp.tW_Wyne14 = 'temperature';
bibkey.tW_Wyne14 = 'Wyne2023';

data.LW_Wyne14 = tLW_Wyn14(:,[2 3]); 
units.LW_Wyne14   = {'cm', 'g'};  label.LW_Wyne14 = {'SCL, Wyne', 'wet weight'};  
bibkey.LW_Wyne14 = 'Wyne2023';


% time-respiration for embryo
data.tJO_e = [ ... % d, resp for mean of 6 eggs
12.0674, 0.2064
19.1258, 0.3033
26.1126, 0.6609
33.1134, 2.0351
40.2152, 5.3121
47.3265, 9.2928
51.2471, 10.5139
53.2681, 10.0686
55.3004, 10.4575
57.1662, 9.6475];
units.tJO_e   = {'d', 'ml/h'};  label.tJO_e= {'incubation time', 'O_2 consumption rate'};  
temp.tJO_e    = C2K(30);  units.temp.tJO_e = 'K'; label.temp.tJO_e = 'temperature';
bibkey.tJO_e = 'Thom1993';
comment.tJO_e = 'initial mass 85.5 g; hatchling mass 45.09 g wet, 9.776 g dry';

% repro output (fecundity), from EDIT: Hirt1987
LN =[ ... % SCL (cm), % eggs per nest (#)
134	82
137	417
142	131
145	473
146	428
147	602
148	491
150	733
152	432
153	907
155	534
156	506];

data.LN = LN; units.LN  = {'cm', '#/clutch'};  label.LN = {'SCL', 'eggs per clutch'};
fecund.LN = 5/2.7; units.fecund.LN = 'clutches/year'; label.fecund.LN = 'clutches per nesting season/years between nesting seasons';
comment.LN = 'for fecundity, used an average 5 nests per season per female with nesting seasons 2.7 yrs apart';
bibkey.LN = {'Hirt1987', 'Fraz1991'};

%% set weights for all real data
weights = setweights(data, []);
% weights.pAm = 5 * weights.pAm;
weights.Ww0 = 0 * weights.Ww0; %mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight 
weights.pAm = 0 * weights.pAm; % mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate';
weights.tJO_e = 0.5 * weights.tJO_e;
weights.Li = 5 * weights.Li;
weights.Wwi = 5* weights.Wwi;
weights.Lp = 100* weights.Lp;
weights.tL_skel = 10* weights.tL_skel;
weights.LN = 10* weights.LN;
weights.Ri = 10* weights.Ri;
weights.ap = 0.5* weights.ap; % models point to a lower value, so reduce weight of this data point

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.fecund = fecund;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Jone','tL_cap', 'tL_skel'}; comment1 = {'Captive data + skeletochron data, Length, Jones 2009'};
set2 = {'tW_Jone','tW_cap'}; comment2 = {'Captive data: Weight, Jones 2009'};
set3 = {'LW_Jone','LW_cap', 'LW_wild'}; comment3 = {'Captive + wild data LW, Jones 2009'};
%set7 = {'LW_0188f', 'LW_1883f', 'LW_0644f', 'LW_0882f', 'LW_1633f'};  comment6 = {'Length-Wet mass for 5 females (RIT Prince)'};
%set8 = {'LW_1307m', 'LW_1097m', 'LW_0005m', 'LW_0097m', 'LW_0697m'}; comment7 = {'Length-Wet mass for 5 males (RIT Prince)'};
%set9 = {'LW_UWW891', 'LW_UWW892'}; comment8 = {'Length-Wet mass for 2 individuals (RIT Prince)'};
metaData.grp.sets = {set1, set2, set3};
metaData.grp.comment = {comment1, comment2, comment3};
%%% NINA %%% 
set4 = {'tL_Wyne','tL_Wyne09', 'tL_Wyne13', 'tL_Wyne14'}; comment4 = {'four diet data, Length, Wyneken 2023'};
set5 = {'tW_Wyne','tW_Wyne09', 'tW_Wyne13', 'tW_Wyne14'}; comment5 = {'four diet data: Weight, Wyneken 2023'};
set6 = {'LW_Wyne','LW_Wyne09', 'LW_Wyne13', 'LW_Wyne14'}; comment6 = {'four diet data: LW, Wyneken 2023'};
metaData.grp.sets = {set4, set5, set6};
metaData.grp.comment = {comment4, comment5, comment6};


%% Discussion points
D1 = 'Jone2009: 1.3e11 g jellyfish converts to 2.6e13 J, so jellyfish have 200 J/g';
D2 = 'mod_1: data on ingestion/metam revised, tJO_e, Ww0, Wdb data added';
D3 = 'mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate';
D4 = 'mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight';
D5 = ['mod_2: We use data from Jones 2009 (Tables 3.1, 3.2 and 3.3, combined with data from Zug et al  (1986) presented in figure 3.2) for parameter estimation.', ...
    'Data from Table 3.1 used partially (where N>3), and tL1 data in the original entry had mixed captive and wild turtles- now revised'];
D6 = ['mod_2: f for the wild assumed less than maximum (f=0.9) and applied for all calculations pertaining to wild turtles'];
D7 = ['mod_2: removed d_V = d_E = 0.22 as no reference was provided; re-estimated all parameters to be more in line with other sea turtle parameters,'...
    'including kappa closer to 0.8 instead of 0.2, and z>60 as this is the largest species '];
D8 = ['mod_2: Added data on growth sourced from captive rearing, courtesy of J. Wyneken'];

metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, ...
    'D6',D6, 'D7',D7, 'D8',D8);

%% Facts
F1 = ['all 7 species of sea turtles nest on beaches; '...
     'females lay up to 7 clutches at 10 - 14 d intervals. '...
     'interbrood interval 2 - 8 yrs; males might return each yr. '...
     'Feeding starts 5-11 d after hatching'];
metaData.bibkey.F1 = 'Jone2009'; 
F2 = 'feeds on gelatinous zooplankton, mostly jellyfish: Aurelia, Chrysaora, Cyanea, Rhizostoma, Stomolophus';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '34XB9'; % Cat of Life
metaData.links.id_ITIS = '173843'; % ITIS
metaData.links.id_EoL = '46559482'; % Ency of Life
metaData.links.id_Wiki = 'Dermochelys_coriacea'; % Wikipedia
metaData.links.id_ADW = 'Dermochelys_coriacea'; % ADW
metaData.links.id_Taxo = '48459'; % Taxonomicon
metaData.links.id_WoRMS = '137209'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Dermochelys&species=coriacea'; % ReptileDB
metaData.links.id_AnAge = 'Dermochelys_coriacea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermochelys_coriacea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'PricWall2006'; type = 'Article'; bib = [ ... 
% 'author = {Price, E. R. and Wallace, B. P. and Reina, R. D. and Spotila, J. R. and Paladino, F. V. and Piedra, R. and V\''{e}lez, E.}, ' ... 
% 'year = {2006}, ' ...
% 'title = {Size, growth, and reproductive output of adult female leatherback turtles \emph{Dermochelys coriacea}}, ' ...
% 'journal = {Endang Species Res}, ' ...
% 'volume = {1}, ' ...
% 'pages = {41--48}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dermochelys_coriacea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AvenTayl2009'; type = 'article'; bib = [ ...
'author = {Avens, L. and Taylor, J. C. and Goshe, L. R. and Jones, T. T. and Hastings, M. }, ' ... 
'title = {Use of skeletochronological analysis to estimate the age of leatherback sea turtles \textit{Dermochelys coriacea} in the western North Atlantic. }, ' ... 
'journal = {Endangered Species Research}, ' ... 
'year = {2009}, ' ... 
'volume = {8(3)}, ' ... 
'pages = {165-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'AvenGosh2020'; type = 'article'; bib = [ ...
'author = {Avens, L. and Goshe, L. R. and Zug, G. R. and Balazs, G. H. and Benson, S. R. and Harris, H. }, ' ... 
'title = {Regional comparison of leatherback sea turtle maturation attributes and reproductive longevity}, ' ... 
'journal = {Marine Biology}, ' ... 
'year = {2020}, ' ... 
'volume = {167(1)}, ' ... 
'pages = {4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
%bibkey = 'Casey2014'; type = 'article'; bib = [ ...
%'author = {Casey, James P., Michael C. James, and Amanda S. Williard}, ' ... 
%'title = { Behavioral and metabolic contributions to thermoregulation in freely swimming leatherback turtles at high latitudes.}, ' ... 
%'journal = {Journal of Experimental Biology}, ' ... 
%'year = {2014}, ' ... 
%'volume = { 217, no. 13}, ' ... 
%'pages = {2331-2337}'];
%metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
%bibkey = 'Dugay1968'; type = 'article'; bib = [ ...
%'author = {Dugay, R.}, ' ... 
%'title = {Note sur la frequence de la tortue luth Dermochelys coriacea L. pres des cotes de la Charente Maritime}, ' ... 
%'journal = {Ann. Soc. Nat. Char. Maritime}, ' ... 
%'year = {1968}, ' ... 
%'volume = {4(8)}, ' ... 
%'pages = {8-16}'];
%metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
%bibkey = 'Duron1978'; type = 'phdthesis'; bib = [ ...
%'author = {Michele Duron}, ' ... 
%'title = {Contribution à l%étude de la biologie de Dermochelys coriacea (Linné) dans les Pertuis Charentais. }, ' ... 
%'school = {University of Bordeaux, Talence}, ' ... 
%'year = {1978}'];
%metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'ESA2020'; type = 'techreport'; bib = [ ...
'author = {United States. National Marine Fisheries Service ; U.S. Fish and Wildlife Service}, ' ... 
'title = {Endangered Species Act status review of the leatherback turtle (\textit{Dermochelys coriacea})}, ' ... 
'institution = {NMFS (National Marine Fisheries Service)}, ' ... 
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Fraz1991'; type = 'article'; bib = [ ...
'author = {Tucker, A. D., & Frazer, N. B.}, ' ... 
'title = {Reproductive variation in leatherback turtles, \textit{Dermochelys coriacea}, at {C}ulebra national wildlife refuge, {P}uerto {R}ico.}, ' ... 
'journal = {Herpetologica}, ' ... 
'year = {1991}, ' ...  
'pages = {115-124.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Giro2021'; type = 'article'; bib = [ ...
'author = {Girondot, Marc, Baptiste Mourrain, Damien Chevallier, and Matthew H. Godfrey.}, ' ... 
'title = {Maturity of a giant: age and size reaction norm for sexual maturity for {A}tlantic leatherback turtles}, ' ... 
'journal = {Marine Ecology}, ' ... 
'year = {2021}, ' ... 
'volume = {42(5)}, ' ... 
'pages = {e12631}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Hirt1987'; type = 'techreport'; bib = [ ...
'author = {Hirth, H. F. }, ' ... 
'title = { Some aspects of the ecology of the leatherback turtle \textit{Dermochelys coriacea} at {L}aguna {J}alova, {C}osta {R}ica}, ' ... 
'institution = {US Department of Commerce, National Oceanic and Atmospheric Administration, National Marine Fisheries Service.}, ' ... 
'year = {1987}, ' ... 
'volume = {56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Hsu2020'; type = 'phdthesis'; bib = [ ...
'author = {Sharon Hsu}, ' ... 
'title = {Using Stable Isotopes to Determine Foraging Areas of Leatherback Sea Turtles: Limitations of the Isotope Tracking Technique in the Western Atlantic Ocean. }, ' ... 
'school = {San Jose State University}, ' ... 
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Jone2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Jones, T. T.}, ' ... 
'year = {2009}, ' ...
'title = {Energetics of the leatherback turtle, \emph{Dermochelys coriacea}}, ' ...
'howpublished = {\url{https://circle.ubc.ca/handle/2429/7454?show=full}}, ' ...
'school = {Univ Britisch columbia (Vancouver)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thom1993'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(93)90445-A}, ' ...
'author = {Thompson, M. B.}, ' ... 
'year = {1993}, ' ...
'title = {Oxygen consumption and energetics of development in eggs of the leatherback turtle, \emph{Dermochelys coriacea}}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'volume = {104(3)}, ' ...
'pages = {449–453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wood1982'; type = 'book'; bib = [ ...
'author = {Wood, Gerald L}, ' ... 
'title = {The Guinness book of animal facts and feats}, ' ... 
'publisher = {Enfield, Middlesex : Guinness Superlatives}, ' ... 
'year = {1982}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Wyne2023'; type = 'misc'; bib = [ ...
'author = {Jeanette Wyneken}, ' ... 
'note = {Wyneken lab experiements at {F}lorida {A}tlantic {U}niversity: CONFIDENTIAL, use permitted for this model through Upwell Turtles collaboration}, ' ... 
'year = {2023}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'ZugParh1996'; type = 'article'; bib = [ ...
'author = {Zug, G. R. and Parham, J. F.}, ' ... 
'title = {Age and growth in leatherback turtles, \textit{Dermochelys coriacea} (Testudines: Dermochelyidae): a skeletochronological analysis}, ' ... 
'journal = {Chelonian Conservation and Biology}, ' ... 
'year = {1996}, ' ... 
'volume = {2}, ' ... 
'pages = {244-249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];


