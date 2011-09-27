#!/bin/sh
exec ctags-exuberant \
-h ".php" -R \
--exclude="\.svn" --exclude="yiilite.php" --exclude="\.git" --exclude="*.js" \
--totals=yes \
--tag-relative=yes \
--fields=+afkst \
--PHP-kinds=+cf 
echo "[DONE]"
