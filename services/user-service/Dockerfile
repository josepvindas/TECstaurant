# Run from Ruby Version 2.5
FROM ruby:2.5
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/service/

COPY . .

CMD ["sudo ./service.rb"]