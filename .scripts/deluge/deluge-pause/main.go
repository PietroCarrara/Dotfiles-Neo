package main

import (
	"flag"

	"github.com/PietroCarrara/flood"
)

func fail(err error) {
	if err != nil {
		panic(err)
	}
}

var (
	addr     = flag.String("addr", "localhost:58846", "IP and port of the deluge server")
	username = flag.String("user", "localclient", "username of the deluge user")
	password = flag.String("pass", "", "password of the deluge user")
)

func main() {
	flag.Parse()

	f, err := flood.New(*addr)
	fail(err)

	_, err = f.Login(*username, *password)
	fail(err)

	if flag.Arg(0) == "play" {
		fail(f.Core.PauseSession())
	} else {
		fail(f.Core.ResumeSession())
	}
}
