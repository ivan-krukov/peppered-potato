#Get project name
name=$1
targetdir=$2
author=$USER

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

  cp -r skeleton $targetdir/$name
  sed -i "s/{{NAME}}/$name/" $targetdir/$name/makefile
  sed -i "s/{{NAME}}/$name/" $targetdir/$name/README.md

  echo "Created $targetdir/$name"

else

  echo "USAGE: peppered-potato <project-name> <project-location>"
  exit 1
fi
