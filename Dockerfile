#> Prototypo - Streamlined font creation, on the web.
#? https://github.com/passcod/docker-prototypo
FROM passcod/prototypo:base
MAINTAINER Félix Saparelli me@passcod.name

# Utils
RUN npm install -g adhoc-cors-proxy bower grunt-cli

# Prototypo
RUN git clone --depth=1 git://github.com/byte-foundry/prototypo.git /app
WORKDIR /app
RUN npm install
RUN /usr/bin/bower --allow-root install

# Use our own Hoodie server
RUN sed -i 's|http://prototypo.cloudapp.net|http://localhost:9001|' /app/app/scripts/app.js

# 9000: Prototypo, 6002: Hoodie Dash, 9001: Hoodie API
EXPOSE 9000 6002 9001
ADD start /app/
CMD /app/start
