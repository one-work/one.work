#!/bin/sh -e

bin/rails db:prepare
rm -f tmp/pids/server.pid
bin/rails s --log-to-stdout
