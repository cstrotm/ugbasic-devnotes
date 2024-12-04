' Klassischer Atari Regenbogen Effekt
VAR colpf2 AS BYTE = $D018
VAR wsync  AS BYTE = $D40A
VAR vcount AS BYTE = $D40B
VAR rtclock2 AS BYTE = $0014

PRINT "Hello ugBASIC"

DO
    POKE(wsync),0
    POKE(colpf2),PEEK(rtclock2) - PEEK(vcount)
LOOP 
