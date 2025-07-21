#!/bin/bash

LOG_FILE="$HOME/daily_runner.log"
LAST_RUN_FILE="$HOME/VScodeProjects/SevenChecker/.last_daily_run"
TODAY=$(date +%Y-%m-%d)

# Запись в лог начало выполнения
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Запуск daily_runner.sh" >> "$LOG_FILE"

# Проверка: уже запускалось сегодня?
if [ -f "$LAST_RUN_FILE" ] && grep -q "$TODAY" "$LAST_RUN_FILE"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Уже запускалось сегодня: $TODAY" >> "$LOG_FILE"
    exit 0
fi

# Выполнение скриптов с логированием ошибок и вывода
{
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Выполняется append_if.sh"
    bash ~/VScodeProjects/SevenChecker/append_if.sh
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Выполняется auto_commit_push.sh"
    bash ~/VScodeProjects/SevenChecker/auto_commit_push.sh
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Успешно завершено"
} >> "$LOG_FILE" 2>&1

# Обновить дату последнего запуска
echo "$TODAY" > "$LAST_RUN_FILE"

