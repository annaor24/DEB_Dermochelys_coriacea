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

metaData.T_typical  = C2K(26.4); % K, body temp --> THIS SEEMS WAY TOO HIGH, ESP. COMPARED TO TEMP.AM
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

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 06 13];


%% set data
% zero-variate data

data.ab = 63; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = {'ESA2020'};
  temp.ab = C2K(29.88); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Average incubation period is frmom 59-67 days; pivotal temperature is averaged at 29.88C.';
data.ap = 19.25*365; units.ap = 'd'; label.ap = 'age at puberty'; bibkey.ap = {'ESA2020'};
  temp.ap = C2K(21.13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Mean maturation for NWA leatherbacks in 19.25 years, and mean water temp is averaged between high lat (15-17C) and low lat (25-27.5C) water temperature mean values.';
data.am = (19.25+11)*365; units.am = 'd'; label.am = 'life span'; bibkey.am = {'ESA2020'};
  temp.am = C2K(21.13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Mean longevity aftern maturation is 11 years in the NW Atlantic, 19.25+11*365 for d';

data.Lb = 6.18; units.Lb = 'cm'; label.Lb = 'length at birth, SCL'; bibkey.Lb = {'Wyne2023'};
  comment.Lb = 'Previous data averaged with Wyneken 2023 day of hatching measurements.';
data.Lp = 125.6; units.Lp = 'cm'; label.Lp = 'length at puberty, SCL'; bibkey.Lp = {'Aven2009'};
  comment.Lp = 'Mean maturation CCL for NWA is 129.2 cm converted to SCL using Avens 2009 methods (better regression than Jones et al., 2011 when tested on nesting female data).';
data.Li = 203; units.Li = 'cm'; label.Li = 'ultimate length, SCL'; bibkey.Li = {'Giro2021'};
  comment.Li = 'Max SCL values for both sexes measured on the Atlantic French coast (n = 300) and males (n = 92)';

data.Ww0 = 81.66; units.Ww0 = 'g'; label.Ww0 = 'initial wet weight'; bibkey.Ww0 = {'Hsu2020'};
  comment.Ww0 = 'Parismina, Costa Rica leatherback nesting data from 2018 (egg weight)';
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
      'but all data from Wall2008 averages to 0.95 for resting, active, laying, field, max, and calculated values'}; 

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
units.tL_cap   = {'d', 'cm'};  label.tL_cap = {'time since birth', 'straight carapace length, Jones captive'};  
temp.tL_cap    = C2K(24);  units.temp.tL_cap = 'K'; label.temp.tL_cap = 'temperature';
bibkey.tL_cap = 'Jone2009';
comment.tL_cap = 'data from Table 3.2, captive animals. ''This study''from Jones 2009, other data from corresponding refs)';

use = find(~isnan(tLW_cap(:,3)));
data.tW_cap = tLW_cap(use,[1,3]); % age, wet weight
units.tW_cap   = {'d', 'g'};  label.tW_cap = {'time since birth', 'wet weight, Jones captive'};  
temp.tW_cap    = C2K(24);  units.temp.tW_cap = 'K'; label.temp.tW_cap = 'temperature';
bibkey.tW_cap = 'Jone2009';
comment.tW_cap = 'data from Table 3.2, captive animals. ''This study''from Jones 2009, other data from corresponding refs)';

data.LW_cap = tLW_cap(use,[2,3]); % SCL, wet weight
units.LW_cap   = {'cm', 'g'};  label.LW_cap = {'straight carapace length', 'wet weight, Jones captive'};  
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
units.tL_skel   = {'d', 'cm'};  label.tL_skel = {'time since birth', 'straight carapace length'};  
temp.tL_skel    = C2K(24);  units.temp.tL_skel = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL_skel = 'Jone2009'; comment.tL_skel = 'triangles in Fig 3.2, probably wild, Zug and Parham 1996 cited in Jone2009';


% Wyneken 2023 data
tLW_Wyn = [ ... (time since birth (d) SCL (cm) weight (g)
0	6.12	44.2
0	5.87	44
0	6.03	43.8
0	5.85	44.2
0	6.05	44.2
0	6.00	45
0	5.76	46.2
0	5.59	46.2
0	5.95	38.8
0	5.91	41
0	6.08	46.6
0	6.16	47.2
0	6.11	46
0	6.12	47.2
0	6.19	48.2
0	6.16	45
0	6.10	46
0	6.26	46
0	5.94	44.8
0	5.94	44.8
0	6.12	43.8
0	6.10	46.4
0	6.11	46
0	5.88	43.8
0	6.05	47.2
0	6.12	47.4
0	6.33	49.4
0	6.30	48.2
0	6.11	48.4
0	6.09	48.2
0	6.35	48.8
0	5.91	41.2
0	5.88	40.2
0	5.88	42.8
0	5.78	40.6
0	6.15	47
0	6.11	49
0	6.18	45.2
4	6.86	51.2
4	6.37	50.6
4	6.50	51
4	6.49	48.8
4	6.63	50.8
5	6.69	54
5	6.78	54.6
5	6.71	55.2
6	6.42	49.8
6	6.56	52.5
6	6.40	49.9
6	6.80	57.6
6	6.65	56
6	6.65	54
7	6.26	47.8
8	7.03	62
8	7.03	59.4
8	7.03	58.2
8	6.72	56.2
8	7.05	57.8
8	7.33	66.6
8	6.96	64.4
8	6.94	61.8
8	7.10	67
8	7.20	62.8
8	6.77	55.8
8	6.66	53.8
8	6.51	54
8	6.43	49.2
9	6.81	58.8
9	6.60	54.6
9	6.56	55.4
9	7.12	63
9	6.72	61.8
9	6.85	59.8
9	6.75	60.2
9	6.88	62.8
9	6.91	60.6
11	7.33	59.8
11	6.95	57.8
11	6.85	58.2
11	7.06	62.6
11	6.99	63.2
12	7.21	69.4
12	7.44	71
12	7.30	71.2
12	7.32	68.4
12	7.26	69.6
12	7.04	67.2
13	6.87	61.4
13	7.24	65.8
13	7.15	64
14	6.78	61
15	7.32	65.8
15	7.19	64.8
15	7.10	63.8
15	7.49	77.4
15	7.49	73.2
15	7.52	72.6
15	7.33	69.6
15	7.37	72.8
15	8.15	90.8
15	7.60	81
15	7.68	81.6
15	7.60	79
15	7.80	82
16	7.27	74.4
16	7.28	70.2
16	7.38	75.6
16	7.30	75.4
16	7.33	69.6
16	7.07	63
16	7.24	63
16	7.00	66.2
16	6.75	58.2
17	7.56	77.4
19	7.63	71.8
19	7.45	73.2
19	7.49	69.4
19	7.51	72.8
19	7.63	77
19	7.76	81.2
19	7.96	84.4
19	7.74	82.6
19	7.51	79.6
20	7.30	74
21	7.20	68.4
21	7.82	79.9
21	7.46	77.2
22	7.72	77.2
22	7.50	75.6
22	7.48	75.4
22	8.12	92.6
22	7.84	87
22	7.89	85.8
22	7.74	83.8
22	7.90	86
22	8.68	112.2
22	8.12	101
22	8.22	103.4
22	8.06	100.8
22	8.20	98.8
22	7.47	75.4
22	7.52	75.2
22	7.42	78.6
22	7.14	70
23	7.75	86
23	7.60	83
23	7.90	87.6
23	7.64	86.4
23	7.80	83
25	8.03	88.2
26	8.19	87.4
26	7.87	88.6
26	7.87	85
26	7.92	85.2
26	8.18	92.2
26	7.97	92.8
26	8.30	96.6
26	8.14	97
26	7.94	96
27	7.54	86.8
28	7.57	78.2
29	8.15	92.4
29	7.97	88.8
29	7.79	86
29	8.42	109.4
29	8.45	107.4
29	8.45	101.2
29	8.24	98.6
29	8.38	98.8
29	8.22	91.8
29	7.85	87.6
29	9.04	122.8
29	8.60	111.4
29	8.73	114
29	8.54	116
29	8.84	116.8
30	8.07	100
30	7.94	91.6
30	8.22	98.6
30	8.07	95.8
30	8.03	93.2
32	8.48	93.8
32	8.18	97
32	8.03	93
32	8.18	94.2
32	8.70	107.2
32	8.37	99.6
33	8.36	111
33	8.62	106.6
33	8.35	111
33	8.25	103
34	7.92	103.4
34	8.82	123.4
34	9.43	138.6
34	8.88	123.4
34	9.15	127.8
34	8.82	123.4
34	9.12	125.4
35	8.10	87
35	8.72	108.4
35	8.70	107.9
35	8.72	108.7
36	8.32	107.8
36	8.34	101.8
36	8.05	96.6
36	8.63	107.4
36	8.22	97.8
37	8.38	107.8
37	8.36	104.8
37	8.68	113
37	8.40	113.6
37	8.38	106
39	8.72	108.8
39	8.68	112
39	8.51	102.2
39	8.67	102.2
39	8.95	119.2
39	8.70	108.2
40	8.76	122.8
40	8.96	118.6
40	8.63	119.4
40	8.49	112.6
41	8.12	115.4
42	8.38	98.8
42	8.96	112.6
42	9.06	122.6
42	9.06	117.8
43	8.70	109.4
43	8.69	111.6
43	8.53	102.6
43	8.90	120.8
43	8.61	109.2
44	8.69	115.4
44	8.66	113
44	8.72	105.8
44	8.60	119.2
44	8.70	114.2
46	9.27	116.8
46	9.04	121.8
46	8.69	108.2
46	9.03	115.8
46	9.36	129.6
46	8.90	115.8
47	8.76	123
47	8.99	122
47	8.63	123.8
47	8.93	118.8
48	8.43	121.6
50	8.55	108
50	9.46	124.2
50	9.22	132.4
50	9.35	131
50	8.72	114.2
50	8.33	106.6
50	8.80	120.6
50	8.61	111
50	8.83	117.2
52	8.90	127
52	9.11	131
52	8.74	127.8
52	9.21	117.2
53	9.15	125
54	8.74	112.9
56	9.28	129.2
56	8.82	117.2
57	8.65	103.8
58	9.10	130
58	8.80	116.4
58	9.00	118.6
61	9.44	137.4
64	8.75	107.8];
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

%%% NINA %%% 
% Wyneken 2009 data
tLW_Wyn09 = [ ... (time since birth (d) SCL (cm) weight (g)
0	5.95	40.71 
0	5.685	45.39 
0	6.03	46.09 
0	5.98	44.08 
0	6.56	47.67 
0	5.98	44.08 
0	6.55	46.06 
0	6.15	49.08 
8	6.69	53.46 
8	6.79	50.90 
8	6.59	50.23 
8	6.66	54.49 
8	6.75	49.11 
8	6.97	56.76 
10	6.33	47.58 
10	7.12	68.15 
16	7.18	64.36 
16	7.49	62.35 
16	7.14	60.00 
16	7.39	66.84 
16	7.21	64.36 
16	7.62	66.98 
17	7.04	61.83 
17	7.56	81.50 
23	7.45	78.79 
23	7.64	78.14 
23	7.48	78.26 
23	7.84	84.50 
23	7.45	79.16 
23	7.59	83.13 
24	7.4	    67.13 
24	7.82	93.33 
30	8.03	92.35 
30	8.11	87.32 
30	8.03	89.38 
30	8.01	93.24 
30	8.03	90.88 
30	8.4	    99.10 
31	8.19	100.39 
32	7.59	78.47 
37	8.28	98.45 
37	8.48	98.78 
37	8.16	94.28 
37	8.32	101.84 
37	8.24	101.62 
37	8.65	107.43 
39	7.81	90.18 
44	8.27	99.34 
44	8.76	111.66 
44	8.29	94.12 
44	8.56	105.28 
44	8.22	104.24 
44	8.85	111.38 
46	8.17	101.12 
51	8.47	99.23 
51	8.71	110.23 
51	8.41	93.20 
51	8.99	114.32 
53	8.77	107.06 
58	9.28	129.06 
58	8.9	    110.97 
60	8.7	    109.34 ];
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

%%% NINA %%%
% Wyneken 2013 data
tLW_Wyn13 = [ ... (time since birth (d) SCL (cm) weight (g)
0	5.55	44.30 
0	5.87	46.50 
0	5.63	43.20 
0	5.61	42.90 
0	5.82	43.50 
0	6.31	45.20 
0	6.28	45.70 
0	6.06	45.80 
0	6.16	46.20 
0	5.96	48.70 
0	5.98	49.10 
0	6.05	50.40 
6	6.12	45.00 
6	6.4	    50.30 
6	6.22	45.80 
6	6.03	46.10 
6	6.21	44.50 
7	6.89	53.50 
7	6.71	54.00 
7	6.62	53.10 
7	6.8	    57.50 
7	6.36	50.40 
7	6.28	48.30 
7	6.59	50.10 
13	6.58	59.30 
13	6.81	62.30 
13	6.65	56.20 
13	6.64	59.50 
13	6.64	57.80 
14	7.39	68.70 
14	7.27	72.10 
14	7.17	67.40 
14	7.51	76.60 
14	6.71	60.00 
14	6.56	57.90 
14	6.83	62.00 
20	7.21	71.10 
20	7.16	71.80 
20	7.06	67.30 
20	7.06	73.50 
20	7.08	69.40 
21	7.79	85.00 
21	7.53	89.60 
21	7.58	82.70 
21	7.79	93.20 
21	7.32	73.70 
21	7.53	79.10 
21	7.21	74.50 
27	7.48	88.30 
27	7.69	88.70 
27	7.51	82.20 
27	7.67	91.00 
27	7.41	80.80 
28	8.63	109.40 
28	8.22	104.80 
28	8.29	102.00 
28	8.73	119.10 
28	7.7	    89.20 
28	7.8	    90.00 
28	7.69	87.10 
34	8.12	108.20 
34	8.32	108.10 
34	8.09	99.00 
34	8.2	    111.50 
34	8.11	97.70 
35	9.01	125.90 
35	8.43	121.60 
35	8.41	112.70 
35	9.01	139.20 
35	8.06	98.20 
35	8.1	    103.10 
35	7.91	94.30 
41	8.62	127.80 
41	8.49	119.60 
41	8.51	117.30 
41	8.58	122.50 
41	8.38	109.60 
42	9.15	144.80 
42	8.64	139.10 
42	8.76	134.00 
42	9.37	156.00 
42	8.26	105.90 
42	8.32	108.90 
42	8.2	    107.20 
48	8.64	136.00 
48	8.65	133.20 
48	8.65	126.40 
48	8.66	140.30 
48	8.42	119.10 
49	9.32	147.20 
49	8.81	142.60 
49	8.81	128.10 
49	9.23	141.90 
50	8.62	108.70 
50	8.6	    109.30 
50	8.53	106.50 
55	9.14	149.80 
55	9.05	142.60 
55	8.68	127.30 
55	8.81	142.30 
55	8.25	134.70 
57	10.04	171.70 
57	9.5	    161.40 
57	8.67	118.70 
57	8.81	134.10 
57	8.71	120.80 
63	9.48	150.60 
63	9.12	142.80 
63	9.26	148.90 
63	9.58	168.10 
63	9.03	132.70 
64	9.93	178.50 
64	9.47	173.30 
64	8.61	126.10 
64	9.1	    139.50 
64	8.81	120.50 
70	9.28	179.60 
70	9.31	156.10 
70	9.25	167.90 
70	9.27	179.30 
70	9.19	153.30 
70	8.77	124.40 
70	9.17	141.60 
71	10.03	193.00 
71	9.6	    190.40 
77	9.78	179.60 
77	9.51	177.40 
77	9.83	193.40 
77	9.45	168.80 
77	9.99	161.40 
77	10	    196.10 
77	9.28	148.90 
83	9.03	179.20 
83	9.8	    198.30 
83	9.76	177.70 
84	10.26	218.50 
84	9.97	163.30 
90	9.81	187.80 
90	10.17	218.10 
90	9.9	    190.10 
91	11.26	242.30 
94	10.29	186.90 
97	10.62	210.30 
97	10.61	228.10 
97	10.5	213.50 
98	11.65	201.90 
101	11.6	256.60 
105	11.81	280.70 
105	11.34	222.50 
107	11.1	224.80 
107	11.19	258.10 
107	10.92	233.60 
111	11.2	247.80 
111	11.63	267.50 
111	11.1	237.60 
112	12.51	302.20 
112	11.28	226.60 
118	11.98	264.00 
118	12.06	286.20 
118	12	    255.30 
119	12.39	305.00 
119	11.48	251.60 
125	11.86	281.70 
125	12.24	313.00 
125	11.84	262.40 
129	12.14	277.50 
132	12.61	316.10 
133	12.56	305.50 ];
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
0	6.3	46.4
0	6.28	45.1
0	6.02	43.8
0	6.19	44.8
0	5.95	47.8
0	6.24	46.2
0	6.11	46.1
0	6.12	47.5
0	6.38	45.3
0	6.09	43.2
0	6.07	43.8
0	6.26	45.4
0	5.95	41.8
0	5.94	47.5
0	5.9	    46.2
0	5.9	    47.3
0	5.75	44.9
0	6	    44.2
0	5.92	45.9
0	6.04	48.6
0	6.15	48
0	5.83	47.3
0	6	    47.9
0	5.86	48.5
0	5.57	42.2
0	5.56	46.3
0	5.66	43.1
0	5.75	42.8
0	5.74	45
0	5.82	44.8
0	5.63	44.2
0	5.67	43.4
0	6	    46.4
0	6.31	46
4	6.24	34.6
4	6	    37.3
4	6.07	32.6
5	5.47	55
5	6.54	40.3
5	6.06	46.7
5	6.22	42.1
5	6.58	61.3
5	6.13	47.2
5	5.97	45
7	7.07	61.7
7	7.2	    63.2
7	6.85	59.3
7	7.16	62.9
8	6.67	60.7
8	6.33	47.3
8	6.82	42.4
9	6.82	59.1
9	6.9	    58.5
9	6.96	60.2
9	6.9	    61
9	7.09	60.2
9	6.62	54.5
9	6.61	55.3
9	6.66	53.3
9	6.71	56.4
10	6.64	51.4
10	6.33	49.9
10	6.43	53.3
10	6.3	    52.5
10	6.36	58.6
10	6.39	56.1
10	6.41	56
10	6.54	56.7
11	6.49	57.9
11	6.33	53.2
11	6.54	57.8
12	7.32	70.1
12	7.5	    71.7
12	7.14	69
12	7.33	70.7
12	6.77	59.7
12	7.04	60.1
12	6.96	60.4
12	6.6	    58.3
12	6.92	60.4
12	6.6	    58.5
12	6.75	56.4
15	7.28	67.9
15	6.85	67
15	7.25	65.8
16	7.26	77.3
16	7.3	    76
16	7.32	78.6
16	7.3	    76
16	7.53	75.6
16	7.12	55
16	7.02	54
16	7.01	60.3
16	7	    60.2
17	7.01	70.2
17	6.73	61.5
17	6.92	68.4
17	6.71	62.1
17	6.92	71.6
17	6.91	69.8
17	7.09	69.3
17	6.58	65.4
18	7.03	71
18	6.75	63.6
18	6.91	69.2
19	7.86	83
19	8.08	86
19	7.67	82.3
19	7.98	89.3
19	7.22	73.7
19	7.48	76.1
19	7.36	72.9
19	7.05	72.2
19	7.34	75.6
19	6.91	65.7
19	7.02	63.1
22	7.66	84.7
22	7.37	76.8
22	7.62	76.2
23	7.78	96.4
23	7.9	    80.6
23	7.75	97.4
23	7.85	86.8
23	8.05	87.1
23	7.49	76.1
23	7.46	78.4
23	7.21	72.5
23	7.51	78.9
24	7.56	80.6
24	7.21	72.5
24	7.35	74.9
24	7.13	71.5
24	7.28	80.4
24	7.35	77.7
25	7.65	87.9
25	7.23	71.4
25	7.38	83.6
26	8.24	98.8
26	8.33	97.9
26	8.46	98.9
26	8.74	95.2
26	7.72	86.4
26	7.96	85.1
26	7.96	83.6
26	7.55	85.6
26	7.85	84.8
26	7.69	82.9
26	7.35	78.6
28	7.46	78
28	7.6	    76.9
29	8.27	101.7
29	7.82	93.6
29	8.14	93.3
30	8.23	99.4
30	8.34	101.9
30	8.29	101.7
30	8.13	97.2
30	8.46	96.1
30	7.92	93.1
30	7.83	94.2
30	7.65	85.9
30	7.85	92.4
31	8.15	92.5
31	7.7	    89.1
32	7.79	94.8
32	7.49	75.8
32	7.61	89.2
33	8.46	99.5
33	8.76	105.1
33	8.42	99.1
33	8.77	109.9
33	7.88	91.5
33	8.93	95.7
33	8.1	    90.4
33	7.65	92.2
33	8.08	93.6
33	7.65	84
33	7.65	80.9
33	7.9	    94.9
33	8.05	90.7
36	8.29	96.5
36	7.97	96.3
36	8.31	96.2
37	8.36	114.1
37	8.59	120.5
37	8.53	116.7
37	8.24	111.5
37	8.76	107.7
37	8.51	108.5
37	8.51	106.8
37	8.19	97.4
37	8.5	    105.3
38	8.14	97.7
38	7.87	95.7
38	7.86	96.4
38	8.06	96.1
40	8.65	107.2
40	9.05	116.7
40	8.5	    113
40	8.95	121
40	7.66	93.9
40	8.03	92.7
41	8.39	106
41	7.84	87
41	8.12	101.4
42	8.2	    101.6
42	8.65	101.4
42	8.69	107.8
42	8.18	106.1
42	8.31	106.3
44	8.44	122.3
44	8.73	121.8
44	8.74	121.3
44	8.63	117.7
44	9.16	118.5
44	8.47	110.9
44	8.35	108.7
44	8.22	97.5
44	8.44	106.9
45	8.69	113.3
45	8.49	107.8
45	8.92	107.2
45	8.13	104.8
45	7.85	90.9
45	8.03	111.4
45	8.13	107.4
47	8.89	109.6
47	9.11	123.1
47	8.95	116.3
47	9.25	123.2
47	8.69	106
47	8.55	107.6
47	7.79	102.3
47	8.07	100.8
49	7.91	99.1
49	8.14	99.5
51	9.05	138.5
51	9.56	145.4
51	9.26	141.3
51	9.31	138.9
51	9.74	141.6
53	8.78	128.5
53	8.54	120
53	8.28	115.6
53	8.75	122.7
53	8.28	118.1
53	8.23	98
53	8.03	107.1
54	9.43	129.7
54	9.6	    137.6
54	8.64	108.5
54	8.74	103.8
54	8.5	    116.8
54	8.26	115.6
54	8.56	113.3
54	8.16	102.9
54	7.94	93.7
54	8.14	117
54	8.11	107.6
54	7.58	102.3
54	7.9	    101.7
56	8.04	102.7
56	8.65	98.6
57	8.77	118
57	9.06	116.9
59	8.64	125.2
59	8.36	126.1
60	9.56	154.9
60	10.12	162.2
60	9.6	    153.9
60	10.3	150.3
61	8.64	114.5
61	8.1	    96.8
61	8.82	128.3
61	8.53	117.7
61	7.8	    112.2
61	8.33	111.9
62	8.71	129.9
62	8.39	102.5
62	8.52	115.4
63	9.8	    139.7
63	9.65	137
63	8.71	118.8
63	8.77	111.4
63	8.93	124
63	8.53	125.5
63	8.08	110.2
65	9.1	    145.5
65	9.14	138.9
65	9.34	133.5
65	8.74	129.5
66	8.76	120.8
66	9.24	119.1
68	9.42	137.3
68	9.09	135
68	8.62	119.8
68	8.2	    102.9
68	8.67	137
68	8.46	125.3
68	8.05	115.5
68	8.33	117
69	9.003	142.3
69	8.54	110.8
70	8.47	128.5
70	8.87	126.1
70	9.18	127.7
70	8.53	120.8
72	9.87	175.9
72	10.33	183.4
72	10	    175
73	8.98	130.8
74	9.38	148.3
74	9.02	142.8
74	9.15	142
74	9.15	133.4
75	10.15	154.5
75	9.26	137.3
75	9.05	136.6
75	8.52	128.5
75	8.25	109.9
75	8.67	128.1
76	9.15	149.8
76	8.71	118.9
77	9.01	137.9
77	9.01	131.9
77	8.85	132.4
77	8.96	126.6
80	9.09	142.1
81	10	    186.8
81	10.7	190.1
81	10.27	188.1
81	9.5	    147.4
81	9.62	146.5
81	9.6	    148.8
81	8.8	    139.1
82	9.24	152.4
82	9.01	140.9
82	9.06	137.9
82	8.69	109.2
82	8.02	128.8
83	9.6	    156
83	8.91	130.6
84	9.2	    138.3
84	8.83	137.9
84	9.02	132.2
84	9.07	132.6
87	9.02	146.6
88	10.08	192
88	10.78	202.3
88	10.34	197.3
88	9.81	157.2
88	9.15	147.5
88	9.23	153
88	9.15	142
89	9.71	158.6
89	9.18	133.4
89	9.59	148.6
89	9.05	126.6
90	9.86	168.5
90	9.3	    131.6
90	9.17	141
91	10.67	168.3
91	9.81	150
91	9.39	149.6
91	9.31	137.7
94	9.46	157
95	10.21	201.7
95	10.11	198.4
95	9.43	162.9
95	9.1	    144.9
95	8.98	142.6
95	9.86	156.9
95	9.43	157.1
96	10	    158.2
97	10.35	183.1
97	9.55	147
98	10.68	165.3
98	9.25	150.2
98	9.85	157.5
98	9.74	157.1
98	9.33	148.6
101	9.75	169.9
102	9.68	175
102	10.14	217.2
102	10	    169.1
102	8.05	146.7
102	9.52	149.9
102	9.08	162.8
103	9.84	146.1
103	10.16	188.7
103	9.61	150.7
103	10.32	167.7
104	9.28	146.9
104	9.1	    142.2
105	10.4	170
105	9.33	149.2
107	10.06	172.8
109	11.19	225.6
109	9.94	178
109	9.59	156.8
109	9.29	155
109	10.06	163.4
110	10.1	175.2
111	10.2	190.9
111	9.94	155.1
112	9.49	162
115	9.53	161.9
115	9.2	    162.9
115	10.06	171.4
115	10.35	177.3
116	11.73	221.4
117	10.56	192.3
118	10.26	210.5
118	9.84	165.3
118	9.99	167.6
122	10.98	237.2
122	10.38	180.7
123	10.99	205.9
125	10.9	226.1
125	9.57	162.5
130	11.4	241.7
130	11.18	224.9
131	11.49	243.3
131	10.11	162.4
136	11.21	224.4
136	11.75	237.2
138	11.16	253.3
138	10.15	177
144	11.38	271.4
144	9.96	171];
data.tL_Wyne14 = tLW_Wyn14(:,1:2);
units.tL_Wyne14   = {'d', 'cm'};  label.tL_Wyne14 = {'time since birth', 'straight carapace length'};  
temp.tL_Wyne14    = C2K(24);  units.temp.tL_Wyne14 = 'K'; label.temp.tL2tL_Wyne14 = 'temperature';
bibkey.tL_Wyne14 = 'Wyne2023';
comment.tL_Wyne14 = 'captive animals fed Jeanette Wyeneken diet';
%
data.tW_Wyne14 = tLW_Wyn14(:,[1 3]); 
units.tW_Wyne14   = {'d', 'g'};  label.tW_Wyne14 = {'time since birth', 'wet weight'};  
temp.tW_Wyne14  = C2K(24);  units.temp.tW_Wyne14 = 'K'; label.temp.tW_Wyne14 = 'temperature';
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
weights.pAm = 5 * weights.pAm;
weights.Ww0 = 0 * weights.Ww0;
weights.pAm = 0 * weights.pAm;
weights.tJO_e = 5 * weights.tJO_e;

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
set5 = {'tW_Wyne','tW_Wyne09', 'tL_Wyne13', 'tL_Wyne14'}; comment5 = {'four diet data: Weight, Wyneken 2023'};
set6 = {'LW_Wyne','LW_Wyne09', 'tL_Wyne13', 'tL_Wyne14'}; comment6 = {'four diet data: LW, Wyneken 2023'};
metaData.grp.sets = {set4, set5, set6};
metaData.grp.comment = {comment4, comment5, comment6};


%% Discussion points
D1 = 'Jone2009: 1.3e11 g jellyfish converts to 2.6e13 J, so jellyfish have 200 J/g';
D2 = 'mod_1: data on ingestion/metam revised, tJO_e, Ww0, Wdb data added';
D3 = 'mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate';
D4 = 'mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight';
D5 = ['mod_1: We use data from Jones 2009 (Tables 3.1, 3.2 and 3.3, combined with data from Zug et al  (1986) presented in figure 3.2) for parameter estimation.', ...
    'Data from Table 3.1 used partially (where N>3), and tL1 data in the original entry had mixed captive and wild turtles- now revised'];
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

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
bibkey = 'Jone2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Jones, T. T.}, ' ... 
'year = {2009}, ' ...
'title = {Energetics of the leatherback turtle, \emph{Dermochelys coriacea}}, ' ...
'howpublished = {\url{https://circle.ubc.ca/handle/2429/7454?show=full}}, ' ...
'school = {Univ Britisch columbia (Vancouver)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dermochelys_coriacea}}';
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
bibkey = 'Aven2009'; type = 'article'; bib = [ ...
'author = {Avens, L., Taylor, J. C., Goshe, L. R., Jones, T. T., & Hastings, M. }, ' ... 
'title = {Use of skeletochronological analysis to estimate the age of leatherback sea turtles \textit{Dermochelys coriacea} in the western North Atlantic. }, ' ... 
'journal = {Endangered Species Research}, ' ... 
'year = {2009}, ' ... 
'volume = {8(3)}, ' ... 
'pages = {165-177}'];
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
bibkey = 'Thom1993'; type = 'article'; bib = [ ...
'author = {Thompson, Michael B.}, ' ... 
'title = {Oxygen consumption and energetics of development in eggs of the leatherback turtle, \textit{Dermochelys coriacea}.}, ' ... 
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ... 
'year = {1993}, ' ... 
'volume = { 104, no. 3}, ' ... 
'pages = {449-453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
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
