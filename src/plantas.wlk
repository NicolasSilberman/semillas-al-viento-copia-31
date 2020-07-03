import parcelas.*

class Planta {
	var property anioDeObtencion
	var property altura
	
	method horasDeSolToleradas() {return 7}
	
	method esFuerte() {return self.horasDeSolToleradas() > 9 }
	
	method daNuevasSemillas() {return self.esFuerte()}
	
	method espacioOcupado()
	
	method parcelaIdeal(unaParcela)
}

class Menta inherits Planta {
	
	override method espacioOcupado() {return self.altura() + 1}
	override method daNuevasSemillas() {return super() or self.espacioOcupado() > 1.5}
	override method parcelaIdeal(unaParcela) {return unaParcela.superficie() > 6}
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
	override method daNuevasSemillas() {return super() or self.anioDeObtencion() > 2007
		and self.altura().between(0.75,0.9)
	}
	override method parcelaIdeal(unaParcela) {return self.horasDeSolToleradas() == unaParcela.horasDeSolRecibidas()}	
}

class Quinoa inherits Planta {
	var property espacioOcupado
	
	override method horasDeSolToleradas() {
		if(self.espacioOcupado() >= 0.3) {return super()}
		else {return 10}
	}
	
	override method daNuevasSemillas() {return super() or self.anioDeObtencion().between(2001,2008)}
	override method parcelaIdeal(unaParcela) {return unaParcela.alturaMaxima() <= 1.5 }
}

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() {return false}
	override method parcelaIdeal(unaParcela) {return unaParcela.cantidadDePlantasToleradas() == 1}
}

class Peperina inherits Menta {
	
	override method espacioOcupado() {return super() * 2}
}