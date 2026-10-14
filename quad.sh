#!/bin/bash
if [ $# -ge 3 ]; then
    a=$1
    b=$2
    c=$3
else
    read -p "Введите коэффициент a: " a
    read -p "Введите коэффициент b: " b
    read -p "Введите коэффициент c: " c
fi

echo "Уравнение: ${a}x^2 + ${b}x + ${c} = 0"

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ && "$c" =~ ^-?[0-9]+$ ]]; then
    echo "Ошибка: коэффициенты должны быть целыми числами!" >&2
    exit 1
fi

if [ "$a" -eq 0 ]; then
    if [ "$b" -eq 0 ]; then
        if [ "$c" -eq 0 ]; then
            echo "Бесконечно много решений."
        else
            echo "Нет решений."
        fi
    else
        X_LIN=$(echo "scale=4; -$c/$b" | bc -l)
        echo "Это линейное уравнение. Корень x = $X_LIN"
    fi
    exit 0
fi

D=$(( b*b - 4*a*c ))
echo "Дискриминант D = $D"

if [ "$D" -gt 0 ]; then
    X1=$(echo "scale=4; (-$b + sqrt($D)) / (2*$a)" | bc -l)
    X2=$(echo "scale=4; (-$b - sqrt($D)) / (2*$a)" | bc -l)
    echo "Два корня: x1 = $X1, x2 = $X2"
elif [ "$D" -eq 0 ]; then
    X=$(echo "scale=4; -$b / (2*$a)" | bc -l)
    echo "Один корень: x = $X"
else
    echo "Действительных корней нет."
fi
