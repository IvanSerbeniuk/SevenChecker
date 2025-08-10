#!/bin/bash

#LOG_FILE="$HOME/daily_runner.log" 
LAST_RUN_FILE="/home/ivan/VScodeProjects/SevenChecker/.last_daily_run"
TODAY=$(date +%Y-%m-%d)


echo "[$(date '+%Y-%m-%d %H:%M:%S')] Запуск daily_runner.sh"


until ping -c1 github.com &>/dev/null; do
  echo "Waiting for network..."
  sleep 5
done



if [ -f "$LAST_RUN_FILE" ] && grep -q "$TODAY" "$LAST_RUN_FILE"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Уже запускалось сегодня: $TODAY"
    exit 0
fi


{
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Выполняется append_if.sh"
    bash /home/ivan/VScodeProjects/SevenChecker/append_if.sh
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Выполняется auto_commit_push.sh"
    bash /home/ivan/VScodeProjects/SevenChecker/auto_commit_push.sh
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Успешно завершено"
} 


echo "$TODAY" > "$LAST_RUN_FILE"

