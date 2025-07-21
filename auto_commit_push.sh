#!/usr/bin/env bash

# ▶︎ Путь к вашему репозиторию
REPO_DIR="/home/ivan/VScodeProjects/SevenChecker"

# ▶︎ На какую ветку пушить
BRANCH="master"

cd "$REPO_DIR" || { echo "❌ Cannot cd to $REPO_DIR"; exit 1; }

# Добавляем все изменения (новые/удалённые/модифицированные файлы)
git add -A

# Проверяем, есть ли что коммитить
if git diff-index --quiet HEAD; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — No changes to commit."
  exit 0
fi

# Создаём коммит с отметкой времени
git commit -m "New step in sevenchecker functionality : $(date '+%Y-%m-%d')"

# Отправляем на удалённый репозиторий
git push origin "$BRANCH"
