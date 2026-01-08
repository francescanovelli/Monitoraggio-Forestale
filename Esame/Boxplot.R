library(ggplot2)
library(patchwork)

# TEMPERATURE MAX E MIN
tagt <- read.csv("tagt.csv", stringsAsFactors = FALSE)
zoldot <- read.csv("zoldot.csv", stringsAsFactors = FALSE)
susat <- read.csv("susat.csv", stringsAsFactors = FALSE)
sturat <- read.csv("sturat.csv", stringsAsFactors = FALSE)  
grat <- read.csv("grat.csv", stringsAsFactors = FALSE)
nont <- read.csv("nont.csv", stringsAsFactors = FALSE)
camt <- read.csv("camt.csv", stringsAsFactors = FALSE)

# Unione E-W e N-S
t_ew <- rbind(tagt, zoldot, susat, sturat)
t_ns <- rbind(camt, grat, nont)

g1 = ggplot(t_ew) + 
  geom_boxplot(aes(y = temp_min, fill = "Minime")) +
  geom_boxplot(aes(y = temp_max, fill = "Massime")) +
  coord_cartesian(ylim = c(-2, 15)) +
  labs(title = "Temperature minime e massime, Valli E-W",
       y = "Temperatura (°C)",
       fill = "") +
  theme_minimal() + theme(legend.position = "none")

g2 = ggplot(t_ns) +
  geom_boxplot(aes(y = temp_min, fill = "Minime")) +
  geom_boxplot(aes(y = temp_max, fill = "Massime")) +
  coord_cartesian(ylim = c(-2, 15)) +
  labs(title = "Temperature minime e massime, Valli N-S",
       y = "Temperatura (°C)",
       fill = "") +
  theme_minimal()


# PRECIPITAZIONI
tagpr <- read.csv("tagpr.csv", stringsAsFactors = FALSE)
zoldopr <- read.csv("zoldopr.csv", stringsAsFactors = FALSE)
nonpr <- read.csv("nonpr.csv", stringsAsFactors = FALSE)
campr <- read.csv("campr.csv", stringsAsFactors = FALSE)
susapr <- read.csv("susapr.csv", stringsAsFactors = FALSE)
sturapr <- read.csv("sturapr.csv", stringsAsFactors = FALSE)
grapr <- read.csv("grapr.csv", stringsAsFactors = FALSE)

# Unione E-W e N-S
pr_ew <- rbind(tagpr, zoldopr, susapr, sturapr)
pr_ns <- rbind(campr, grapr, nonpr)

g3 = ggplot(pr_ew) + 
  geom_boxplot(aes(y = precip_mean_mm, fill = "Precipitazioni")) +
  coord_cartesian(ylim = c(0, 1500)) +
  labs(title = "Precipitazioni medie annue, Valli E-W",
       y = "Precipitazioni (mm)",
       fill = "") +
  theme_minimal() + theme(legend.position = "none")

g4 = ggplot(pr_ns) +
  geom_boxplot(aes(y = precip_mean_mm, fill = "PRecipitazioni")) +
  coord_cartesian(ylim = c(0, 1500)) +
  labs(title = "Precipitazioni medie annue, Valli N-S",
       y = "Precipitazioni (mm)",
       fill = "") +
  theme_minimal() + theme(legend.position = "none")

(g1+g2)/(g3+g4)

