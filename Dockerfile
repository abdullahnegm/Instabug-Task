FROM golang:alpine as builder

RUN mkdir /build

WORKDIR /build

COPY GoViolin/ ./

RUN go mod init && go build

FROM alpine

RUN mkdir -p /app/

COPY --from=builder /build/ /app/

WORKDIR /app

EXPOSE 8080

CMD ["./GoViolin"]
