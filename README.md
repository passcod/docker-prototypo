# Prototypo on Docker

_Experimental deployment of [Prototypo] on Docker._

[Prototypo]: http://prototypo.io

## Process

```bash
# Get the docker image
$ docker pull passcod/prototypo

# Create a folder to persist the couchdb data
$ mkdir /path/to/data

# Launch it. You'll have to enter a password
# for the Hoodie Admin dashboard.
$ docker run -itv /path/to/data:/var/lib/couchdb passcod/prototypo
```

Now you should be able to connect to the container. Ports are:

- 9000 for the main Prototypo app
- 6002 for the Hoodie admin dash
- 9001 for the Hoodie API (+cors)

Find out the address using:

```bash
$ docker ps
$ docker inspect container_name | grep IPAddress
```

Connect to the Hoodie admin dash with the password you typed in,
add a new user, and use those credentials to log in to Prototypo.

Happy font creating!
