#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Использование: $0 \"команда\""
    exit 1
fi
CMD="$@"
echo "=== Измерение времени ==="
echo "Команда: $CMD"
START=$(date +%s%N)
eval "$CMD"
STATUS=$?
END=$(date +%s%N)
ELAPSED_MS=$(( (END - START) / 1000000 ))
echo "Код возврата: $STATUS"
echo "Время выполнения: ${ELAPSED_MS} мс"
echo "=== Время работы самого скрипта ==="
echo "Скрипт выполняется уже ${SECONDS} сек."

