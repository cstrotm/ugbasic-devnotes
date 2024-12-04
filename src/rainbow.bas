' Klassischer Atari Regenbogen Effekt
CONST colpf2 = $D018
CONST wsync  = $D40A
CONST vcount = $D40B
CONST rtclock2 = $14

PRINT "Hello ugBASIC"

DO
    POKE wsync,0
    POKE colpf2,PEEK(rtclock2)-PEEK(vcount)
LOOP
