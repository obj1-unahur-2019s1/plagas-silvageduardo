class Plaga { //super clase

	var property poblacion = 0
	var property pesoPromedio = 8

	method transmiteEnfermedades() {
		return poblacion >= 10
	}

	method atacar(elemento) {
		poblacion *= 1.10
		elemento.ataqueDePlaga(self)
	}

}

class Cucarachas inherits Plaga { // sub clase

	method nivelDanio() {
		return poblacion / 2
	}

	/*obligatorio poner override si repito en la subclase un metodo en la superclase */
	override method transmiteEnfermedades() {
		return pesoPromedio >= 10 and super() // llama a lo que ya esta definido
	}

	override method atacar(elemento) {
		pesoPromedio += 2
		super(elemento)
	}

}

class Pulgas inherits Plaga { // sub clase

	method nivelDanio() {
		return poblacion * 2
	}

}

class Garrapatas inherits Plaga { // sub clase

	method nivelDanio() {
		return poblacion * 2
	}

}

class Mosquito inherits Plaga { // sub clase

	method nivelDanio() {
		return poblacion
	}

	/*obligatorio poner override si repito en la subclase un metodo en la superclase */
	override method transmiteEnfermedades() {
		return poblacion % 3 == 0 and super() // llama a lo que ya esta definido
	}

}

