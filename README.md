<<<<<<< HEAD
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
  
>>>>>>> e7fe51a214cd6d8c2e458840456aa46feb787a90
