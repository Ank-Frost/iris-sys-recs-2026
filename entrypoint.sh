#!/bin/bash

rm -f /rails.app/tmp/pids/server.pid
bin/rails db:migrate
exec "$@" # then execute the containers cmd