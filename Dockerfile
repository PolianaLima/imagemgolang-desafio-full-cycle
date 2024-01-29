FROM golang:latest AS builder

WORKDIR /go/src/app

COPY main.go .
RUN go mod init polianaLima/main


FROM golang:alpine3.19

WORKDIR /go/src/app

COPY --from=builder /go/src/app .


EXPOSE 8080

CMD [ "go", "run","main.go" ]



