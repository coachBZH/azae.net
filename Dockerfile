FROM tclavier/nginx

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y -q \
    bundler \
    ruby \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /site
WORKDIR /site
COPY Gemfile /site/
COPY Gemfile.lock /site/
RUN bundle install --system --quiet

COPY . /site/
RUN jekyll build --destination /var/www

COPY _src/nginx_vhost.conf /etc/nginx/conf.d/azae.conf

WORKDIR /var/www
