#!/usr/bin/env bash

ZONE=$(curl -s https://ipapi.co/timezone)
if [[ -n "$ZONE" ]]; then
  echo "Setting timezone to $ZONE"
  timedatectl set-timezone "$ZONE"
else
  echo "Could not determine timezone"
fi

