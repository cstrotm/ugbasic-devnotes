CLS
PRINT "LIFE"
PRINT "CREATIVE COMPUTING"
PRINT "MORRISTOWN, NEW JERSEY"
PRINT: PRINT: PRINT
PRINT "Bitte gebe das Start-Muster ein,"
PRINT "ein Leerzeichen fuer eine leere Zelle"
PRINT "und ein X fuer eine gefuellte Zelle" 
PRINT "Gebe 'DONE' ein um die Eingabe zu"
PRINT "beenden. Es koennen bis zu"
PRINT "24 Zeilen eingegeben werden."
PRINT
PRINT "Gebe das Muster ein:"
x1=1
y1=1
x2=24
y2=39
DIM a(24,70)
DIM b$(24)
c=1

input:
INPUT in$
b$(c) = in$
IF b$(c)="DONE" THEN 
  b$(c)=""
  GOTO start
ENDIF
IF LEFT$(b$(c),1)="." THEN 
  b$(c)=" "+RIGHT$(b$(c),LEN(b$(c))-1)
ENDIF
c=c+1
70 GOTO input

start:
c=c-1
l=0
FOR x=1 TO c-1
  IF LEN(b$(x))>l THEN 
    l=LEN(b$(x))
  ENDIF
NEXT x
x1=11-c/2
y1=33-l/2
FOR x=1 TO c
  FOR y=1 TO LEN(b$(x))
    IF MID$(b$(x),y,1)<>" " THEN 
      a(x1+x,y1+y)=1
      p=p+1
    ENDIF
  NEXT y
NEXT x

printgen:
CLS
PRINT "GENERATION:";g,"POPULATION:";p;
IF i9 == -1 THEN 
  PRINT " INVALID!";
ENDIF
  
x3=24
y3=39
x4=1
y4=1
p=0
g=g+1

FOR x=x1 TO x2
  FOR y=y1 TO y2
    IF a(x,y)=2 THEN 
      a(x,y)=0
      GOTO nextgen
    ENDIF
    IF a(x,y)=3 THEN 
      a(x,y)=1
      GOTO printstar
    ENDIF
    IF a(x,y)<>1 THEN GOTO nextgen
printstar:
    LOCATE y,x
    PRINT "*"
    IF x<x3 THEN x3=x
    IF x>x4 THEN x4=x
    IF y<y3 THEN y3=y
    IF y>y4 THEN y4=y
nextgen:
  NEXT y
NEXT x

x1=x3
x2=x4
y1=y3
y2=y4

IF x1<3 THEN 
  x1=3
  i9=-1
ENDIF
IF x2>21 THEN 
  x2=21
  i9=-1
ENDIF
IF y1<3 THEN 
  y1=3
  i9=-1
ENDIF
IF y2>38 THEN 
  y2=38
  i9=-1
ENDIF

p=0
FOR x=x1-1 TO x2+1
  FOR y=y1-1 TO y2+1
    c=0
    FOR i=x-1 TO x+1
      FOR j=y-1 TO y+1
        IF a(i,j)=1 OR a(i,j)=2 THEN c=c+1
      NEXT j
    NEXT i
    IF a(x,y)=0 THEN GOTO l1
    IF c<3 OR c>4 THEN 
      a(x,y)=2
      GOTO l2
    ENDIF
    p=p+1
l2:
    GOTO l3
l1:
    IF c=3 THEN 
      a(x,y)=3
      p=p+1
    ENDIF
l3:
  NEXT y
NEXT x

x1=x1-1
y1=y1-1
x2=x2+1
y2=y2+1

WAIT 500 MS

GOTO printgen

END
