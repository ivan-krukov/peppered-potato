#Get project name
name=$1
targetdir=$2
author=$USER

#Directory of the script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -n "${name:+1}" ] ; then

  # Use current directory if nothing else specified
  if [ -z "${targetdir:+1}" ] ; then
    targetdir='.'
    echo 'Using present working directory'
  fi

  # Abort if the target directory exists
  if [ -e "$targetdir/$name" ] ; then
    echo "Target $targetdir/$name already exists. Aborting"
    exit 1
  fi

  # Copy the skeleton and template strings

  cp -r $DIR/skeleton $targetdir/$name

  #templating all the files
  sed -i "s/{{NAME}}/$name/" `$targetdir/$name/ -type f`

  echo "Created $targetdir/$name"

else

  echo "USAGE: peppered-potato <project-name> <project-location>"
  exit 1
fi
