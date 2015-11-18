Gel Filtration Chromatography R Project
===========

> This is an R project developed for our lab to calibrate the molecular weight of proteins (kDa)
> to elution volumes, or the time it takes for proteins to travel through a gel-based matrix, 
> of a gel filtration column.  More information about gel filtration chromatography (GFC) can
> be located <a href="https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=gel%20filtration%20chromatography">
> with a Google search </a>.

This script, located at GFC.R, does the following:
* Import the raw data exported from the chromatography system (in CSV format)
* Calculate the peak maxima for the calibration data
* Find a correlation between the molecular weight of to the observed maximum for each protein
* Plot and export an overlay of the chromatograms used to calibrated the column
* Plot and export a calibration curve to demonstrate the linearity of the calibration
* Print calibration curve values
* Calculate a peak maximum for "Protein 1" and apply peak maximum to calibration curve to 
measure molecular mass.

