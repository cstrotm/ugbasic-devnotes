' Flying Lines

BITMAP ENABLE (160,192,2)
CLS
COLOR 1
PLOT 0,0

RANDOMIZE

x1d = -1
y1d = -1
x1  = RND(SCREEN WIDTH - 1)
y1  = RND(SCREEN HEIGHT - 1)

x2d = 1
y2d = 1
x2  = RND(SCREEN WIDTH -1)
y2  = RND(SCREEN HEIGHT -1)

DO
 LINE x1,y1 TO x2,y2,1
 LINE y2,x1 TO x2,y1,0
 x1 = x1 + x1d
 y1 = y1 + y1d
 x2 = x2 + x2d
 y2 = y2 + y2d

 IF x1 > SCREEN WIDTH OR x1 < 1 THEN x1d = -x1d
 IF y1 > SCREEN HEIGHT OR y1 < 1 THEN y1d = -y1d
 IF x2 > SCREEN WIDTH OR x2 < 1 THEN x2d = -x2d
 IF y2 > SCREEN HEIGHT OR y2 < 1 THEN y2d = -y2d

LOOP

PRINT "Finish"
