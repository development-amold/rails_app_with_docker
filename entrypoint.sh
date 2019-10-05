#!/bin/bash
set -e

cd /myapp/frontend-rails5-api

sudo chmod -R 777 *

rake db:create

rake db:migrate

bundle exec rails s -p 3000 -b '0.0.0.0'
