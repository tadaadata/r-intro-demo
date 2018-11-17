# Einfache Funktionen ----

# Mal angenommen wir haben eine Liste von Werten (als Vektor)
groesse <- c(170, 163, 183, 190, 178, 172)

# Wir berechnen nun ein paar gängige Statistiken...

# Mittelwert
mean(groesse)

# Median
median(groesse)

# Standardabweichung
sd(groesse)

# Quartile
quantile(groesse)

# Interquartilsabstand
IQR(groesse)

# Aber was, wenn Werte fehlen? ----

groesse <- c(170, 163, NA, 190, 178, 172)
groesse

# NA = "Not available", taucht zB auf wenn Leute die Frage im Fragebogen nicht beantwortet haben
mean(groesse)

# Ergibt NA – weil ein Wert fehlt

# So funktioniert's
mean(groesse, na.rm = TRUE)

# na.rm = "NA remove", nimmt NAs raus
# Gibt's in vielen Funktionen...
median(groesse, na.rm = TRUE)
sd(groesse, na.rm = TRUE)

