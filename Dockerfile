FROM ruby:2.4.0

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* /app/
RUN bundle install

COPY . /app

EXPOSE 80
CMD ["bundle", "exec", "shotgun", "--host", "0.0.0.0", "--port", "80"]
