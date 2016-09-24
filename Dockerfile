FROM ruby:2.2


WORKDIR /app

ADD Gemfile /app
ADD Gemfile.lock /app

RUN bundle install --path vendor/bundle

COPY . /app

ENV RACK_ENV production

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "doneist.rb"]
