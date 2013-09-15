while getopts a:b:c OPT; do
  case $OPT in
    a)
      echo "OPTION[$OPT] = $OPTARG"
      ;;
    b)
      echo "OPTION[$OPT] = $OPTARG"
      ;;
    c)
      echo "OPTION[$OPT] = $OPTARG"
      ;;
  esac
done
shift `expr $OPTIND - 1`

