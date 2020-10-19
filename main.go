package main

import (
	"fmt"

	"github.com/golang/example/stringutil"
)

func helloworld() string {
	return stringutil.Reverse("!selpmaxe oG ,olleH")
}

func main() {
	fmt.Println(helloworld())
}
