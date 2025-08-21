#!/bin/bash

AUTH_KEYS_FILE="/home/testhomefoler/testuser/.ssh/authorized_keys"

if [ ! -f "$AUTH_KEYS_FILE" ]; then
    echo "Error: $AUTH_KEYS_FILE does not exist."
    exit 1
fi

line_number=0
while IFS= read -r line
do
    ((line_number++))
    if [ -n "$line" ]; then
        if ! echo "$line" | ssh-keygen -l -f /dev/stdin &>/dev/null; then
            echo "Error on line $line_number: Invalid key format"
            echo "Line content: $line"
        fi
    fi
done < "$AUTH_KEYS_FILE"

echo "Finished checking $AUTH_KEYS_FILE"
