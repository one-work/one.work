FROM ccr.ccs.tencentyun.com/kamal/ruby:3.4.1 AS base

# Rails App 所在位置
WORKDIR /rails
ENV RAILS_ENV='production' BUNDLE_PATH='/usr/local/bundle' BUNDLE_DEPLOYMENT='1' BUNDLE_WITHOUT='development'

FROM base AS build
RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.ustc.edu.cn/alpine#g' /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache build-base libpq-dev gcompat git

# 安装 Ruby 依赖
COPY Gemfile Gemfile.lock ./
COPY vendor/package engine
#RUN bundle config mirror.https://rubygems.org https://mirrors.ustc.edu.cn/rubygems/
RUN bundle install && rm -rf ~/.bundle/ ${BUNDLE_PATH}/ruby/*/cache ${BUNDLE_PATH}/ruby/*/bundler/gems/*/.git

COPY . .

FROM base
RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.ustc.edu.cn/alpine#g' /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache curl libgit2 poppler-glib vips tzdata libpq-dev fish postgresql17-client git openssh docker-cli docker-cli-buildx gcompat
RUN git config --global protocol.file.allow always
RUN git config --global init.defaultBranch main

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN chmod +x deploy/entrypoint_rails.sh

EXPOSE 3000

CMD ["deploy/entrypoint_rails.sh"]
