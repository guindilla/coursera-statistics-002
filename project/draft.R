## Add code to unzip

library(foreign)
dft <- read.dbf("ITER_NALDBF10.dbf", as.is=TRUE)

names(dft)

## Is telecommunication infrastructure development related to development of
## other type of infrastructure?
# Viviendas particulares habitadas
"VIVPAR_HAB" %in% names(dft)
# Viviendas particulares habitadas que disponen de luz eléctrica, agua entubada de la red pública y drenaje
"VPH_C_SERV" %in% names(dft)
# Viviendas particulares habitadas que disponen de línea telefonica fija
"VPH_TELEF" %in% names(dft)

# Exploring the data
head(dft, n=100)
dft[dft$NOM_LOC %in% c("Total nacional", "Localidades de una vivienda", "Localidades de dos viviendas", "Total de la Entidad", "Total del Municipio"), ][, c(2, 4, 6)]

# Select the columns we are interested in:
# Name of localities
# VIVPAR_HAB: Viviendas particulares habitadas
# VPH_C_SERV: Viviendas particulares habitadas que disponen de luz eléctrica, agua entubada de la red pública y drenaje
# VPH_TELEF: Viviendas particulares habitadas que disponen de línea telefonica fija

dft2 <- dft[, c("ENTIDAD",
              "MUN",
              "LOC",
              "NOM_LOC",
              "POBTOT",
              "VIVPAR_HAB",
              "TVIVPARHAB",
              "TVIVPAR",
              "TVIVHAB",
              "VPH_C_SERV",
              "VPH_TELEF")]
head(dft2, n = 20)
dft2[dft2 == "*"] <- NA
str(dft2)
head(dft2, n = 20)
dft2$POBTOT <- as.numeric(dft2$POBTOT)
dft2$VPH_C_SERV <- as.numeric(dft2$VPH_C_SERV)
dft2$VPH_TELEF <- as.numeric(dft2$VPH_TELEF)
dft2$VIVPAR_HAB <- as.numeric(dft2$VIVPAR_HAB)
dft2$TVIVPARHAB <- as.numeric(dft2$TVIVPARHAB)
dft2$TVIVPAR <- as.numeric(dft2$TVIVPAR)
dft2$TVIVHAB <- as.numeric(dft2$TVIVHAB)
head(dft2, n = 20)
str(dft2)

# separate complete cases and incomplete cases
dft3 <- dft2[complete.cases(dft2), ]
dft3.nc <- dft2[!complete.cases(dft2), ]
dim(dft3)
dim(dft3.nc)


dft3$id <- paste0(dft3$ENTIDAD, dft3$MUN, dft3$LOC)

# Remove lines without households
dft3 <- dft3[!(dft3$VIVPAR_HAB == 0), ]
dim(dft3)

# Remove localities with more inhabited households than population
dft3 <- dft3[dft3$POBTOT > dft3$VIVPAR_HAB, ]
dim(dft3)
# Damn, it seems there are too many of those!!
sum(dft3$POBTOT < dft3$TVIVPARHAB)
sum(dft3$POBTOT < dft3$VIVPAR_HAB)
sum(dft3$POBTOT < dft3$TVIVPAR)
sum(dft3$POBTOT < dft3$TVIVHAB)

# Analysis continues here, but for fun, as the problem above invalidates
# our analysis at localidad level. We will look later in this file at
# Municipio level.

sort(unique(dft3.nc$POBTOT))
table(dft3.nc$POBTOT)
hist(dft3.nc$POBTOT, breaks = dim(dft3.nc)[1])
hist(dft3.nc[dft3.nc$POBTOT < 101, ]$POBTOT, breaks = 100)
# How much of the population are we ignoring?
sum(dft3.nc$POBTOT)

dft3$infr <- dft3$VPH_C_SERV/dft3$VIVPAR_HAB
dft3$telco <- dft3$VPH_TELEF/dft3$VIVPAR_HAB
dft3$infr2 <- dft3$VPH_C_SERV/dft3$TVIVPARHAB
dft3$telco2 <- dft3$VPH_TELEF/dft3$TVIVPARHAB
dft3$infr3 <- dft3$VPH_C_SERV/dft3$TVIVPAR
dft3$telco3 <- dft3$VPH_TELEF/dft3$TVIVPAR

dim(dft3[dft3$infr > 1, ])
dim(dft3[dft3$infr2 > 1, ])
dim(dft3)
# Let's explore how infr and telco variables are distributed
range(dft3$infr)

sum(dft3$TVIVPARHAB < dft3$VIVPAR_HAB)
sum(dft3$TVIVPARHAB > dft3$VIVPAR_HAB)

# Remove localities that have unrealistic proportions
prop.limit <- 1
dft4 <- dft3[!(dft3$infr > prop.limit | dft3$telco > prop.limit), ]

hist(dft4$infr, breaks = 1000)
hist(dft4$telco, breaks = 1000)



################################################################################
## Clean version of the above
################################################################################

dft <- read.dbf("ITER_NALDBF10.dbf", as.is=TRUE)
# Select the columns we are interested in:
# Name of localities
# VIVPAR_HAB: Viviendas particulares habitadas
# VPH_C_SERV: Viviendas particulares habitadas que disponen de luz eléctrica, agua entubada de la red pública y drenaje
# VPH_TELEF: Viviendas particulares habitadas que disponen de línea telefonica fija

dft2 <- dft[, c("ENTIDAD",
                "MUN",
                "LOC",
                "NOM_LOC",
                "POBTOT",
                "VIVPAR_HAB",
                "VPH_C_SERV",
                "VPH_TELEF")]
head(dft2, n = 20)
dft2[dft2 == "*"] <- NA
str(dft2)
head(dft2, n = 20)
dft2$POBTOT <- as.numeric(dft2$POBTOT)
dft2$VPH_C_SERV <- as.numeric(dft2$VPH_C_SERV)
dft2$VPH_TELEF <- as.numeric(dft2$VPH_TELEF)
dft2$VIVPAR_HAB <- as.numeric(dft2$VIVPAR_HAB)
head(dft2, n = 20)
str(dft2)

# separate complete cases and incomplete cases
dft3 <- dft2[complete.cases(dft2), ]
dim(dft3)

dft3$id <- paste0(dft3$ENTIDAD, dft3$MUN, dft3$LOC)

# Remove lines without households
dft3 <- dft3[!(dft3$VIVPAR_HAB == 0), ]
dim(dft3)

# Remove localities with more inhabited households than population
dft3 <- dft3[dft3$POBTOT > dft3$VIVPAR_HAB, ]
dim(dft3)

# Transform integers to proportions
dft3$infr <- dft3$VPH_C_SERV/dft3$VIVPAR_HAB
dft3$telco <- dft3$VPH_TELEF/dft3$VIVPAR_HAB

# Remove localities that have unrealistic proportions
prop.limit <- 1
dft4 <- dft3[!(dft3$infr > prop.limit | dft3$telco > prop.limit), ]
dim(dft4)

dft4$infr <- cut(dft4$infr, breaks=seq(0, 1, by = 0.2),
               labels=c("very low","low","medium","high","very high"), include.lowest=TRUE)
table(dft4$infr)
dft4$telco <- cut(dft4$telco, breaks=seq(0, 1, by = 0.2),
                labels=c("very low","low","medium","high","very high"), include.lowest=TRUE)
table(dft4$telco)



################################################################################
## Start again with Municipios
################################################################################
dft <- read.dbf("ITER_NALDBF10.dbf")
# Select the columns we are interested in:
# Name of localities
# VIVPAR_HAB: Viviendas particulares habitadas
# VPH_C_SERV: Viviendas particulares habitadas que disponen de luz eléctrica, agua entubada de la red pública y drenaje
# VPH_TELEF: Viviendas particulares habitadas que disponen de línea telefonica fija
dft <- dft[, c("ENTIDAD", "MUN", "NOM_MUN", "NOM_LOC", "POBTOT", "VIVPAR_HAB", "TVIVPARHAB", "TVIVPAR", "VPH_C_SERV", "VPH_TELEF")]
dft$id <-  paste0(dft$ENTIDAD, dft$MUN)

# We are looking only for total Municipio lines
dft2 <- dft[dft$NOM_LOC == "Total del Municipio", ]

# Reorder and eliminate undeeded columns
dft2 <- dft2[, c("id", "NOM_MUN", "POBTOT", "VIVPAR_HAB", "VIVPAR_HAB", "VPH_C_SERV", "VPH_TELEF")]

# Change types
########### Check here that I really need as.numeric.factor()!!
dft2$id <- as.factor(dft2$id)
dft2$NOM_MUN <- as.character(dft2$NOM_MUN)
dft2$POBTOT <- as.numeric.factor(dft2$POBTOT)
dft2$VIVPAR_HAB <- as.numeric.factor(dft2$VIVPAR_HAB)
dft2$VPH_C_SERV <- as.numeric.factor(dft2$VPH_C_SERV)
dft2$VPH_TELEF <- as.numeric.factor(dft2$VPH_TELEF)

# Transform integers to proportions
dft2$infr <- dft2$VPH_C_SERV/dft2$VIVPAR_HAB
dft2$telco <- dft2$VPH_TELEF/dft2$VIVPAR_HAB

head(dft2[(dft2$infr > prop.limit | dft2$telco > prop.limit), ], n=50)










dft5$VPH_C_SERV <- cut(dft4$VPH_C_SERV, breaks=c(quantile(dft4$VPH_C_SERV, probs = seq(0, 1, by = 0.25))), 
    labels=c("very low","low","medium","high"), include.lowest=TRUE)

dft5$VPH_TELEF <- cut(dft4$VPH_TELEF, breaks=c(quantile(dft4$VPH_TELEF, probs = seq(0, 1, by = 0.25))), 
                      labels=c("very low","low","medium","high"), include.lowest=TRUE)

summary(dft5)
