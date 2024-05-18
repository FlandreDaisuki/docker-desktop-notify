# docker-desktop-notify

## setup

Build image:

```sh
docker build . -t docker-desktop-notify
```

Run daemon:

```sh
docker run -d \
  --name docker-desktop-notify \
  -e DISPLAY="${DISPLAY}" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  docker-desktop-notify
```

Notify:

```sh
docker exec docker-desktop-notify notify-send "Hello" "$(whoami)"
```
