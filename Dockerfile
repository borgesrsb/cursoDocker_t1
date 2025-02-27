FROM golang:1.24 AS builder

WORKDIR /app
COPY main.go .

RUN go build -ldflags="-s -w" -o app main.go

FROM scratch

WORKDIR /root/
COPY --from=builder /app/app .
CMD ["./app"]
