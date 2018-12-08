# CLEAN CACHE #

PURPLE='\033[1;95m'
BLUE='\033[1;94m'
NOCLR='\033[0m'

BEFORE=$(df -h | grep "$(whoami)" | awk {'print $4'})

find $HOME/Library/ -mindepth 1 -maxdepth 1 -name "*42_cache*" -delete
find $HOME -maxdepth 1 -name ".*42_cache*" -or -name ".*zcompdump*" -delete
find $HOME/.Trash -mindepth 1 -delete

#This will delete TELEGRAM media cache that is older than 7 days
find $HOME/Library/Group\ Containers/*.Telegram/account-*/postbox/media/ -maxdepth 1 -mtime +7 -delete

AFTER=$(df -h | grep "$(whoami)" | awk {'print $4'})

echo -e "${BLUE}Free space before clean: " $BEFORE
echo -e "${PURPLE}Free space after clean:  " $AFTER $NOCLR