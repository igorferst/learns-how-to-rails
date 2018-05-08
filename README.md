Igor learns how to Rails.

## How to use dockerized Rails

### Setuping up a new project

A dockerized Rails project requires the following files:

```
* Dockerfile
* docker-compose.yaml
* entrypoint.sh
* Gemfile (empty)
* Gemfile.lock (empty)
```

In `docker-compose.yaml`, modify the container name to be your app name and the directory name in
`volumes` to end with your app name (e.g. `/usr/src/my-app`). Also modify this directory in the `Dockerfile`.

Once all of these files are in place, create a new project with

```
docker-compose run --entrypoint='' -w /usr/src/ [app name] rails new [app name]
```

Do not overwrite `README.md`, but do overwrite `Gemfile`.

Finally, after creating the app, rebuild the container with `docker-compose build`.

## Commands

To start the server (after creating a new app with `rails new`) simply run `docker-compose up`.

After the server is app, you can execute arbitrary commands inside the app container with

```
docker-compose exec depot [command]
```
