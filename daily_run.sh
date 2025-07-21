#!/bin/bash

# Путь к файлу, где хранится дата последнего запуска
LAST_RUN_FILE="$HOME/VScodeProjects/SevenChecker/.last_daily_run"

# Получить сегодняшнюю дату (только день)
TODAY=$(date +%Y-%m-%d)

# Проверка: запускался ли уже сегодня?
if [ -f "$LAST_RUN_FILE" ] && grep -q "$TODAY" "$LAST_RUN_FILE"; then
    echo "Уже запускалось сегодня: $TODAY"
    exit 0
fi

# Выполнить скрипты
bash ~/VScodeProjects/SevenChecker/append_if.sh
bash ~/VScodeProjects/SevenChecker/auto_commit_push.sh

# Обновить дату последнего запуска
echo "$TODAY" > "$LAST_RUN_FILE"

