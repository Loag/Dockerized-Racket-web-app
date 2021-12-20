# Dockerized Racket web app
  An example Racket web app Docker container. 


## includes:
  - Web app as a package to manage dependencies.
  - builder/distribution Dockerfile build process (dist on arch linux)
  - production distribution build of racket app
  - Make for convenience.

## Usage:

  - Build the container
  ```bash
    make build 
  ```
 
 - Run the container on local port 8081
 ```bash
   make run-cont
 ```

## Keep in mind:
  - Racket docs are unclear on (to me at least) if this is the correct use of packages for an application/executable.
  - Server has to be run on a non default ip (loopback address). Running on the default ip returns "The connection was reset" error [See this question for reference](https://coderedirect.com/questions/569393/connection-reset-by-peer-when-when-hitting-docker-container).
