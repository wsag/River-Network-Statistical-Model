# River-Network-Statistical-Model
Model code for Wollheim, W. M., Harms, T. K., Robison, A. L., Koenig, L. E., Helton, A. M., Song, C., Bowden, W.B., Finlay, J.C.  (2022). Superlinear scaling of riverine biogeochemical function with watershed size. Nature Communications, In Press. https://doi.org/10.21203/RS.3.RS-137235/V1

For questions, please contact Wil Wollheim (wil.wollheim@unh.edu)

This model was also used for Wollheim et al. 2006 and 2018 (see references list).

The river network model is written in Excel and includes two worksheets.  See methods section in Wollheim et al. 2022 for description of the equations, variables and parameters.  The spreadsheet is set up for a river network of a set basin size and river network geomorphology.  Each network type requires its own spreadsheet.  Note that if your drainage area changes and you have a different number of river orders, you will need to modify the spreadsheet, so this is only a demonstration model.   

 The sheet “NetworkGeomoprhology” is where the river network attributes are calculated based on the Geomorphic Unit Hydrograph approach (Rodriquez-Iturbe and Rinaldo 1997).  The key calculations are the probabilities of transfer from one order to the next used in the Main worksheet to route fluxes downstream statistically.  

The worksheet “Main” includes all the model parameters, and the calculation of fluxes for each river order. It is organized in four sections:  1. Inputs and Results, 2: Model Calculations, 3: Derive Allometric Scaling Parameters, and 4) Transition Probabilities. 

Section 1 of the spreadsheet includes the model parameters, as well as the results of the model run for a given set of parameters (other than the allometric scaling results).  Do not change the parameters Rl, Ra, Rb, A1 or L1 as these are constants that define the type of river network for that sheet (e.g. rectangular, drainage area = 6321 km2).  These cells are highlighted in red.  If you want to apply to a different set of network attributes, or different drainage area, you will need to carefully adjust the tables in NetworkGeomorphology and potentially in the main model itself because the matrices will be of different size (this was not generalized). 

The variables that can be changed in each spreadsheet are highlighted in yellow and can be altered to explore scenarios of flow, reaction rate, and hydraulics.  These variables are referred to in other locations as well before being entered into the actual model calculations (legacy). 

Section 2 contains the model itself.  The core calculations where fluxes and process rates are calculated are in rows 66-75.  The required characteristics of each river order are calculated, one order per row.  Downstream fluxes are calculated based on the probability of one order entering into a higher order based on the table in Section 4.  The model includes both a representation of zero-order processes (GPP and ER based on Finlay 2011) and first order processes (vf, abbreviated as “B:process constant”).  The two types of processes can be varied independently (they do not depend on each other).  


Section 3 contains the results from the model that are needed to estimate the allometric scaling slope over entire river networks.  

Section 4 contains the table of transition probabilities based on the river network attributes (calculated in the sheet Network Geomorphology). 

MATLAB code is included as wrapper to allow running of many scenarios for a given network automatically.  The code is included as both *.m and *.txt.  An example output that results from running the MATLAB code is also included. 
