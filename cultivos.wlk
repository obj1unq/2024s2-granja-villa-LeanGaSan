import wollok.game.*
import hector.*
import posiciones.*

class Maiz {
	var property position = game.at(1, 1)
	var property image = "corn_baby.png" 

	method efectoDeSerRegado() {
		image = "corn_adult.png"
	}

	method precioDeVenta() {
		return 150
	}
}

class Trigo {
	var property position = game.at(1, 1)
	var etapa = trigoNivel0
	
	method etapa(_etapa) {
		etapa = _etapa
	}

	method image() {
		return etapa.image()
	}

	method efectoDeSerRegado() {
		self.etapa(etapa.siguiente())
	}

	method precioDeVenta() {
		return etapa.valorDeVenta() 
	}

}

object trigoNivel0 {
	method image() {
		return "wheat_0.png"
	}

	method siguiente() {
		return trigoNivel1
	}

	method valorDeVenta() {
		return 0
	}
}

object trigoNivel1 {
	method image() {
		return "wheat_1.png"
	}

	method siguiente() {
		return trigoNivel2
	}

	method valorDeVenta() {
		return 0
	}
}

object trigoNivel2 {
	method image() {
		return "wheat_2.png"
	}

	method siguiente() {
		return trigoNivel3
	}

	method valorDeVenta() {
		return 100
	}
}

object trigoNivel3 {
	method image() {
		return "wheat_3.png"
	}

	method siguiente() {
		return trigoNivel0
	}

	method valorDeVenta() {
		return 200
	}
}

class Tomaco {
	var property position = game.at(1, 1)
	const property image = "tomaco.png"

	method efectoDeSerRegado() {
		if (self.estaEnBordeDeArriba()) { self.irAlBordeDeAbajo() } else { position.goUp(1) }
	}

	method estaEnBordeDeArriba() {
		return position.y() == game.height() - 1
	}

	method irAlBordeDeAbajo() {
		position = game.at(position.x(), 0)
	}

	method precioDeVenta() {
		return 80 
	}

}

