package main

import (
 "os"
 "fmt"
 _ "github.com/philips-software/go-hsdp-api/config"
)


func main() {
  fmt.Printf("%s\n", os.Getenv("LOG"))
  return
}

