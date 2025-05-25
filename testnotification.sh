#!/bin/bash

BOT_TOKEN=""
CHAT_ID=""
LOG_FILE="./tests.log"
MESSAGE_CAPTION="tests de hoje"

# --- Validações ---
if [ ! -f "$LOG_FILE" ]; then
    echo "Erro: O arquivo de log '$LOG_FILE' não foi encontrado."
    exit 1
fi

# simple logging
echo "Enviando o arquivo '$LOG_FILE' para o Telegram..."

# curl para enviar a notificação
# obs: usar -F disable_notification=true envia a mensagem sem som
curl -s -X POST \
     https://api.telegram.org/bot$BOT_TOKEN/sendDocument \
     -F chat_id="$CHAT_ID" \
     -F document=@"$LOG_FILE" \
	 -F caption="$MESSAGE_CAPTION" \

if [ $? -eq 0 ]; then
    echo "Arquivo enviado com sucesso!"
else
    echo "Erro ao enviar o arquivo."
fi