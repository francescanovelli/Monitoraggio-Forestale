# Grafico temperature Valle Stura
ggplot(data = sturat, aes(x = year)) + 
  geom_point(aes(y = temp_max, colour = "Temperatura massima"))+
  geom_point(aes(y = temp_min, colour = "Temperatura minima")) +  
  geom_smooth(aes(y = temp_max), method = 'lm', se = TRUE, color = "orange") +
  geom_smooth(aes(y = temp_min), method = 'lm', se = TRUE, color = "lightblue") +
  labs(title = "Temperature medie annue in Valle Stura",
       x = "Anno",
       y = "Temperatura (°C)",
       color = "Legenda") +
  scale_color_manual(values = c("Temperatura minima" = "blue", "Temperatura massima" = "red")) +
  theme_light()

# Grafico precipitazioni Valle Stura
ggplot(data = sturapr, aes(x = year, y = precip_mean_mm)) + 
  geom_col(fill = "skyblue") +
  geom_smooth(method = 'lm', se=F, color = "deepskyblue") +
  labs(title = "Precipitazioni medie annue in Valle Stura",
       x = "Anno",
       y = "Precipitazioni (mm)" )+
  ylim(0, 1500)+
  theme_light()
