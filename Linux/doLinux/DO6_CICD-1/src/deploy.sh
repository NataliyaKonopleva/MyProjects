#!/bin/bash

# Устанавливаем переменные
REMOTE_USER="server_user"
REMOTE_HOST="192.168.100.20"
REMOTE_DIR="/usr/local/bin"

scp src/SimpleBashUtils/src/cat/s21_cat "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
scp src/SimpleBashUtils/src/grep/s21_grep "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
