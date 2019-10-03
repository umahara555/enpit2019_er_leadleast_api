FROM ruby:2.6.4
ENV LANG C.UTF-8

RUN apt-get update -qq \
 && apt-get install -y \
    build-essential \
    nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install

COPY . $APP_HOME

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
