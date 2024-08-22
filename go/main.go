package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", greetHandler)

	port := "8080"
	fmt.Printf("Server starting on port %s...\n", port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}
}

func greetHandler(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	if name == "" {
		name = "Guest"
	}
	greeting := fmt.Sprintf("Hello, %s! Welcome to the world of Nix and Go.", name)
	fmt.Fprint(w, greeting)
}
