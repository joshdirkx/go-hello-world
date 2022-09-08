FROM golang:1.17-alpine

ADD . /go/src/backend
WORKDIR /go/src/backend
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN go build -o /backend

EXPOSE 8080

CMD [ "/backend" ]