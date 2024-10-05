import wollok.game.*
object arriba {
    method siguiente(position) {
        return position.up(1)
    }
}

object abajo {
    method siguiente(position) {
        return position.down(1)
    }
}

object izquierda {
    method siguiente(position) {
        return position.left(1)
    }
}

object derecha {
    method siguiente(position) {
        return position.right(1)
    }
}

object granja {
    
    method validarDentro(position) {
        if (not self.estaDentro(position)) {
            self.error("No puedo moverme fuera del terreno")
        }
    }

    method estaDentro(position) {
        return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1) 
    }

    method hayCultivo(position) {
        return game.getObjectsIn(position).filter({obj => cultivos.contains(obj)})
    }

    method objetosEn(posicion) {

    }
}