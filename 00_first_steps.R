# Erste Schritte

# Taschenrechner-flair ----
9 + 6
12 / 3
10 - 5
7 * 7
7^2
sqrt(64)

# Alles, was hinter # in einer Zeile steht wird ignoriert
# So könnt ihr euer Script kommentieren, damit ihr morgen noch wisst,
# was ihr heute gemacht habt.

# Es gilt auch in R: Rechenregeln (z.B. Klammern zuerst, Punkt vor Strich...)!
(2 + 4) * 3
2 + 4 * 3

# Achtung: Dezimalzahlen werden mit Punkt statt Komma getrennt, also:
1.5 * 2

# Ergebnisse in eine Variable speichern:

2018 - 1991
alter <- 2018 - 1991 # Variable erstellen mit dem Pfeil <-
alter                # Variable ausgeben / anzeigen

# Achtung: Groß- und Kleinschreibung werden beachtet!
Alter

# "Error: object 'Alter' not found" -> Die Variable gibt's nicht
alter                # Die gibt's.

# Mit Variablen kann gerechnet werden!
alter + 30
alter * alter  # Quadrat-Jahre?

# Mit Variablen kann gerechnet werden!
alter + 30

# Vektoren ----

# Ein Vektor ist praktisch nur eine Reihe von Werten
c(1, 2, 3, 4)
1:10           # Das : macht "gib Sequenz von 1 bis 10 aus"

# Vektoren können auch in Variablen gespeichert werden
groesse <- c(170, 163, 183, 190, 178, 172)
groesse

# Wir können mit Vektoren rechnen wie mit Zahlen
groesse / 100   # Teilt jeden Wert durch 100, im Beispiel: Konvertiert cm in Meter
