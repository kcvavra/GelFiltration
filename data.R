# Import all the raw data files
# Variables for the lists imported from CSV:
#     aprot, blue, cyto, protein

aprot <- read.csv(file = "Data/AprotininAnhydrase_Full.TXT", skip = 20)
blue <- read.csv(file = "Data/BlueDextran_Full.TXT", skip = 20)
cyto <- read.csv(file = "Data/CytochromeCAlbumin_Full.TXT", skip = 20)
protein <- read.csv(file = "Data/Protein1_Full.TXT", skip = 20)

# Create new list containing unique volume values from each of imported lists
# variables will be u[original variable] (u for unique)
# The blocks will also extract only the "Volume" and "UV" variables

uaprot <- aprot[ ! duplicated( aprot[ c("Volume") ] ), c("Volume", "UV")]
ublue <- blue[ ! duplicated( blue[ c("Volume") ] ), c("Volume", "UV")]
ucyto <- cyto[ ! duplicated( cyto[ c("Volume") ] ), c("Volume", "UV")]
uprotein <- protein[ ! duplicated( cyto[ c("Volume") ] ), c("Volume", "UV")]

# Write data to files
write.csv(uaprot, file = "Data/AprotininAnhydrase_clean.csv")
write.csv(ublue, file = "Data/BlueDextran_clean.csv")
write.csv(ucyto, file = "Data/CytochromeCAlbumin_clean.csv")
write.csv(uprotein, file = "Data/Protein1_clean.csv")