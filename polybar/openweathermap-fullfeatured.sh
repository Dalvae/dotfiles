#!/bin/bash

# Polybar OpenWeatherMap script
# Get your API key at: https://openweathermap.org/api
# Set your city and API key below

API_KEY=""
CITY="Santiago"
UNITS="metric"
SYMBOL="°C"

if [ -z "$API_KEY" ]; then
    echo " N/A"
    exit 0
fi

WEATHER=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$API_KEY&units=$UNITS")

if [ -z "$WEATHER" ]; then
    echo " N/A"
    exit 0
fi

TEMP=$(echo "$WEATHER" | jq -r '.main.temp' | cut -d. -f1)
DESCRIPTION=$(echo "$WEATHER" | jq -r '.weather[0].description')
ICON_CODE=$(echo "$WEATHER" | jq -r '.weather[0].icon')

case $ICON_CODE in
    01d) ICON="" ;;
    01n) ICON="" ;;
    02d|02n) ICON="" ;;
    03d|03n) ICON="" ;;
    04d|04n) ICON="" ;;
    09d|09n) ICON="" ;;
    10d|10n) ICON="" ;;
    11d|11n) ICON="" ;;
    13d|13n) ICON="" ;;
    50d|50n) ICON="" ;;
    *) ICON="" ;;
esac

echo "$ICON $TEMP$SYMBOL $DESCRIPTION"
