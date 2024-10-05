import wollok.game.*
import hector.*
import posiciones.*

class Maiz {
	var property position = game.at(1, 1)
	var property image = "corn_baby.png" 

	method esCultivo() = true

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

	method esCultivo() = true
	
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

	method estaParaSerCosechada() {
		return etapa.puedeSerCosechado()
	}

}

object trigoNivel0 {
	method image() {
		return "wheat_0.png"
	}

	method esCultivo() = true

	method siguiente() {
		return trigoNivel1
	}

	method puedeSerCosechado() = false

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

	method puedeSerCosechado() = false

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

	method puedeSerCosechado() = true

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

	method puedeSerCosechado() = true

}

class Tomaco {
	var property position = game.at(1, 1)
	const property image = "tomaco.png"

	method esCultivo() = true

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

	method estaParaSerCosechada() = true

}

object granja {
    const property cultivos = []

    method validarDentro(position) {
        if (not self.estaDentro(position)) {
            self.error("No puedo moverme fuera del terreno")
        }
    }

    method estaDentro(position) {
        return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1) 
    }

	method agregarCultivo(cultivo) {
		cultivos.add(cultivo)
	}
	
    method hayCultivoEn(position) {
        return self.objetosEn(position).filter({cosa => cosa.esCultivo()})
    }
    
    method objetosEn(position) {
        return game.getObjectsIn(position)
    }
} 