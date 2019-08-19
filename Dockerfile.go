FROM golang:1.12.0-alpine3.9

RUN mkdir /mainApp

ADD . /mainApp

WORKDIR /mainApp

RUN go build -o main .

CMD ["/mainApp/main"]
