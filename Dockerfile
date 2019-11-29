FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /ssa
WORKDIR /ssa
COPY Gemfile /ssa/Gemfile
COPY Gemfile.lock /ssa/Gemfile.lock
RUN bundle install
COPY . /ssa
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
