#!/bin/bash

OPTION=$1 # "--type" to send as keys with `wtype`

## Speech-to-Text using Cloudflare Workers AI

source ~/.cf-creds

if [[ -z "$CF_API_TOKEN" ]] || [[ -z "$CF_ACCOUNT_ID" ]]; then
    echo "Error: Set CF_API_TOKEN and CF_ACCOUNT_ID env vars first"
    echo "  export CF_API_TOKEN=\"your_token\""
    echo "  export CF_ACCOUNT_ID=\"your_account_id\""
    exit 1
fi

STATUS_FILE=/tmp/stt_status
TEMP_FILE=/tmp/temp_stt.wav

if [[ ! -f "$TEMP_FILE" ]]; then
    # Start recording in background
    echo "STT (Listening..)" >$STATUS_FILE
    timeout 60 arecord -f cd -r 44100 -c 1 "$TEMP_FILE" 2>/dev/null &
    disown
    exit 0
fi

# Stop recording
REC_PID=$(lsof "$TEMP_FILE" | tail +2 | cut -d' ' -f2)
kill $REC_PID 2>/dev/null
wait $REC_PID 2>/dev/null

API_URL="https://api.cloudflare.com/client/v4/accounts/${CF_ACCOUNT_ID}/ai/run/@cf/openai/whisper-large-v3-turbo"

body=$(mktemp)
echo "{\"audio\": \"$(base64 -w0 "$TEMP_FILE")\"}" >$body

echo "STT (Transcribing..)" >$STATUS_FILE
# Transcribe
RESPONSE=$(curl -s "$API_URL" -H "Authorization: Bearer $CF_API_TOKEN" --json @$body)

# Extract and display result
TRANSCRIPT=$(echo "$RESPONSE" | jq -r '.result.text // .result' 2>/dev/null)

if [[ -n "$TRANSCRIPT" && "$TRANSCRIPT" != "null" ]]; then
    case $OPTION in
    --type) wtype "$TRANSCRIPT" ;;
    *) echo "$TRANSCRIPT" ;;
    esac
else
    echo "Error: Could not transcribe audio"
    echo "$RESPONSE"
fi

# Cleanup
rm -f "$TEMP_FILE" "$body" "$STATUS_FILE"
