# https://github.com/rotati/rails-docker-kubernetes-ECS-example/blob/master/Dockerfile

FROM phusion/passenger-ruby27:latest

ENV HOME /root

CMD ["/sbin/my_init"]

# focal Release' does not have a Release file. が出るためcertを更新する
# https://github.com/phusion/passenger-docker/issues/325#issuecomment-934482664
RUN mv /etc/apt/sources.list.d /etc/apt/sources.list.d.bak
RUN apt update && apt install -y ca-certificates
RUN mv /etc/apt/sources.list.d.bak /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confold" netcat

RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# Install gems: it's better to build an independent layer for the gems
# so they are cached during builds unless Gemfile changes
WORKDIR /tmp

ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN gem update --system
RUN bundle install

COPY . /home/app/webapp
RUN usermod -u 1000 app
RUN chown -R app:app /home/app/webapp
WORKDIR /home/app/webapp

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
