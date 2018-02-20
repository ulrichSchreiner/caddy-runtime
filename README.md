# DISCONTINUED

please go to https://gitlab.com/ulrichSchreiner/caddy-docker for latest code

# caddy runtime

this is a runtime for the caddy server. it only works as a base image for another build which specifies the plugins you need.

note: this image creates a user and group named `caddy` which both uses 2002 as their id. If you mount local volumes, you can use these IDs or change them as they are builds args.
