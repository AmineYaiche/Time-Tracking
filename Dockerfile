FROM ruby:2.3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y\
  zlib1g-dev ruby-dev libsqlite3-dev nodejs


RUN gem install rails -v '5.1.6'

RUN mkdir -p /app
WORKDIR /app
RUN gem install bundler -v '1.17.3'
ADD Gemfile Gemfile.lock /app/
RUN bundle install
