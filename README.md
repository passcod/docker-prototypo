# Prototypo on Docker

_Experimental deployment of [Prototypo] on Docker._

[Prototypo]: http://prototypo.io

## Process

```bash
# Get the docker image
$ docker pull passcod/prototypo

# Create a folder to persist the couchdb data
$ mkdir /path/to/data/folder

# Use the :init tag to initialise that folder
# You'll need to enter a password for the admin
# interface. When that's done, hit Ctrl-C.
$ docker run -itv /path/to/data/folder:/var/lib/couchdb passcod/prototypo:init

# Launch the actual app!
$ docker run -v /path/to/data/folder:/var/lib/couchdb passcod/prototypo

# Look at the deets:
$ docker ps
$ docker inspect container_name
```

Now you should be able to connect to the container. Ports are:

- 9000 for the main Prototypo app
- 6002 for the Hoodie admin dash
- 9001 for the Hoodie API (+cors)

Connect to the Hoodie admin dash, add a new user, and use those credentials
to log in to Prototypo.

Happy font creating!
