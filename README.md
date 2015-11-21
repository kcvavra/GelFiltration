Gel Filtration Chromatography R Project
===========

> This is an R project developed for our lab to calibrate the molecular weight of proteins (kDa)
> to elution volumes, or the time it takes for proteins to travel through a gel-based matrix, 
> of a gel filtration column.  More information about gel filtration chromatography (GFC) calibration can
> be located <a href="http://www.sigmaaldrich.com/catalog/product/sigma/mwgf70?lang=en&region=US">
> on the Sigma-Aldrich product page</a> for the product used in this calibration.

This script, located at *GFC.R*, does the following:
* Import the data processed by the script *data.R*
* Calculate the peak maxima for the calibration data
* Find a correlation between the molecular weight of to the observed maximum for each protein
* Plot and export an overlay of the chromatograms used to calibrated the column
* Plot and export a calibration curve to demonstrate the linearity of the calibration
* Print calibration curve values
* Calculate a peak maximum for "Protein 1" and apply peak maximum to calibration curve to 
determine molecular mass and print the molecular mass of protein 1.

## Raw data collection and data processing

The data used in this project was collected using a Superdex 75 30/100 GL column (GE Healthcare)
connected to a BioLogic DuoFlow FPLC running BioLogic DuoFlow software version 5.3 (BioRad).
Samples were dissolved into 20 mM Tris-HCl and 100 mM KCl, pH = 7.5 and passed through the column
at a flow rate of 0.5 mL/min.

The data were exported from the proprietary BioLogic software format to CSV using settings that export every
data point collected (5 pts/sec) for all parameters by the software.
This is too high of a data resolution for this experiment, since the volume needed for calibration and
molecular weight prediction is only 10 pts/mL or a resolution of 0.1 mL.
Only the variables Volume and UV [Absorbance] are needed to perform the calibration and calculation steps.
The extra variables are parameters that are useful for running experiments, but are not required by this calculation.

An R script is used to process the following data files:
* AprotininAnhydrase_Full.TXT
* BlueDextran_Full.TXT
* CytochromeCAlbumin_Full.TXT
* Protein1_Full.TXT

The data processing script, located at *data.R*, will import the full data, delete duplicate Volume values, and export
a cleaner set of data files that contain values only for Volume (independent) and UV (dependent).

## Clean data
> The R script data.R was executed on 2015-Nov-18 using R version 3.2.2 on Linux (Ubuntu 14.04.3).
> The following files were generated:
> * AprotininAnhydrase_clean.csv
> * BlueDextran_clean.csv
> * CytochromeCAlbumin_clean.csv
> * Protein1_clean.csv

The files listed above contain two variables, "Volume" and "UV", which are used for the following calculations.
There are unique values for "Volume" provided in each of the files.

## Notes about the math used to calculate this script

The relationship between elution volume and molecular weight is logarithmic.
Standard calculations measure the linearity of Log~10~(molecular weight) vs. ratio of elution volume
vs. the void volume.
Blue dextran is a compound that is so large, there is almost no interaction between dextran and
the matrix so blue dextran passes straight through.
The peak volume blue dextran leaves the column is known as the void volume (V~0~), and the peak volume
for each of the proteins leaving the column is known as the elution volume (V~e~) for each protein.

