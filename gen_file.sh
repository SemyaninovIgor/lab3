#!/bin/bash
K=1103515245
M=2147483648   # 2^31
INTERVAL=10

OUTFILE="${1:-rand_$$.txt}"

X=$(date +%s)
X=$(( X % M ))

echo "Генератор запущен. Файл: $OUTFILE"
echo "PID процесса: $$"

while true; do
    X=$(( (K * X) % M ))
    (
        flock 9
        echo "$(date '+%H:%M:%S') $X" >> "$OUTFILE"
    ) 9>>"$OUTFILE.lock"
    sleep "$INTERVAL"
done
