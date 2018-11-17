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
