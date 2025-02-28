package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Printf("Starting server on :8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {

		fmt.Println("Server failed to start:", err)
	}
}
