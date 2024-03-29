FROM ruby:3.1.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
WORKDIR /rails-lyrics-site
COPY Gemfile /rails-lyrics-site/Gemfile
COPY Gemfile.lock /rails-lyrics-site/Gemfile.lock
RUN bundle install
