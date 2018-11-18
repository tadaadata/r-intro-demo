# Mehr Daten!

## Daten im SPSS-Format brauchen das haven-package
library(haven)
qm <- read_spss("data/qm_survey_ss2018.sav")
skim(qm)

## Auch gängig: CSV-Dateien (einfacher Text mit Komma (oder so) getrennt)
library(readr)
participation <- read_csv("data/participation.csv")
skim(participation)


# Ein bisschen rumspielen mit dem QM-Datensatz (eurer VorgängerInnen) ----

# Den Fragebogen seht ihr hier:
browseURL("https://public.tadaa-data.de/surveys/qmsurvey2018.pdf")

# Einfache Statistiken
mean(qm$alter)
quantile(qm$alter)

# Kontingenztabellen
library(sjPlot)
sjt.xtab(qm$gender, qm$rauchen, show.row.prc = TRUE)
sjt.xtab(qm$rauchen, qm$cannabis,
         show.row.prc = TRUE, show.col.prc = TRUE, show.cell.prc = TRUE,
         show.legend = TRUE)

# Außreißer und Rekodieren ----

# Wir betrachten mal die Variable "Freundeskreis"
range(qm$freundeskreis) # Spannweite: Kleinster und größter Wert
quantile(qm$freundeskreis)

# Das ist viel Spannweite. Mal als Histogramm:
ggplot(data = qm, aes(x = freundeskreis)) +
  geom_histogram(binwidth = 10)

# Uff. Vielleicht wollen wir alle Leute mit mehr als 100 Freunden rauskicken.

# Nehme qm, filtere, so dass nur Leute mit "< 100" Freunden bleiben, speichere in qm
qm <- qm %>%
  filter(freundeskreis < 100)

# Nochmal gucken:
ggplot(data = qm, aes(x = freundeskreis)) +
  geom_histogram(binwidth = 10)

# Viel handlicher!

# Gruppieren (=Rekodieren) ----
library(sjmisc)
# Rekodieren via rec(), siehe auch Hilfe und Beispiele unter
?rec

qm$freundeskreis_klassiert <- rec(qm$freundeskreis, rec = "0:10=1; 11:20=2; 21:30=3; 31:max=4")

# Jetzt machen wir ein ordinales Merkmal draus, mit Labels
qm$freundeskreis_klassiert <- factor(
  qm$freundeskreis_klassiert,
  labels = c("Wenige", "Mittel", "Viele", "Sehr viele"),
  ordered = TRUE
)

# Angucken
qm$freundeskreis_klassiert

# Viel handlicher!
ggplot(data = qm, aes(x = freundeskreis_klassiert)) +
  geom_bar()

# Vielleicht jetzt mit bunt?
ggplot(data = qm, aes(x = freundeskreis_klassiert)) +
  geom_bar(fill = "darkred", color = "black") +
  theme_tadaa()
