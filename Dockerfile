FROM tclavier/nginx

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y -q \
    bundler \
    ruby \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/site
WORKDIR /tmp/site
COPY Gemfile /tmp/site
COPY Gemfile.lock /tmp/site
RUN bundle install --system --quiet

COPY . /tmp/site
RUN jekyll build --destination /var/www \
 && rm -rf /tmp/site

COPY _src/nginx_vhost.conf /etc/nginx/conf.d/azae.conf

WORKDIR /var/www
