#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Open Google Meet
# @raycast.mode silent
# @raycast.packageName Google
# @raycast.icon images/logo.png
# @raycast.author Mujib Azizi
# @raycast.authorURL https://github.com/mujibazizi
# @raycast.description Start a Google Meet session

open https://meet.google.com/new

MAX_TRIES=10
TRIES=0

get_url () {
  URL=$(osascript -e 'tell application "Chrome" to URL of active tab of front window as text')
}

while true; do
  ((TRIES++))

  # Allow some time between each iteration to perform an attempt
  sleep 1

  # As we're doing `while true`, we do want to make sure we can
  # exit the script when we feel we've tried too many times.
  if [[ "$TRIES" -gt "$MAX_TRIES" ]]; then
    echo "Could not copy Google Meet url"
    break;
  fi

  get_url

  # First, we'll check if we are still on the Google Meet page.
  if [[ $URL != "https://meet.google.com"* ]]; then
    continue
  fi

  # Next, we want to make sure it's not still loading.
  if [[ $URL == *"new"* ]]; then
    continue
  fi

  echo $URL | pbcopy
  echo "Copied Google Meet url"
  break
done
