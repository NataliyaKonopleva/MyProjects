#!/bin/bash

TELEGRAM_BOT_TOKEN="7247892626:AAFf54IUoS3E38y9gy-dOlzsZeurrtVSJeg"
TELEGRAM_USER_ID="5723599590"
TIME=10
DATE=$(date '+%d/%m/%Y %H:%M:%S');

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$DATE%0AProject:+$CI_PROJECT_NAME%0AStage: +$CI_JOB_NAME%0AStatus: +$CI_JOB_STATUS%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"


curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null