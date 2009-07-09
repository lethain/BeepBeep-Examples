#!/bin/sh
cd `dirname $0`
case $1 in
    server)
	exec erl -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -s reloader \
	    -s bb_blog -detached
	;;
    dev_server)
        exec erl -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -s reloader \
            -s bb_blog
        ;;
    create_db)
	echo "create database...\n"
	exec erl -pa $PWD/ebin $PWD/deps/*/ebin -run bb_blog_utils create_db \
	    -run init stop -noshell

	;;
    delete_db)
	echo "delete database...\n"
	exec erl -pa $PWD/ebin $PWD/deps/*/ebin -run bb_blog_utils delete_db \
	    -run init stop -noshell
	;;
    reset_db)
	echo "reset database...\n"
	exec erl -pa $PWD/ebin $PWD/deps/*/ebin -run bb_blog_utils reset_db \
	    -run init stop -noshell
	;;
    info_db)
	echo "info for database...\n"
	exec erl -pa $PWD/ebin $PWD/deps/*/ebin -run bb_blog_utils info_db \
	    -run init stop -noshell
	;;
    *)
	echo "Usage: $0 {server|dev_server|create_db|delete_db|reset_db|info_db}"
	exit 1
esac
exit 0
