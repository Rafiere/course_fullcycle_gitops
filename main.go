package main

import (
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, err := w.Write([]byte("<h1>Hello Full Cycle</h1>"))
		if err != nil {
			log.Println("Um erro ocorreu ao acessar o endereço '/'.")
		}
	})

	err := http.ListenAndServe(":8085", nil)
	if err != nil {
		log.Println("Um erro ocorreu ao inicializar o servidor.")
	}
}
