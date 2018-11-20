# Packages ----

# Pakete installieren:
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tadaatoolbox")
install.packages("mosaic")
install.packages("sjPlot")
install.packages("sjmisc")
install.packages("rmarkdown")
install.packages("skimr")
install.packages("haven")
install.packages("readr")


# Das rödelt jetzt erstal in der Konsole, aber alles harmlos (außer ihr habt euch vertippt)

# Pakete laden ----
library("tadaatoolbox")
library("dplyr")
library("ggplot2")
library("mosaic")
library("sjmisc")
library("skimr")
# Das muss in jeder neuen Session (zB nach Neustart von RStudio) wieder gemacht werden

# Jetzt können wir coolere Dinge tun!

# Dank skimr: Einfache Übersicht über die Daten:
skim(ngo)

# Dank der Funktion frq aus dem Package sjmisc:
frq(ngo, stunzahl, out = "viewer")
frq(ngo, jahrgang, out = "viewer")

# Grupperte Mittelwerte via dplyr:
ngo %>%
  group_by(geschl) %>%
  summarize(mittelwert = mean(stunzahl))

# Oder mehr Gruppen:
ngo %>%
  group_by(geschl, jahrgang) %>%
  summarize(mittelwert = mean(stunzahl))

# Oder mehr Statistiken
ngo %>%
  group_by(geschl, jahrgang) %>%
  summarize(minimum = min(stunzahl),
            mittelwert = mean(stunzahl),
            median = median(stunzahl),
            maximum = max(stunzahl),
            standardabweichung = sd(stunzahl))

# Oder mehr Statistiken (hint hint, kommende Wochen!)
# via tadaatoolbox
# Das sind bivariate Statistiken, die kommen...bald.

# Nominalskalierte Statistiken
tadaa_nom(ngo$geschl, ngo$abschalt)

# Ordinalskalierte Statistiken
tadaa_ord(ngo$jahrgang, ngo$urteil)

# Oder mal was anderes: Bunt! ----
# aus dem package "mosaic"
xpnorm(q = 160, mean = 175, sd = 10)

# Die Wahrscheinlichkeit für Werte kleiner oder gleich 160 für eine normalverteilte Variable
# mit dem Mittelwert 175 und der Standardabweichung 10

# Oder plots (Datenvisualisierungen) via ggplot2 ----
# Histogramme
ggplot(data = ngo, aes(x = stunzahl)) +
  geom_histogram(binwidth = 1) +
  labs(title = "Histogramm von Stundenzahl")

ggplot(data = ngo, aes(x = stunzahl)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~geschl, ncol = 1) +
  labs(title = "Histogramm von Stundenzahl",
       subtitle = "Gruppiert (facetted) nach Geschlecht")

# Balkendiagramme
ggplot(data = ngo, aes(x = jahrgang)) +
  geom_bar() +
  labs(title = "Balkendiagramm")

# Mit relativen Häufigkeiten
ggplot(data = ngo, aes(x = jahrgang, y = stat(count/sum(count)))) +
  geom_bar() +
  labs(title = "Balkendiagramm",
       subtitle = "Mit relativen Häufigkeiten")

