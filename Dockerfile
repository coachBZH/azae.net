from tclavier/nginx
run apt-get update && apt-get install -y jekyll && apt-get clean 
add . /site
workdir /site
run jekyll build --destination /var/www
add _src/nginx_vhost.conf /etc/nginx/conf.d/azae.conf
