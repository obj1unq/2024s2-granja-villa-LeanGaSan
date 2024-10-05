import wollok.game.*
import hector.*
import posiciones.*

class Maiz {
	var property position = game.at(1, 1)
	var property image = "corn_baby.png" 

	method efectoDeSerRegado() {}

}

class Trigo {
	var property position = game.at(1, 1)
	var estado = trigoNivel0
	
	method estado(_estado) {
		estado = _estado
	}

	method image() {
		return estado.image()
	}

	method efectoDeSerRegado() {}

}

object trigoNivel0 {
	method image() {
		return "wheat_0.png"
	}
}

class Tomaco {
	var property position = game.at(1, 1)
	const property image = "tomaco.png"

	method efectoDeSerRegado() {}
}
