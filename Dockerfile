FROM golang:1.24.1 AS builder

WORKDIR /app
COPY . .
RUN make build

#FROM scratch
#WORKDIR /app
#COPY --from=builder /app/kbot .
#RUN chmod +x ./kbot
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["/app/kbot"]