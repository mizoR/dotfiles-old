
if which duo > /dev/null 2>&1; then
  duo --play `echo $(( $RANDOM % 30 ))`
fi

