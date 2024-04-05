FROM golang:alpine3.19 as builder

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app app.go

FROM scratch

COPY --from=builder /app /app

EXPOSE 8080

CMD ["/app"]