class Planta {
	var property anioDeObtencion
	var property altura
	
	method horasDeSolToleradas() {return 7}
	
	method esFuerte() {return self.horasDeSolToleradas() > 9 }
	
	method daNuevasSemillas() {return self.esFuerte()}
	
	method espacioOcupado()
}

class Menta inherits Planta {
	
	override method espacioOcupado() {return self.altura() + 1}
	override method daNuevasSemillas() {return super() and self.espacioOcupado() > 1.5}
}

class Soja inherits Planta {
	
	override method horasDeSolToleradas() {
		if(self.altura() < 0.5) {return 6}
		else { 
			if(self.altura() <= 1) {return 8}
			else {return 12}
		}
	}
	
	override method espacioOcupado() {return self.altura() / 2}
	override method daNuevasSemillas() {return super() and self.anioDeObtencion() > 2007
		and self.altura().between(0.75,0.9)
	}	
}

class Quinoa inherits Planta {
	
	override method horasDeSolToleradas() {
		if(self.espacioOcupado() >= 0.3) {return super()}
		else {return 10}
	}
	
	override method espacioOcupado(espacio) {return espacio}
	override method daNuevasSemillas() {return super() and self.anioDeObtencion().between(2001,2008)}
}