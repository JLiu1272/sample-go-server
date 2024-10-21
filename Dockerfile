# First stage: Build the application
FROM golang:1.23-alpine AS builder 

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files and download dependencies
COPY go.mod ./ 
RUN go mod download

# Copy the rest of the application code
COPY . . 

# Build the Go application
RUN go build -o server .

# Second stage: Run the application
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app/server .

# Expose the port the server will run on
EXPOSE 8080

# Command to run the server
CMD [ "./server" ]