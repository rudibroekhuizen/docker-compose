FROM golang

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN go get github.com/ajvb/kala
ENTRYPOINT kala run
EXPOSE 8000

# https://github.com/ajvb/kala/blob/master/Dockerfile
# https://github.com/thiagozs/rest-cron-docker/blob/master/Dockerfile
