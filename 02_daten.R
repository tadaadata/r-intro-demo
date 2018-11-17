# Richtige Daten ----

# Der ngo-Datensatz liegt im Ordner "data" als .rds-Datei, einmal einlesen...
ngo <- readRDS("data/ngo.rds")

# Und die ersten paar Zeilen anzeigen
head(ngo)

# Umgang mit Daten ----

# das Objekt ngo ist jetzt ein "data.frame" - Jede Spalte ist ein Vektor, so wie vorher
# Auf einzelne Spalten greifen wir so zu:
ngo$stunzahl
# Das sind jetzt alle Werte der Spalte stunzahl ("Stunden pro Woche")

# Damit können wir wieder Statistiken berechnen...
mean(ngo$stunzahl)

# Oder Häufigkeitstabellen:
table(ngo$jahrgang)

# In Jahrgang 11: 100 Leute, in 12: 100, in 13: 50

# Oder relative Häufigkeiten?
# Häufigkeitstabelle speichern als "tabelle"...
tabelle <- table(ngo$jahrgang)

# ... und dann in prop.table() stecken:
prop.table(tabelle)

# Was, wenn wir filtern wollen? z.B alle weiblichen Schüler?
ngo_w <- subset(ngo, geschl == "Weiblich")

head(ngo_w)
# Das sind jetzt nur noch weibliche Schüler

# Dasselbe für männliche
ngo_m <- subset(ngo, geschl == "Männlich")

# So können wir zB einfach Gruppen Vergleichen
mean(ngo_m$leistung)
mean(ngo_w$leistung)

# Oder einfacher, wenn auch etwas schwieriger nachzuvollziehen:
tapply(ngo$leistung, ngo$geschl, mean)
