import wollok.game.*
import cultivos.* 
import posiciones.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	var property monedasAcumuladas = 0
	const property plantasCosechadasActuales = [] 

	method mover(direccion) {
		position = direccion.siguiente(self.position())
	}

	method sembrar(planta) {

	}

	method regar() {
		self.validarRegar()
		const planta = game.uniqueCollider(self)
	}

	method validarRegar() {
		if (not ) {
			self.error("No tengo nada para regar")
		}
	}

	method cosechar(planta) {
		plantasCosechadasActuales.add(planta)
	}

	method cosecharAhi() {
		const planta = game.uniqueCollider(self)
		self.cosecharVisual(planta)
	}

	method cosecharVisual(planta) {
		self.cosechar(planta)
		game.removeVisual(planta)
	}
}

object granja {
	
}
