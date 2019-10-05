FROM ruby:2.5

MAINTAINER AMOL

RUN apt-get update && apt-get install -y nodejs libpq-dev sudo nano

# RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
#    && sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/" \
#    && sudo apt update \
#    && sudo apt install sublime-text

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD . /myapp/frontend-rails5-api

WORKDIR /myapp/frontend-rails5-api

COPY Gemfile /myapp/frontend-rails5-api/Gemfile
COPY Gemfile.lock /myapp/frontend-rails5-api/Gemfile.lock
RUN bundle install
COPY . /myapp/frontend-rails5-api

RUN sudo chmod 777 *

EXPOSE 3000

CMD ["bash","-cl","./entrypoint.sh"]