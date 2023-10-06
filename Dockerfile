FROM ruby:3.1.2-alpine

ENV BUNDLER_VERSION=2.2.27

RUN apk --update add --no-cache build-base \
                                postgresql-dev \
                                postgresql-client \
                                libxml2-dev \
                                libxslt-dev \
                                libpq-dev \
                                libffi-dev \
                                tzdata
RUN gem install bundler -v "$BUNDLER_VERSION"

WORKDIR /app

COPY Gemfile* ./

RUN bundle check || bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
