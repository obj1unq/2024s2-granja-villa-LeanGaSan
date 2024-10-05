import wollok.game.*
import cultivos.* 
import posiciones.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	var property monedasAcumuladas = 0
<<<<<<< HEAD
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
=======
	const property plantasCosechadasActuales = [] 

	method mover(direccion) {
		position = direccion.siguiente(self.position())
	}

	method sembrar(planta) {

>>>>>>> 27735741c281bdc3c8f0fb8183383c74cb7c8ebb
	}

	method regar() {
		self.validarRegar()
		const planta = game.uniqueCollider(self)
<<<<<<< HEAD
		planta.efectoDeSerRegado()
	}

	method validarRegar() {
		if (not granja.hayCultivoEn(self.position())) {
=======
	}

	method validarRegar() {
		if (not ) {
>>>>>>> 27735741c281bdc3c8f0fb8183383c74cb7c8ebb
			self.error("No tengo nada para regar")
		}
	}

<<<<<<< HEAD
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

=======
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
>>>>>>> 27735741c281bdc3c8f0fb8183383c74cb7c8ebb
