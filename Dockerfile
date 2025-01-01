FROM mcr.microsoft.com/devcontainers/ruby:3.2

# RUN apt update && apt upgrade \
#     binutils-gold \
#     build-base \
#     curl \
#     file \
#     g++ \
#     gcc \
#     git \
#     less \
#     libstdc++ \
#     libffi-dev \
#     libc-dev \ 
#     linux-headers \
#     libxml2-dev \
#     libxslt-dev \
#     libgcrypt-dev \
#     make \
#     netcat-openbsd \
#     nodejs \
#     openssl \
#     pkgconfig \
#     postgresql-dev \
#     python \
#     tzdata \
#     yarn 
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
COPY . ./ 
RUN chmod +x ./entrypoints/docker-entrypoint.sh
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
