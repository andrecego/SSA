FROM ruby:2.6.5-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler --version 2.1.4

RUN mkdir /ssa
RUN npm install -g yarn

WORKDIR /ssa

COPY Gemfile.lock Gemfile package.json yarn.lock ./

RUN bundle install
RUN yarn install --check-files

ADD . /ssa

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]