FROM ruby:2.6-alpine3.10

RUN gem install aws-sdk-ecs

COPY restarter.rb /

CMD ["ruby", "restarter.rb"]
