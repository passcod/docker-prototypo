#> Prototypo - Streamlined font creation
#? https://github.com/passcod/docker-prototypo
FROM passcod/archlinux
MAINTAINER Félix Saparelli me@passcod.name

RUN pacman -S --noconfirm nodejs git couchdb &&\
pacman -Scc --noconfirm &&\
rm -rf /var/cache/pacman/pkg/*

# Utils
RUN npm install -g adhoc-cors-proxy bower grunt-cli hoodie-cli

# Hoodie
ENV COUCH_URL http://localhost:5984
VOLUME /var/lib/couchdb
RUN /usr/bin/hoodie new bonnet

# Prototypo
RUN git clone --depth=1 git://github.com/byte-foundry/prototypo.git /app
WORKDIR /app
RUN npm install
RUN /usr/bin/bower --allow-root install

# Use our own Hoodie server
RUN sed -i 's|http://prototypo.cloudapp.net|http://localhost:9001|' /app/app/scripts/app.js

# 9000: Prototypo, 6002: Hoodie Dash, 9001: Hoodie API
EXPOSE 9000 6002 9001
ADD start /
CMD /start
