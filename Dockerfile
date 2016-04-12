FROM ruby:2.3
MAINTAINER Rich Daley <rich@fishpercolator.co.uk>
ENV REFRESHED_AT 2016-04-12

RUN adduser --uid 1001 --disabled-password --gecos "" rails

RUN gem install bundler

ENV APP_HOME /usr/src/wardmill
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN bundle install

ENV RAILS_ENV       production
ENV DOMAIN_NAME     localhost
# NOTE: ALWAYS override this or your sessions will be insecure!
ENV SECRET_KEY_BASE b748a82bfcf51272fdebc435accdba93044de4106e425bdaa2abf65bf4d9747c2add5c8ae724cd73be70efd6c1305a68bdb7683447ac64aad05a775c97345ad5

ADD . $APP_HOME

RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
