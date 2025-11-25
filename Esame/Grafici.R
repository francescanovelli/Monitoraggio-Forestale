library(ggplot2)
sturapr <- read.csv("sturapr.csv")
sturat <- read.csv("sturat.csv")
susapr <- read.csv("susapr.csv")
susat <- read.csv("susat.csv")
zoldopr <- read.csv("zoldopr.csv")
zoldot <- read.csv("zoldot.csv")
tagpr <- read.csv("tagpr.csv")
tagt <- read.csv("tagt.csv")

#---------------------------------------------------------------------------------------
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
        labs(title = "Temperature medie annue in Val di Susa",
                x = "Anno",
                y = "Temperatura (°C)",
                color = "Legenda") +
        scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
        theme_light()

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
        labs(title = "Precipitazioni medie annue in Val di Susa",
                x = "Anno",
                y = "Precipitazioni (mm)" )+
        ylim(0, 1500)+
        theme_light()

#-----------------------------------------------------------
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
        labs(title = "Temperature medie annue in Val di Zoldo",
                x = "Anno",
                y = "Temperatura (°C)",
                color = "Legenda") +
        scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
        theme_light()

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
        labs(title = "Precipitazioni medie annue in Val di Zoldo",
                x = "Anno",
                y = "Precipitazioni (mm)" )+
        ylim(0, 1500)+
        theme_light()

#-----------------------------------------------------------
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
                label = paste("Slope =", round(slope_zoldotmax, 3)),
                hjust = 1.1, vjust = 1.1,,
                size = 5)+
            annotate("text",
                x = Inf, y = -Inf,
                label = paste("Slope =", round(slope_zoldotmin, 3)),
                hjust = 1.1, vjust = -0.5,
                size = 5)+
        labs(title = "Temperature medie annue in Alta Valle del Tagliamento",
                x = "Anno",
                y = "Temperatura (°C)",
                color = "Legenda") +
        scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
        theme_light()

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
        labs(title = "Precipitazioni medie annue in Alta Valle del Tagliamento",
                x = "Anno",
                y = "Precipitazioni (mm)" )+
        ylim(0, 1500)+
        theme_light()


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

