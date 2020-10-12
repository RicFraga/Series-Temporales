path_to_data = '/home/fraga/Documents/Series Temporales/Data/Rmissing.csv'
mydata <- read.csv(path_to_data)

myts = ts(mydata$mydata)
myts

summary(myts)

# Observación de datos atípicos en los picos y faltantes en los cortes
plot(myts)

library(zoo)

# Last observation carried forward
# Localiza datos faltantes y los rellena con la última observación antes del NA
myts.NAlocf = na.locf(myts)

# Rellenar datos faltantes con un valor que otorguemos
myts.NAfill = na.fill(myts, 33)

library(forecast)

myts1 = tsoutliers(myts)

# Dónde están los outliers y qué valor sugiere poner
myts1

# Lidiar con valores faltantes con interpolación
myts.NAinterp = na.interp(myts)
plot(myts.NAinterp)

# Quitar observaciones "incorrectas"
mytsclean = tsclean(myts)
plot(mytsclean)
summary(mytsclean)


