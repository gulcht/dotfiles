#!/usr/bin/env bash

# Query wttr.in directly
# %C = weather condition, %t = temperature
raw=$(curl -s "https://wttr.in/Bangkok?m&format=%C+%t")

# Extract condition (everything except last field) and temperature (last field only)
condition=$(echo "$raw" | awk '{$NF=""; print $0}' | xargs | tr '[:upper:]' '[:lower:]')
temp=$(echo "$raw" | awk '{print $NF}' | tr -d '+%')  # remove leading + and trailing %

# Match condition against keywords (case-insensitive since we lowercased it)
case "$condition" in
  *clear*|*sun*) icon="" ;;    # sun
  *cloud*|*overcast*) icon="" ;; # cloud
  *rain*|*shower*|*drizzle*) icon="" ;; # rain
  *thunder*|*storm*) icon="" ;; # thunderstorm
  *snow*|*sleet*) icon="" ;;   # snow
  *fog*|*mist*) icon="" ;;    # fog/mist
  *) icon="" ;;                # default
esac

# Output icon + temperature
echo "$icon ${temp}"
