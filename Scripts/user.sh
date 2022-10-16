# User logo
# ======

echo ''

if command -v figlet &> /dev/null
then
  figlet $USER
else
  echo $USER
fi

echo ''

