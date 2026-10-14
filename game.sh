#!/bin/bash
TARGET=$(( RANDOM % 100 + 1 ))
TRIES=0
MAX_ATTEMPTS=7

echo "=== Интерактивная игра «Угадай число» ==="
echo "Я загадал число от 1 до 100. У вас есть $MAX_ATTEMPTS попыток."

while [ "$TRIES" -lt "$MAX_ATTEMPTS" ]; do
    read -p "Ваш вариант: " GUESS
    
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "Ошибка: вводите только целые числа!"
        continue
    fi
    
    TRIES=$(( TRIES + 1 ))
    
    if [ "$GUESS" -lt "$TARGET" ]; then
        echo "Загаданное число БОЛЬШЕ! (Осталось попыток: $((MAX_ATTEMPTS - TRIES)))"
    elif [ "$GUESS" -gt "$TARGET" ]; then
        echo "Загаданное число МЕНЬШЕ! (Осталось попыток: $((MAX_ATTEMPTS - TRIES)))"
    else
        echo "Поздравляем! Вы угадали число $TARGET за $TRIES попыток!"
        exit 0
    fi
done

echo "Вы проиграли! Попытки закончились. Было загадано число: $TARGET"
