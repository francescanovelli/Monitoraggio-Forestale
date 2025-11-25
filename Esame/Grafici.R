library(ggplot2)
sturapr <- read.csv("sturapr.csv")
sturat <- read.csv("sturat.csv")

# Grafico temperature Valle Stura
mod_sturatmax <- lm(temp_max ~ year, data = sturat)
slope_sturatmax <- coef(mod_sturatmax)[2]

mod_sturatmin <- lm(temp_min ~ year, data = sturat)
slope_sturatmin <- coef(mod_sturatmin)[2]

ggplot(data = sturat, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_sturatmax, 3)),
           hjust = 1.1, vjust = 1.1,,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_sturatmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Temperature medie annue in Valle Stura",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()

# Grafico precipitazioni Valle Stura
mod_sturapr <- lm(precip_mean_mm ~ year, data = sturapr)
slope_sturapr <- coef(mod_sturapr)[2]

ggplot(data = sturapr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_sturapr, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  labs(title = "Precipitazioni medie annue in Valle Stura",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

