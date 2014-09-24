library(foreign)
df <- read.dbf("ITER_NALDBF10.dbf")

names(df)
## Is there a relationship between broadband penetration and level of education
## of the population?
"GRAPROES" %in% names(df)
"VPH_INTER" %in% names(df)

## Is telecommunication infrastructure development related to development of
## other type of infrastructure?
# Viviendas particulares habitadas
"VIVPAR_HAB" %in% names(df)
# Viviendas particulares habitadas que disponen de luz eléctrica, agua entubada de la red pública y drenaje
"VPH_C_SERV" %in% names(df)
# Viviendas particulares habitadas que disponen de línea telefonica fija
"VPH_TELEF" %in% names(df)

df2 <- df[, c("VIVPAR_HAB", "VPH_C_SERV", "VPH_TELEF")]
df2[df2 == "*", ]
head(df2, n=100)
df3 <- df2[complete.cases(df2), ]

df3$VPH_C_SERV <- as.numeric(df3$VPH_C_SERV)
df3$VPH_TELEF <- as.numeric(df3$VPH_TELEF)
df3$VIVPAR_HAB <- as.numeric(df3$VIVPAR_HAB)

df4$VPH_C_SERV <- df3$VPH_C_SERV/df3$VIVPAR_HAB
df4$VPH_TELEF <- df3$VPH_TELEF/df3$VIVPAR_HAB

df5 <- df4
df5$VPH_C_SERV <- cut(df4$VPH_C_SERV, breaks=c(quantile(df4$VPH_C_SERV, probs = seq(0, 1, by = 0.25))), 
    labels=c("very low","low","medium","high"), include.lowest=TRUE)

df5$VPH_TELEF <- cut(df4$VPH_TELEF, breaks=c(quantile(df4$VPH_TELEF, probs = seq(0, 1, by = 0.25))), 
                      labels=c("very low","low","medium","high"), include.lowest=TRUE)

summary(df5)
