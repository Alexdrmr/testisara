---
editor_options: 
  markdown: 
    wrap: 72
---

install.packages("tidyverse") install.packages("tinytex")
tinytex::install_tinytex()

library(ggplot2) \
# Création d'un jeu de données fictif 
df \<-data.frame( category = rep(c("A", "B", "C"), each = 100), 
x =rnorm(300), y = rnorm(300))

# Création d'un graphique avec plusieurs couches

ggplot(df, mapping = aes(x = x, y = y, color = category)) +
geom_point(size = 30) + geom_smooth(method = "lm", linetype = "dashed",
color = "black") + facet_wrap(\~category) + labs(title = "Graphique avec
plusieurs couches", x = "Variable X", y = "Variable Y") +
geom_density_2d_filled()+ geom_polygon()+

#geom_point(): Ajoute un nuage de points coloré par catégorie.
#geom_smooth(): Ajoute une ligne de régression linéaire (droite de tendance) en pointillés. 
#facet_wrap(): Divise le graphique en sous-graphiques par catégorie. 
#labs(): Ajoute des étiquettes au graphique. 
#geom_density_2d_filled() : Ajoute des contours remplis basés sur la densité 2D des données 
#geom_polygon() : Ajoute des polygones
*
