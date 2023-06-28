package main

import (
 "os"
 "fmt"
)


func main() {
  fmt.Printf("%s\n", os.Getenv("LOG"))
  return
}

