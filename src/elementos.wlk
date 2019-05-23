
import plagas.*

object cfgProduccion {

	var property nivelProduccion = 15

}

class Hogar {

	var property nivelDeMugre = 0
	var property confort = 0

	method esBueno() {
		return (nivelDeMugre / 2) <= confort
	}

	method ataqueDePlaga(plaga) {
		nivelDeMugre += plaga.nivelDanio()
	}

}

class Huerta {

	var property capacidadProduccion = 0

	method esBueno() {
		return capacidadProduccion > cfgProduccion.nivelProduccion()
	}

	method ataqueDePlaga(plaga) {
		if (plaga.transmitieEnfermedades()) {
			capacidadProduccion = (capacidadProduccion * (0.90) - 10).max(0)
		} else {
			capacidadProduccion *= 0.90
		}
	}

}

class Mascota {

	var property nivelSalud = 0

	method esBueno() {
		return nivelSalud > 250
	}

	method ataqueDePlaga(plaga) {
		if (plaga.transmitieEnfermedades()) {
			nivelSalud = (nivelSalud - plaga.nivelDanio()).max(0)
		}
	}

}

class Barrios {

	var property elementos = []

	method agregarElemento(elemento) {
		elementos.add(elemento)
	}

	method esCopado() {
		return elementos.count({ elemento => elemento.esBueno() }) > elementos.count({ elemento => not elemento.esBueno() })
	}

}

