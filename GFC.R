# Import required libraries for script

library("ggplot2")
library("reshape")
library("tools")
library("pastecs")
library("scales")

# Import CSV files from data.R script processing
# Variable names: aprot, blue, cyto, protein
aprot <- read.csv(file = "Data/AprotininAnhydrase_clean.csv")
blue <- read.csv(file = "Data/BlueDextran_clean.csv")
cyto <- read.csv(file = "Data/CytochromeCAlbumin_clean.csv")
protein <- read.csv(file = "Data/Protein1_clean.csv")

# Add a name column to plot the different samples on the same axis
aprot$name <- "Aprotinin"
blue$name <- "BlueDextran"
cyto$name <- "CytochromeC"
protein$name <- "Protein1"

# Combine the samples into one variable for ggplot and make plot p
calData <- rbind(aprot, blue,cyto)

p <- ggplot(calData, aes(x = Volume, y =UV))
p <- p + geom_line(aes(color = name)) + theme_bw()
print(p)

# Blue Dextran has one maximum, so Elution Volume can be calculated:
vol0 <- which.max(blue$UV)
BlueVol <- blue$Volume[vol0]
print(BlueVol)
#BlueVol becomes the "void volume" of the column, or Vo

# Other calibration experiments have two maxima, because two samples are loaded in each run
# Each maximum is found based on limits added to the which.max function

#Aprotinin is eluting between 15-20 mL, so we are getting this maximum in this range:
vol1 <- 151 + which.max(aprot$UV[151:200])
AprotVol <- aprot$Volume[vol1]
print(AprotVol)

# Carbonic Anhydrase is also in the Aprotinin sample, and this is the first peak between 10 -15mL
vol2 <- 101 + which.max(aprot$UV[101:150])
CAVol <- aprot$Volume[vol2]
print(CAVol)

# Cytochrome C elutes between 15-20 mL, so max is calculated as:
vol3 <- 151 + which.max(cyto$UV[151:200])
CytoVol <- cyto$Volume[vol3]
print(CytoVol)

# Albumin is also present in the Cytochrome C sample, and this peak is between 9 and 13 mL
vol4 <- 91 + which.max(cyto$UV[91:130])
Albumin <- cyto$Volume[vol4]
print(Albumin)

#The rest of these values are known as "elution volumes," or Ve values.

#Calculate Ve/Vo ratios for linear fit
Ratio_Albumin <- Albumin/BlueVol
Ratio_AprotVol <- AprotVol/BlueVol
Ratio_CAVol <- CAVol/BlueVol
Ratio_CytoVol <- CytoVol/BlueVol

# Create new data frame with Standards Name, Standard Molecular Weight (in KDaltons), and Ve/Vo ratio
standards <- c("Albumin", "Carbonic Anhydrase", "Cytochrome C", "Aprotinin")
VeVo <- c(Ratio_Albumin, Ratio_CAVol, Ratio_CytoVol, Ratio_AprotVol)
MolecularWeights <- c(66, 29, 12.4, 6.5)
