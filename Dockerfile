FROM ruby:3.1.2-alpine as builder

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

COPY Gemfile Gemfile.lock ${ROOT}

RUN apk add \
    alpine-sdk \
    build-base \
    sqlite-dev \
    postgresql-dev \
    tzdata \
    git

RUN gem install bundler
RUN bundle install
