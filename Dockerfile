FROM gliderlabs/alpine:latest

RUN apk-install \
  ca-certificates \
  ruby \
  ruby-bundler \
  ruby-dev \
  ruby-rdoc \
  ruby-irb \
  && gem install redis


RUN wget http://download.redis.io/redis-stable/src/redis-trib.rb && \
    mv redis-trib.rb /usr/bin/redis-trib && \
    chmod 777 /usr/bin/redis-trib

ENTRYPOINT ["/usr/bin/redis-trib"]
