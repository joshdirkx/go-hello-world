FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o backend

FROM alpine:latest

WORKDIR /

COPY --from=builder /app/backend /backend

EXPOSE 8080

CMD [ "/backend" ]

