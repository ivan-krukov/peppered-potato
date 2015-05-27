#Get project name
$name = $1

mkdir -p $1/build
mkdir -p $1/data
mkdir -p $1/results

touch $1/README.md
touch $1/makefile
