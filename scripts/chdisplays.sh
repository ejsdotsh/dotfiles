#/bin/sh

# Configure names of external and internal displays
EM1="DP-1"
EM2="DP-2"
INTERNAL="eDP-1"

function show() {
  way-displays --delete DISABLED "$1" > /dev/null
}

function hide() {
  way-displays -s DISABLED "$1" > /dev/null
}

OPT_UNDOCKED="Internal display"
OPT_DOCKED="External display"
OPT_ALL="all displays"

function menu() {
  echo "${OPT_UNDOCKED}"
  echo "${OPT_DOCKED}"
  echo "${OPT_ALL}"
}

OPTION=$( (menu)  | rofi -dmenu -p "Configure displays")

# Invoke way-displays. Only hide a display if showing the other display
# succeeded. This reduces the chances to end up with both displays turned off,
# which is typically rather inconvenient.
if [ "${OPTION}" == "${OPT_INTERNAL}" ]
then
  show "${INTERNAL}" && hide "${EXTERNAL}"
elif [ "${OPTION}" == "${OPT_EXTERNAL}" ]
then
  show "${EXTERNAL}" && hide "${INTERNAL}"
elif [ "${OPTION}" == "${OPT_BOTH}" ]
then
  show "${EXTERNAL}"
  show "${INTERNAL}"
fi
