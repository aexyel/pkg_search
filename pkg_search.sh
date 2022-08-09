#! /bin/sh

cd /tmp && ftp $(grep -v -e "#" -e "^[ \t]*$" /etc/installurl | head -n 1)/$(uname -r)/ports.tar.gz

tar -tzf ports.tar.gz | fgrep DESCR | tar -xzf ports.tar.gz -I /dev/fd/0

for fname in $(fgrep -R -i -l $(SEARCH_WORD) ./ports/ | sort | uniq); \
do { echo "\n=============================================================================\n" \
$fname "\n-----------------------------------------------------------------------------"; cat $fname ;} done | more

