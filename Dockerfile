FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /Todo_List
WORKDIR /Todo_List
COPY Gemfile /Todo_List/Gemfile
COPY Gemfile.lock /Todo_List/Gemfile.lock
RUN bundle install
COPY . /Todo_List

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]