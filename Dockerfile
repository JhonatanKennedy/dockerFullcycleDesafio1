FROM alpine AS build

RUN apk add --update --no-cache go

WORKDIR /app

COPY main.go /app

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=build  /app /app

ENTRYPOINT [ "./main" ]