Updates 2025/04/28
* new parameter set in folder new_AmP_fits
* fixed current temperature in EVHR_Dermochelys updated

Updates 2025/03/25
* heatmap as used in the loggerhead paper (function 'imagesc') _has reporting issues_, because it reports the results slightly skewed. As a result of that, it would appear from the plots that the turtles reproduce at lower food levels than simulations show. Not sure why this works in such a way, but safer to use a different function for plotting: 'surf' instead of 'imagesc'.
* Nina had discussions with Mike in Feb, and neither of us like v having such a high value (0.15), so Anna and Nina decided to go ahead with the writing etc, but try to get a lower value of v (i.e., a different parameter set) at one point

Updates 2024/10/09
* EVHR_updated is uploaded , food and temp simulations work
* Next steps: check heatmap generation; check non-constant input to EVHR_fT

Updates 2024/09/26
* Nina re-estimated all parameters to be closer to those of related species (comments marked as discussion points in the mydata file, marked with mod_2. Li, Lp updated with new refs (provided by Anna). The main difference to the previous pars set is f=0.9, and a higher kappa, which should hopefully enable meaningful food simulations.
* EVHR_updated folder is in prep, so EVHR_forAnna will soon be obsolete

Updates 2024/09/10
* Anna has uploaded EVHR subfolder with scripts changed for leatherback parameters
* Plots technically generate, but erroneously with wrong or empty plots.
* Next steps: talk through changes with Nina, identify the issues and finalise the leatherback parameters for the scripts.

Updates 2024/07/29
* Uploaded EVHR folder with simulations for a range of (constant) f and T 
- TO DO: parameters need to be updated to load the leatherback parameters automatically
- next steps: (1) plot the whole grid (for heat map); (2) take variable temp and food as inputs

Updates 2024/07/04
* Wyneken growth data from 2009, 2013, and 2014 added. Code is running, but f values for new data have not been adjusted yet.
* 2009: Water tempterature 21-22C, ahi tuna instead of mahi mahi tuna
* 2013: Water tempterature 20-24C, same as 2014 but infant formula is dairy-based
* 2014: Water tempterature 20-23C, same as 2013 but infant formula is soy-based
* Group plot added for all Jeanette's data (2009, 2013, 2014, 2020, 2021, 2022).
* Something weird is going on with 2013 and 2014 weight.  --> wrong data packing at plotting; fixed 2024/07/08

Updates 2024/04/30
* function for del_M implemented, but not sure how much it brings: the captive and wild data still have a problem with matching predicted growth in length and weight simultaneously
* Wyneken data look OK -- if f reduced towards end of data, might be a nice fit; more data on different feeding levels might become available (change f later if this happens)
* Removed data from Table 3.1 if fewer than 3 individuals --> tL_Jone, tW_Jone, LW_Jone (see also excel file for notes and figs)
* Incorporated data from Table 3.2 (captive tLW data) -- this includes individual data from Table 3.1 (last recorded measurement per turtle of Table 3.1 is given in Table 3.2), plus some published values from captive rearing. --> tL_cap, tW_cap, LW_cap 
* Incorporated data from Table 3.3 (wild LW data) --> LW_wild
* previously tL1 data is now : tL_cap + tL_skel (the latter are triangles in Fig 3.2)
* organized some group plots

TO DO: think why there is a mis-match in the growth pattern. How can the growth in length be UNDERestimated (at least for tL_Jone data--> now less obvious), and the growth in weight OVERestimated


Updates 2024/01/25
* del_M is more or less the same for all datasets --> TO DO (Nina): implement a function to change the value gradually from hatchling to say, puberty (or earlier) stage
* added LW datasets for Wyneken and Jones data --> TO DO: we need to check why and how these curves are so off (in different ways) and if del_M changes anything.
* f is now the same for datasets belonging to the same study (eg Jones, Wyneken) --> TO DO: improve fits
  
