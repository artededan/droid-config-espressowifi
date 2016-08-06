#!/bin/sh

DEVICE=/sys/board_properties/type

if [ -f "$DEVICE" ]; then
  VARIANT=`cat $DEVICE`
  case "$VARIANT" in
    "espresso10")
      # accelerometer position
      position=$(find /sys/devices/virtual/input/ -type f -name name | xargs grep '^accelerometer$' | sed 's@name:accelerometer@position@')
      echo -n 4 > $position

      # geomagnetic position
      position=$(find /sys/devices/platform/omap/omap_i2c.4/i2c-4/4-002e/input/ -type f -name name | xargs grep '^geomagnetic$' | sed 's@name:geomagnetic@position@')
      echo -n 4 > $position
      ;;
    #TODO: also add espresso{wifi} variant if really needed?
  esac
fi
