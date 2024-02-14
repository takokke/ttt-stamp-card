# イメージ
# アプリのrubyバージョンを指定する
FROM ruby:3.2.1-alpine

# インストールするdependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache gcompat && \
    apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git bash && \
    apk add --virtual build-packages --no-cache build-base curl-dev
RUN mkdir /rails_app

# ディレクトリを作成する
WORKDIR /rails_app


# gemのインストール
ADD Gemfile /rails_app/Gemfile
ADD Gemfile.lock /rails_app/Gemfile.lock


RUN bundle install
RUN apk del build-packages
ADD . /rails_app

# ポート番号の設定
EXPOSE 3000
CMD ["./bin/rails", "server"]