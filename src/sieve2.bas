' Eratosthenes Sieve Prime Number Program in BASIC

size=8190
DIM flags(8191)
PRINT "BYTE Sieve Benchmark"
PRINT "Only 1 iteration"
VAR count = 0

FOR i=0 TO size
  flags (i) = 1
NEXT i

FOR i=0 TO size
  IF flags (i) = 0 THEN GOTO 18
  prime = i + i + 3
  k = i + prime
13:  IF k > size THEN GOTO 17
  flags (k) = 0
  k = k + prime
  GOTO 13
17:  count = count + 1
18: NEXT i

PRINT count," PRIMES"
