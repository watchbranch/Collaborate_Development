FROM mcr.microsoft.com/devcontainers/ruby:3.2

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
COPY . ./ 
RUN chmod +x ./entrypoints/docker-entrypoint.sh
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
