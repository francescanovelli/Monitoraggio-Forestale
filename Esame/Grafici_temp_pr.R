library(ggplot2)
library(patchwork)
library(dplyr)

# VALLI
vallipr <- read.csv("vallipr.csv")
vallit <- read.csv("vallit.csv")

# Grafico temperature Valli
mod_vallitmax <- lm(temp_max ~ year, data = vallit)
slope_vallitmax <- coef(mod_vallitmax)[2]

mod_vallitmin <- lm(temp_min ~ year, data = vallit)
slope_vallitmin <- coef(mod_vallitmin)[2]

gv_t <- ggplot(data = vallit, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_vallitmax, 3)),
           hjust = 1.1, vjust = 1.1,,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_vallitmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Temperature medie annue nelle valli",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "inside", legend.position.inside = c(0.5, 0.5))

# Grafico precipitazioni Valli
mod_vallipr <- lm(precip_mean_mm ~ year, data = vallipr)
slope_vallipr <- coef(mod_vallipr)[2]

gv_p <- ggplot(data = vallipr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_vallipr, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  labs(title = "Precipitazioni medie annue nelle valli",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

gv_t
gv_p

# ALTA VAL TAGLIAMENTO
tagpr <- read.csv("tagpr.csv")
tagt <- read.csv("tagt.csv")

# Grafico temperature Alta Valle del Tagliamento
mod_tagtmax <- lm(temp_max ~ year, data = tagt)
slope_tagtmax <- coef(mod_tagtmax)[2]

mod_tagtmin <- lm(temp_min ~ year, data = tagt)
slope_tagtmin <- coef(mod_tagtmin)[2]

g1 <- ggplot(data = tagt, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_tagtmax, 3)),
           hjust = 1.1, vjust = 1.1,,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_tagtmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Alta Valle del Tagliamento",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Alta Valle del Tagliamento
mod_tagpr <- lm(precip_mean_mm ~ year, data = tagpr)
slope_tagpr <- coef(mod_tagpr)[2]

g1p <- ggplot(data = tagpr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_tagpr, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  labs(title = "Alta Valle del Tagliamento",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

# VALLE DI ZOLDO
zoldopr <- read.csv("zoldopr.csv")
zoldot <- read.csv("zoldot.csv")

# Grafico temperature Val di Zoldo
mod_zoldotmax <- lm(temp_max ~ year, data = zoldot)
slope_zoldotmax <- coef(mod_zoldotmax)[2]

mod_zoldotmin <- lm(temp_min ~ year, data = zoldot)
slope_zoldotmin <- coef(mod_zoldotmin)[2]

g2 <- ggplot(data = zoldot, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_zoldotmax, 3)),
           hjust = 1.1, vjust = 1.1,,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_zoldotmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Val di Zoldo",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Val di Zoldo
mod_zoldopr <- lm(precip_mean_mm ~ year, data = zoldopr)
slope_zoldopr <- coef(mod_zoldopr)[2]

g2p <- ggplot(data = zoldopr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_zoldopr, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  labs(title = "Val di Zoldo",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

# VALLE DI NON
nonpr <- read.csv("nonpr.csv")
nont <- read.csv("nont.csv")

# Grafico temperature Valle di Non
mod_nontmax <- lm(temp_max ~ year, data = nont)
slope_nontmax <- coef(mod_nontmax)[2]

mod_nontmin <- lm(temp_min ~ year, data = nont)
slope_nontmin <- coef(mod_nontmin)[2]

g3 <- ggplot(data = nont, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_nontmax, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_nontmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Valle di Non",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+theme(legend.position = "none")

# Grafico precipitazioni Valle di Non
mod_nonpr <- lm(precip_mean_mm ~ year, data = nonpr)
slope_nonpr <- coef(mod_nonpr)[2]

g3p <-ggplot(data = nonpr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_nonpr, 3)),
           hjust = 1.2, vjust = 1.6,
           size = 5)+
  labs(title = "Valle di Non",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

# VAL CAMONICA
campr <- read.csv("campr.csv")
camt <- read.csv("camt.csv")

# Grafico temperature Val Camonica
mod_camtmax <- lm(temp_max ~ year, data = camt)
slope_camtmax <- coef(mod_camtmax)[2]

mod_camtmin <- lm(temp_min ~ year, data = camt)
slope_camtmin <- coef(mod_camtmin)[2]

g4 <- ggplot(data = camt, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_camtmax, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_camtmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Val Camonica",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Val Camonica
mod_campr <- lm(precip_mean_mm ~ year, data = campr)
slope_campr <- coef(mod_campr)[2]

g4p <- ggplot(data = campr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_campr, 3)),
           hjust = 1.2, vjust = 1.6,
           size = 5)+
  labs(title = "Val Camonica",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

#VAL DI SUSA
susapr <- read.csv("susapr.csv")
susat <- read.csv("susat.csv")

# Grafico temperature Val di Susa
mod_susatmax <- lm(temp_max ~ year, data = susat)
slope_susatmax <- coef(mod_susatmax)[2]

mod_susatmin <- lm(temp_min ~ year, data = susat)
slope_susatmin <- coef(mod_susatmin)[2]

g5 <- ggplot(data = susat, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_susatmax, 3)),
           hjust = 1.1, vjust = 1.1,,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_susatmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Val di Susa",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Val di Susa
mod_susapr <- lm(precip_mean_mm ~ year, data = susapr)
slope_susapr <- coef(mod_susapr)[2]

g5p <- ggplot(data = susapr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_susapr, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  labs(title = "Val di Susa",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

#VALLE STURA
sturapr <- read.csv("sturapr.csv")
sturat <- read.csv("sturat.csv")

# Grafico temperature Valle Stura
mod_sturatmax <- lm(temp_max ~ year, data = sturat)
slope_sturatmax <- coef(mod_sturatmax)[2]

mod_sturatmin <- lm(temp_min ~ year, data = sturat)
slope_sturatmin <- coef(mod_sturatmin)[2]

g6 <- ggplot(data = sturat, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_sturatmax, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_sturatmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Valle Stura",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "none")

# Grafico precipitazioni Valle Stura
mod_sturapr <- lm(precip_mean_mm ~ year, data = sturapr)
slope_sturapr <- coef(mod_sturapr)[2]

g6p <- ggplot(data = sturapr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_sturapr, 3)),
           hjust = 1.2, vjust = 1.6,
           size = 5)+
  labs(title = "Valle Stura",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

# VAL D'OSSOLA
grapr <- read.csv("grapr.csv")
grat <- read.csv("grat.csv")

# Grafico temperature Val d'Ossola
mod_gratmax <- lm(temp_max ~ year, data = grat)
slope_gratmax <- coef(mod_gratmax)[2]

mod_gratmin <- lm(temp_min ~ year, data = grat)
slope_gratmin <- coef(mod_gratmin)[2]

g7 <- ggplot(data = grat, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_gratmax, 3)),
           hjust = 1.1, vjust = 1.1,
           size = 5)+
  annotate("text",
           x = Inf, y = -Inf,
           label = paste("Slope =", round(slope_gratmin, 3)),
           hjust = 1.1, vjust = -0.5,
           size = 5)+
  labs(title = "Val d'Ossola",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()

# Grafico precipitazioni Val d'Ossola
mod_grapr <- lm(precip_mean_mm ~ year, data = grapr)
slope_grapr <- coef(mod_grapr)[2]

g7p <- ggplot(data = grapr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  annotate("text",
           x = Inf, y = Inf,
           label = paste("Slope =", round(slope_grapr, 3)),
           hjust = 1.2, vjust = 1.6,
           size = 5)+
  labs(title = "Val d'Ossola",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

g1+g2+g3+g4+g5+g6+g7 + guide_area() + plot_layout(ncol=2, guides='collect') + plot_annotation(
  title = "Temperature medie annue nelle valli alpine")

g1p+g2p+g3p+g4p+g5p+g6p+g7p + guide_area() + plot_layout(ncol=2, guides='collect') + plot_annotation(
  title = "Precipitazioni medie annue nelle valli alpine")

# FOCUS ALTA VAL TAGLIAMENTO
# Grafico focus temperature Alta Valle del Tagliamento
Tag_focusT <- ggplot(tagt %>% filter(year >= max(year) - 40), aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +
  geom_smooth(aes(y = temp_max), method = 'loess', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'loess', se = TRUE, color = "lightblue") +
  labs(title = "Alta Valle del Tagliamento",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "inside", legend.position.inside = c(0.5, 0.5))

# Grafico focus precipitazioni Alta Valle del Tagliamento
Tag_focusP <- ggplot(tagpr %>% filter(year >= max(year) - 40), aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'loess', se=T, color = "deepskyblue") +
  labs(x = "Anno", y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()

# FOCUS VAL D'OSSOLA
# Grafico focus temperature Val d'Ossola
Oss_focusT <- ggplot(grat %>% filter(year >= max(year) - 40), aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'loess', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'loess', se = TRUE, color = "lightblue") +
  labs(title = "Val d'Ossola",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()+
  theme(legend.position = "inside", legend.position.inside = c(0.5, 0.5))

# Grafico precipitazioni Val d'Ossola
Oss_focusP <- ggplot(grapr %>% filter(year >= max(year) - 40), aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=T, color = "deepskyblue") +
  labs(x = "Anno", y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()
