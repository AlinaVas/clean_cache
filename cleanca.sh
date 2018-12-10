# SMALL SCRIPT FOR CACHE REMOVAL #

PURPLE='\033[1;95m'
BLUE='\033[1;94m'
NOCLR='\033[0m'

BEFORE=$(df -h | grep "$(whoami)" | awk {'print $4'})

find $HOME/Library -mindepth 1 -maxdepth 1 -name "*42_cache*" -print0 | xargs -0 /bin/rm -rf
find $HOME -mindepth 1 -maxdepth 1 -name ".*42_cache*" -print0 | xargs -0 /bin/rm -rf
find $HOME -mindepth 1 -maxdepth 1 -name ".*zcompdump*" -print0 | xargs -0 /bin/rm -rf
find $HOME/.Trash -mindepth 1 -maxdepth 1 -print0 | xargs -0 /bin/rm -rf

#This will delete TELEGRAM media cache that is older than 3 days
find $HOME/Library/Group\ Containers/*.Telegram/account-*/postbox/media/ -mindepth 1 -maxdepth 1 -mtime +3 -print0 | xargs -0 /bin/rm -rf

AFTER=$(df -h | grep "$(whoami)" | awk {'print $4'})

echo -e "${BLUE}Free space before clean: " $BEFORE
echo -e "${PURPLE}Free space after clean:  " $AFTER $NOCLR
