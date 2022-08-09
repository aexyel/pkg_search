#! /bin/sh


if [ "$1" = "" ]; then
    echo No arguments specified.
    echo RUN:
    echo '    pkg_search.sh -u'
    echo '    pkg_search.sh search words'
    exit
fi



CURDIR=`pwd`
##pwd

mkdir ~/pkg_search.cache
cd ~/pkg_search.cache
##pwd



if [ "$1" = "-u" ]; then

echo Updating base...

RELEASE=$(uname -r)
sysctl -n kern.version | fgrep -e current -e beta > /dev/null && RELEASE='snapshots'
## > /dev/null
##echo $RELEASE
##cat /etc/installurl

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

PATTERN=''
while [ -n "$1" ]
do
PATTERN=$PATTERN' -e '$1
shift
done

##echo Searching for: $PATTERN
##exit

for fname in $(fgrep -R -i -l $PATTERN ./ports/ | sort | uniq); \
do { echo "\n=============================================================================\n" \
$fname "\n-----------------------------------------------------------------------------"; cat $fname ;} done | more

cd $CURDIR
##pwd

exit

fi
