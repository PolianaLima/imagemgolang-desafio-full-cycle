FROM golang AS builder

WORKDIR /go/src/app

COPY main.go .
RUN go mod init polianaLima/main
RUN go build -o /go/src/app/main

FROM scratch

COPY --from=builder /go/src/app/main /go/src/app/main

CMD ["/go/src/app/main"]