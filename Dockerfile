FROM golang:1.21.1-alpine3.18 as builder
RUN apk add --no-cache git openssh gcc musl-dev
WORKDIR /src
COPY go.mod .
COPY go.sum .

# Get dependancies - will also be cached if we won't change mod/sum
RUN go mod download

# Build
COPY . .
RUN go build -o app .

FROM ghcr.io/philips-labs/siderite:v0.16.6 AS siderite

FROM alpine:latest
RUN apk add --no-cache git openssh openssl bash postgresql-client
WORKDIR /app
COPY --from=siderite /app/siderite /app/siderite
COPY --from=builder /src/app /app

CMD ["/app/siderite","task"]
