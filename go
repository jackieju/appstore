ps ax | grep 'ruby' | grep 3001 |awk '{print $1}' |xargs kill -9
git pull && script/server -p 3001 -e production
