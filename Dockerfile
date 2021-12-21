# get racket as the build environment
FROM racket/racket AS build-env

# add all the files from current dir to /app in container
ADD . /app 

# set working dir 
WORKDIR /app

# 1. get the compiler lib for exe and distribute commands. See https://hub.docker.com/r/racket/racket
# 2. create web server package
# 3. create an executable w/ the run.rkt file
# 4. create a distribution w/ the executable (this is so the runtime env doesn't need racket installed)
RUN raco pkg install --auto compiler-lib ./demo-web-server && raco exe run.rkt && raco distribute dist run

# use archlinux as runtime env
FROM archlinux/archlinux

# copy exe to runtime env we only need the built
COPY --from=build-env /app/dist /app

# set working directory to the distribution bin
WORKDIR /app/bin

# expose 8081
EXPOSE 8081

# run the server
CMD ["./run"] 