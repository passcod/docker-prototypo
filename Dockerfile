#> Prototypo - Stramlined font creation, on the web.
#? https://github.com/passcod/docker-prototypo
FROM passcod/archlinux
MAINTAINER Félix Saparelli me@passcod.name

RUN pacman -S --noconfirm nodejs git &&\
  pacman -Scc --noconfirm &&\
  rm -rf /var/cache/pacman/pkg/*
RUN npm install -g grunt-cli bower

RUN git clone --depth=1 git://github.com/byte-foundry/prototypo.git /app
WORKDIR /app
RUN npm install
RUN /usr/bin/bower --allow-root install

EXPOSE 9000
CMD ["/usr/bin/grunt", "serve"]
