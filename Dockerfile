FROM ruby:2.5.3
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cmake pkg-config
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
COPY . /myapp
