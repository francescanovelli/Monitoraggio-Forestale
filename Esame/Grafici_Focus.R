library(ggplot2)
library(patchwork)
library(dplyr)

CFI <- read.csv("classified_data_def.csv")

CFI$sum <- rowSums(CFI[, c(4, 5, 6, 7, 8)])
CFI$X0 <- round(((CFI$X0/CFI$sum)*100), 0)
CFI$X1 <- round(((CFI$X1/CFI$sum)*100), 0)
CFI$X2 <- round(((CFI$X2/CFI$sum)*100), 0)
CFI$X3 <- round(((CFI$X3/CFI$sum)*100), 0)
CFI$X4 <- round(((CFI$X4/CFI$sum)*100), 0)

# FOCUS ALTA VAL TAGLIAMENTO
tagpr <- read.csv("tagpr.csv")
tagt <- read.csv("tagt.csv")

# Grafico focus temperature Alta Valle del Tagliamento
Tag_focusT <- ggplot(tagt %>% filter(year >= max(year) - 40), aes(x = year)) + 
  geom_point(aes(y = temp_min), colour = "blue") +
  geom_smooth(aes(y = temp_min), method = 'loess', se = TRUE, color = "lightblue") +
  labs(title = "Alta Valle del Tagliamento",
       x = "Anno",
       y = "Temperatura minima (°C)",
       color = "Legenda") +
  ylim(-1, 4)+
  theme_light()+
  theme(legend.position = "none")

# Grafico focus precipitazioni Alta Valle del Tagliamento
Tag_focusP <- ggplot(tagpr %>% filter(year >= max(year) - 40), aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'loess', se=T, color = "deepskyblue") +
  labs(x = "Anno", y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

#Grafico focus vegetazione Alta Val Tagliamento
Tag_focusV <- ggplot(CFI %>% filter(Nome.Valle == "Alta Val Tagliamento"), aes(x = year)) +
  geom_smooth(aes(y = X0, colour = "Altro"), method = "loess") +
  geom_smooth(aes(y = X1, colour = "Conifere"), method = "loess") + 
  geom_smooth(aes(y = X2, colour = "Latifoglie"), method = "loess") +
  geom_smooth(aes(y = X3, colour = "Latifoglie Sempreverdi"), method = "loess") +  
  geom_smooth(aes(y = X4, colour = "Suolo Nudo"), method = "loess") +
  labs(x = "Anno", y = "Percentuale (%)", color = "Legenda") +
  scale_color_manual(values = c("Altro" = "grey", 
                                "Conifere" = "darkgreen", 
                                "Latifoglie" = "yellow", 
                                "Latifoglie Sempreverdi" = "lightgreen", 
                                "Suolo Nudo" = "brown")) +
  ylim(0, 85)+
  theme_light()+
  theme(legend.position = "none")

# FOCUS VAL D'OSSOLA
grapr <- read.csv("grapr.csv")
grat <- read.csv("grat.csv")

# Grafico focus temperature Val d'Ossola
Oss_focusT <- ggplot(grat %>% filter(year >= max(year) - 40), aes(x = year)) + 
  geom_point(aes(y = temp_min), colour = "blue") +  
  geom_smooth(aes(y = temp_min), method = 'loess', se = TRUE, color = "lightblue") +
  labs(title = "Val d'Ossola",
       x = "Anno",
       y = "Temperatura minima (°C)",
       color = "Legenda") +
  ylim(-1, 4)+
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Val d'Ossola
Oss_focusP <- ggplot(grapr %>% filter(year >= max(year) - 40), aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'loess', se=T, color = "deepskyblue") +
  labs(x = "Anno", y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

#Grafico focus vegetazione Val d'Ossola
Oss_focusV <- ggplot(CFI %>% filter(Nome.Valle == "Val d'Ossola"), aes(x = year)) +
  geom_smooth(aes(y = X0, colour = "Altro"), method = "loess") +
  geom_smooth(aes(y = X1, colour = "Conifere"), method = "loess") + 
  geom_smooth(aes(y = X2, colour = "Latifoglie"), method = "loess") +
  geom_smooth(aes(y = X3, colour = "Latifoglie Sempreverdi"), method = "loess") +  
  geom_smooth(aes(y = X4, colour = "Suolo Nudo"), method = "loess") +
  labs(x = "Anno", y = "Percentuale (%)", color = "Legenda") +
  scale_color_manual(values = c("Altro" = "grey", 
                                "Conifere" = "darkgreen", 
                                "Latifoglie" = "yellow", 
                                "Latifoglie Sempreverdi" = "lightgreen", 
                                "Suolo Nudo" = "brown")) +
  ylim(0, 85)+
  theme_light()+
  theme(legend.position = "none")

(Tag_focusT+Oss_focusT)/(Tag_focusP+Oss_focusP)/(Tag_focusV+Oss_focusV)
