Simulations for D.coriacea
code by Nina Marn, work by Anna Ortega

Two type of simulations
-------Type 1-----
Constant food and temp (range), mark endpoints, plot multicolor plots

Update (02-Dec-2024) imagesc plots do something with rendering, so that they distribute values across the plotted range of fs and Ts (and consequently the values of endpoints do not necessarily correspond to the intersection of corresponding f and T which was used to obtain that endpoint).

Surface plots are more accurate (and potentially more fancy). We also have an option of classical 2D graphs with mean/median and SD shaded. 

Scripts for rainbow plots (grids) and classical plots now work. 

We could work with total of 22 points (11+11) to get a finer mesh


* Non-constant environment still not coded, but perhaps irrelevant for this paper (and can be used for STAMM instead)


-------Type 2-----
(later) Plot curves or endpoints with inputs from STAMM