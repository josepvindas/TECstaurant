FROM ruby:2.6.2-stretch

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

RUN gem update bundler

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

# Install gems
RUN bundle install

CMD ["bundle", "exec", "rails", "db:migrate"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]