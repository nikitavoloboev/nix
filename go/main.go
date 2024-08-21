package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Please provide a name as an argument")
		os.Exit(1)
	}
	name := os.Args[1]
	fmt.Printf("Hello, %s! Welcome to the world of Nix and Go.\n", name)
}
