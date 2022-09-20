#! /bin/sh


if [ "$1" = "" ]; then
    echo No arguments specified.
    echo Run:
    echo Update DB files: pkg_search.sh -u[s]
    echo Search in DESCR: pkg_search.sh [-p fpath] search words ...
    echo fpath - is optional category name inside ports directory.
    echo search words ... - words to search inside DESCR files.
    exit
fi



CURDIR=`pwd`
##pwd



if [[ "$1" = "-u" || "$1" = "-us" ]]; then

mkdir ~/pkg_search.cache
cd ~/pkg_search.cache
##pwd

echo Updating base...

RELEASE=$(uname -r)
sysctl -n kern.version | fgrep -e current -e beta > /dev/null && RELEASE='snapshots'
## > /dev/null
##echo $RELEASE
##cat /etc/installurl

if [ "$1" = "-us" ]; then
RELEASE='snapshots'
echo Forced to snapshot.
fi

WU='no'
ftp -T $(grep -v -e "#" -e "^[ \t]*$" /etc/installurl | head -n 1)/$RELEASE/ports.tar.gz && WU='yes'


if [ "$WU" = "yes" ]; then
    echo Unpacking. Wait...
    tar -tzf ports.tar.gz | fgrep DESCR | tar -xzf ports.tar.gz -I /dev/fd/0
else
    echo No updates found.
fi

cd $CURDIR
##pwd

echo Updating base finished.
exit

else

cd ~/pkg_search.cache

if [ "$1" = "-p" ]; then
    if [ "$2" = "" ]; then
	echo No search path specified.
	exit
    fi
    FPATH=$2
    shift
    shift
fi


PATTERN=''
while [ -n "$1" ]; do
    PATTERN=$PATTERN' -e '$1
    shift
done

if [ "$PATTERN" = "" ]; then
    echo No search words specified.
    exit
fi

##echo Searching for: $PATTERN
##exit

for fname in $(fgrep -R -i -l $PATTERN ./ports/$FPATH | sort | uniq); \
do { echo "\n=============================================================================\n" \
$fname "\n-----------------------------------------------------------------------------"; cat $fname ;} done | more

cd $CURDIR
##pwd

exit

fi
