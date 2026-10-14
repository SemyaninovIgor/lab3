#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Использование:"
    echo "  $0 --name <имя_процесса>"
    echo "  $0 --user <имя_пользователя>"
    echo "  $0 --tty  <имя_терминала>"
    exit 1
fi

MODE=$1
VALUE=$2

case "$MODE" in
    --name)
        PIDS=$(pgrep -x "$VALUE")
        ;;
    --user)
        PIDS=$(ps -u "$VALUE" -o pid= | tr -d ' ')
        ;;
    --tty)
        PIDS=$(ps -t "$VALUE" -o pid= | tr -d ' ')
        ;;
    *)
        echo "Ошибка: Неизвестный флаг: $MODE" >&2
        exit 1
        ;;
esac

if [ -z "$PIDS" ]; then
    echo "Процессы не найдены."
    exit 1
fi

echo "Обнаружены целевые PID: $PIDS"

for PID in $PIDS; do
    echo "Завершаем процесс $PID..."
    if kill "$PID" 2>/dev/null; then
        echo "Процесс $PID успешно остановлен."
    else
        kill -9 "$PID" 2>/dev/null && echo "Принудительно уничтожен." || echo "Ошибка очистки PID $PID"
    fi
done
