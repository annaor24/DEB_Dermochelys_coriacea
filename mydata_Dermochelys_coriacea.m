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

metaData.T_typical  = C2K(26.4); % K, body temp 
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

data.Lb = 6.18; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = {'Wyne2023'};
  comment.Lb = 'Previous data averaged with Wyneken 2023 day of hatching measurements.';
data.Lp = 125.6; units.Lp = 'cm'; label.Lp = 'length at puberty'; bibkey.Lp = {'Aven2009'};
  comment.Lp = 'Mean maturation CCL for NWA is 129.2 cm converted to SCL using Avens 2009 methods (better regression than Jones et al., 2011 when tested on nesting female data).';
data.Li = 203; units.Li = 'cm'; label.Li = 'ultimate length'; bibkey.Li = {'Giro2021'};
  comment.Li = 'Max SCL values for both sexes measured on the Atlantic French coast (n = 300) and males (n = 92)';

data.Ww0 = 81.66; units.Ww0 = 'g'; label.Ww0 = 'initial wet weight'; bibkey.Ww0 = {'Hsu2020'};
  comment.Ww0 = 'Parismina, Costa Rica leatherback nesting data from 2018 (egg weight)';
data.Wwb = 46.22; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'Hsu2020'};
  comment.Wwb = 'Average between 47.10 g (Hsu2020, n = 17) and 45.34 g (Wyne2023, n = 38)';
data.Wdb = 9.776; units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = {'Thom1993'};
  comment.Wdb = 'No new NWA data (there is EP data but not relevant to this task)';
data.Wwi = 683333; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'Wood1982'};
  comment.Wwi = 'Guiness book of animal facts and feats - Gerald L Wood, 1982 cites Duron 1978 for a record of a capture male in a fishing ent at Longeville, Vendee Dept, W France that was 800 kg, with two other records off of West France at 650 and 600 kg. All averaged for this value.';

data.Ri = 0.4147; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = {'ESA2020'};
  temp.Ri = C2K(21.13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on updated averages of clutch frequency (5), clutch size (81.74), and remigration interval (2.7) for the NW Atlantic stock.';

data.pAm  = 0.41;    units.pAm  = 'W/kg'; label.pAm  = 'mass-specific metabolic rate '; bibkey.pAm  = 'Jone2009';   
  temp.pAm = C2K(20);  units.temp.pAm = 'K'; label.temp.pAm = 'temperature';
  comment.pAm = 'about 350 kg; assume that production is small and metab rate corrspronds to assim rate. AO note: Average between trendline for mass-specific growth rate for 100, 200, 300, 400 kg individuals is .407, but all data from Wall2008 averages to 0.95 for resting, active, laying, field, max, and calculated values'; 

data.pXm  = 0.81;    units.pXm  = 'W/kg'; label.pXm  = 'maximum intake of jellyfish of fully grown individual'; bibkey.pXm  = 'Jone2009';   
  temp.pXm = C2K(20);  units.temp.pXm = 'K'; label.temp.pXm = 'temperature';
  comment.pXm = 'about 350 kg, 82 kg jelly fish/d for 250-450 kg turtle wit 200 J/g  = 82/350*200000/24/60/60 W/kg. AO note: Energy budget calculations between EP and NWA, but suggests that average required feeding rate for St. Croix (NWA) leatherbacks for a 2.85 remigration interval is 127 kg/d. Leatherback prey energy content is 310 kJ/kg wet mass from Davenport & Balazs 1991).';

% uni-variate data
% SCL = straight carapace length
tLW = [ ... (sime since birth (yr) SCL (cm) weight (kg)
0.003 6.31  0.046
0.01  6.53  0.05
0.03  7.22  0.06
0.05  7.81  0.08
0.07  8.31  0.10
0.08  8.91  0.12
0.10  9.59  0.15
0.12 10.28  0.18
0.14 10.76  0.21
0.16 11.33  0.24
0.18 12.10  0.28
0.20 12.77  0.32
0.22 13.20  0.37
0.24 13.64  0.41
0.26 14.35  0.45
0.28 14.92  0.51
0.30 15.49  0.56
0.32 16.04  0.62
0.33 16.49  0.68
0.35 17.50  0.82
0.37  18.23 0.91
0.39 18.88  1.01
0.41 19.41  1.10
0.43 20.10  1.21
0.45 20.55  1.28
0.47 21.19  1.39
0.49 22.04  1.51
0.51 22.61  1.68
0.53 23.68  1.87
0.55 24.40  2.03
0.56 25.14  2.28
0.58 25.82  2.40
0.60 26.27  2.63
0.62 27.57  2.81
0.64 28.10  3.03
0.66 28.61  3.20
0.68 29.31  3.47
0.70 30.21  3.77
0.72 30.92  4.15
0.74 31.74  4.30
0.76 32.29  4.51
0.78 32.89  4.85
0.79 33.36  5.10
0.83 34.30  5.49
0.85 35.21  5.92
0.87 35.36  6.15
0.89 36.21  6.61
0.91 36.81  6.75
0.93 38.26  7.55
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
1.31 50.30 15.44
1.33 52.00 17.26
1.35 53.10 17.99
1.37 53.90 18.68
1.39 52.60 17.28
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
tLW(:,1) = 365 * tLW(:,1); % convert yr to d
tLW(:,3) = 1e3 * tLW(:,3); % convert kg to g
data.tL = tLW(:,1:2);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'straight carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jone2009';
comment.tL = ['captive animals, fed with Pacific Ocean squid, Todarodes pacificus; '...
  '(mantle and tentacles only), vitamins (ReptaviteTM), and calcium (Rep-CalTM), '...
  'blended with unflavored gelatin in hot water.'];
%
data.tW = tLW(:,[1 3]); 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Jone2009';

% tL-data from Jone2009, collected from lit; temp 24 C?
data.tL1 = [ ... % SCL (cm), time since birth (yr)
0.061	5.869
0.062	4.338
0.091	13.525
0.092	12.504
0.093	6.890
0.154	14.545
0.156	7.400
0.218	8.421
0.249	13.270
0.279	21.180
0.279	18.373
0.281	10.973
0.312	9.952
0.373	21.180
0.500	14.545
0.529	24.753
0.563	13.270
0.564	10.463
0.594	14.801
0.625	16.587
0.652	40.064
0.654	28.836
0.685	34.450
0.782	21.691
0.810	35.215
0.967	38.788
1.217	46.699
1.279	48.740
1.341	55.885
1.721	43.126
1.904	69.410
3.694	84.976
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
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'straight carapace length'};  
temp.tL1    = C2K(24);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Jone2009';

% Wyneken 2023 data
tLW1 = [ ... (time since birth (d) SCL (cm) weight (g)
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
data.tL2 = tLW1(:,1:2);
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'straight carapace length'};  
temp.tL2    = C2K(24);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Wyne2023';
comment.tL2 = 'captive animals fed Jeanette Wyeneken diet';
%
data.tW1 = tLW1(:,[1 3]); 
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(24);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Wyne2023';

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

%% Discussion points
D1 = 'Jone2009: 1.3e11 g jellyfish converts to 2.6e13 J, so jellyfish have 200 J/g';
D2 = 'mod_1: data on ingestion/metam revised, tJO_e, Ww0, Wdb data added';
D3 = 'mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate';
D4 = 'mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

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
'title = {Use of skeletochronological analysis to estimate the age of leatherback sea turtles Dermochelys coriacea in the western North Atlantic. }, ' ... 
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
'title = {Endangered Species Act status review of the leatherback turtle (Dermochelys coriacea)}, ' ... 
'institution = {NMFS (National Marine Fisheries Service)}, ' ... 
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Fraz1991'; type = 'article'; bib = [ ...
'author = {Tucker, A. D., & Frazer, N. B.}, ' ... 
'title = {Reproductive variation in leatherback turtles, Dermochelys coriacea, at Culebra national wildlife refuge, Puerto Rico.}, ' ... 
'journal = {Herpetologica}, ' ... 
'year = {1991}, ' ...  
'pages = {115-124.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Giro2021'; type = 'article'; bib = [ ...
'author = {Girondot, Marc, Baptiste Mourrain, Damien Chevallier, and Matthew H. Godfrey.}, ' ... 
'title = {Maturity of a giant: age and size reaction norm for sexual maturity for Atlantic leatherback turtles}, ' ... 
'journal = {Marine Ecology}, ' ... 
'year = {2021}, ' ... 
'volume = {42(5)}, ' ... 
'pages = {e12631}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Hirt1987'; type = 'techreport'; bib = [ ...
'author = {Hirth, H. F. }, ' ... 
'title = { Some aspects of the ecology of the leatherback turtle Dermochelys coriacea at Laguna Jalova, Costa Rica}, ' ... 
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
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thom1993'; type = 'article'; bib = [ ...
'author = {Thompson, Michael B.}, ' ... 
'title = {Oxygen consumption and energetics of development in eggs of the leatherback turtle, Dermochelys coriacea.}, ' ... 
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
'note = {Wyneken lab experiements at Florida Atlantic University: CONFIDENTIAL, use permitted for this model through Upwell Turtles collaboration}, ' ... 
'year = {2023}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
