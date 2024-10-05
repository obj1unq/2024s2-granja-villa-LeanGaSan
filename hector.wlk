import wollok.game.*
import cultivos.* 
import posiciones.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	var property monedasAcumuladas = 0
	const property cultivosCosechadosActuales = [] 

	method mover(direccion) {
		self.validarMover(direccion)
		self.desplazar(direccion)
	}

	method validarMover(direccion) {
		const siguiente = direccion.siguiente(self.position())
		granja.validarDentro(siguiente)
	}

	method desplazar(direccion) {
		self.validarMover(direccion)
		position = direccion.siguiente(self.position())
	}

	method sembrar(cultivo) {
		cultivo.position(self.position())
		game.addVisual(cultivo)
	}

	method regar() {
		self.validarRegar()
		const planta = game.uniqueCollider(self)
		planta.efectoDeSerRegado()
	}

	method validarRegar() {
		if (not granja.hayCultivoEn(self.position())) {
			self.error("No tengo nada para regar")
		}
	}

	method cosechar(cultivo) {
		cultivosCosechadosActuales.add(cultivo)
	}

	method cosecharAhi() {
		const cultivo = game.uniqueCollider(self)
		self.cosecharVisual(cultivo)
	}

	method cosecharVisual(cultivo) {
		self.cosechar(cultivo)
		game.removeVisual(cultivo)
	}

	method vender() {
		monedasAcumuladas += self.precioDeLoCosechado()
		cultivosCosechadosActuales.clear()
	}

	method precioDeLoCosechado() {
		return cultivosCosechadosActuales.sum({cultivo => cultivo.precioDeVenta()})
	}
}
