' 21 GAME
' Rosetta Code Webseite https://rosettacode.org/wiki/21_game
'

PROC readkey
  REPEAT
    t$=INKEY$
  UNTIL t$>"0" AND t$<"4"
  PRINT t$
  r=VAL(t$)
  RETURN r
END PROC

sum=0
add=0
VAR turn AS INT
turn = PEEK($D20A) AND $01

CLS
PRINT "21 ist ein Spiel fuer 2 Personen,"
PRINT "Jeder Spieler waehlt eine Nummer"
PRINT "(1, 2, or 3) welche auf die laufende"
PRINT "Summe addiert wird."
PRINT
PRINT "Das Spiel wird gewonnen wenn ein"
PRINT "Spieler eine Zahl waehlt welche"
PRINT "eine Summe von genau 21 ergibt."
PRINT
PRINT "Die Summe startet mit dem Wert 0."
PRINT
PRINT "Ein Spieler ist der Computer."
PRINT

REPEAT
  turn=ABS(turn-1)
  PRINT "Die Summe ist ";sum
  IF turn == 0 THEN
    PRINT "Dein Zug.":PRINT "Welche Zahl addieren? (1-3): ";
    add=readkey[]
    IF add > (21-sum) THEN
      PRINT "Du kannst maximal ";21-sum;
      PRINT " addieren."
    ENDIF
  ELSE
    diff = (sum-1) MOD 4
    add  = 4 - diff
    IF add == 4 THEN
      add=RND(3)+1
      PRINT "RND"
    ENDIF
    PRINT "Zug des Computers."
    PRINT "Der Computer addiert ";add
  ENDIF
  sum = sum + add
  PRINT
UNTIL sum >= 21
PRINT "Die Summe ist ";sum
IF turn == 0 THEN
  PRINT "Gratulation, du hast gewonnen."
ELSE
  PRINT "Pech, der Computer hat gewonnen."
ENDIF
END
