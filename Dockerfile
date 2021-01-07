FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/mypackage/myapp/
COPY . .

RUN go get -d -v

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/go-challenge

FROM scratch

COPY --from=builder /go/bin/go-challenge /go/bin/go-challenge

CMD ["/go/bin/go-challenge"]

EXPOSE 8080