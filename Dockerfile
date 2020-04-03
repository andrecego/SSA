FROM ruby:2.6.5-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler --version 2.1.4

ENV PHANTOMJS_VERSION 2.1.1
RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN tar -jxvf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs
RUN mv phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && rm -rf phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin
RUN chmod 755 /usr/local/bin/phantomjs

RUN mkdir /ssa
RUN npm install -g yarn

WORKDIR /ssa

COPY Gemfile.lock Gemfile package.json yarn.lock ./

RUN bundle install
RUN yarn install --check-files

ADD . /ssa

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]