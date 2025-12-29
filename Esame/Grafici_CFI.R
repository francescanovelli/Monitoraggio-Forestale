# GRAFICI TIPOLOGIE DI VEGETAZIONE
CFI <- read.csv("classified_data_def.csv")

CFI$sum <- rowSums(CFI[, c(4, 5, 6, 7, 8)])
CFI$X0 <- round(((CFI$X0/CFI$sum)*100), 0)
CFI$X1 <- round(((CFI$X1/CFI$sum)*100), 0)
CFI$X2 <- round(((CFI$X2/CFI$sum)*100), 0)
CFI$X3 <- round(((CFI$X3/CFI$sum)*100), 0)
CFI$X4 <- round(((CFI$X4/CFI$sum)*100), 0)

ggplot(data = CFI, aes(x = year)) +
  geom_smooth(aes(y = X0, colour = "Altro"), method = "loess") +
  geom_smooth(aes(y = X1, colour = "Conifere"), method = "loess") + 
  geom_smooth(aes(y = X2, colour = "Latifoglie"), method = "loess") +
  geom_smooth(aes(y = X3, colour = "Latifoglie Sempreverdi"), method = "loess") +  
  geom_smooth(aes(y = X4, colour = "Suolo Nudo"), method = "loess") +
  labs(title = "Tipologia di Vegetazione",
       x = "Anno",
       y = "Percentuale (%)",
       color = "Legenda") +
  scale_color_manual(values = c("Altro" = "grey", 
                                "Conifere" = "darkgreen", 
                                "Latifoglie" = "yellow", 
                                "Latifoglie Sempreverdi" = "lightgreen", 
                                "Suolo Nudo" = "brown")) +
  theme_light()

ggplot(data = CFI, aes(x = year)) +
  geom_smooth(aes(y = X0, colour = "Altro"), method = "loess") +
  geom_smooth(aes(y = X1, colour = "Conifere"), method = "loess") + 
  geom_smooth(aes(y = X2, colour = "Latifoglie"), method = "loess") +
  geom_smooth(aes(y = X3, colour = "Latifoglie Sempreverdi"), method = "loess") +  
  geom_smooth(aes(y = X4, colour = "Suolo Nudo"), method = "loess") +
  labs(title = "Tipologia di Vegetazione",
       x = "Anno",
       y = "Percentuale (%)",
       color = "Legenda") +
  scale_color_manual(values = c("Altro" = "grey", 
                                "Conifere" = "darkgreen", 
                                "Latifoglie" = "yellow", 
                                "Latifoglie Sempreverdi" = "lightgreen", 
                                "Suolo Nudo" = "brown")) +
  facet_wrap(~ Nome.Valle, ncol = 2)+  
  theme_light()+
  theme(legend.position = c(0.75, 0.1))
