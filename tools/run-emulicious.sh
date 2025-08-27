#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: run-emulicious.sh /path/to/Emulicious.jar /path/to/rom.sms"
  exit 1
fi

JAR="$1"
ROM="$2"
exec java -jar "$JAR" "$ROM"
