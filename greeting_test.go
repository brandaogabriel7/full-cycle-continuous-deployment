package main

import "testing"

func TestGreeting(t *testing.T) {
	greetingString := "This is a unit test"
	expectedGreeting := "<b>This is a unit test</b>"

	receivedGreeting := greeting(greetingString)

	if receivedGreeting != expectedGreeting {
		t.Errorf("Greeting should be %s, but was %s", expectedGreeting, receivedGreeting)
	}
}