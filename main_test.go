package main

import "testing"

func TestHelloWorld(t *testing.T) {
	if helloworld() != "Hello, Go examples!" {
		t.Fatal("Test fail")
	}
}
