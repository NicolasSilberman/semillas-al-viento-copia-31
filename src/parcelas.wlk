import plantas.*

class Parcela {
	var property ancho 
	var property largo
	var property horasDeSolRecibidas
	var plantas = []
	
	method plantarPlanta(planta) {
		if(self.cantidadDePlantas() < self.cantidadDePlantasToleradas() 
			or (self.horasDeSolRecibidas() - planta.horasDeSolToleradas()) >= 2) 
		{plantas.add(planta)}
		else {self.error("supera la cantidad permitida o la parcela recibe mas horas de sol")}
	}
	method plantas() {return plantas}
	
	method superficie() {return self.ancho() * self.largo()}
	
	method cantidadDePlantasToleradas() {
		if(self.largo() > 3) {return self.largo() + 4}
		else {return self.superficie() / 2}
	}
	
	method tieneComplicaciones() {return plantas.any({p => p.horasDeSolToleradas() < self.horasDeSolRecibidas()})}
	
	method alturaMaxima() {return plantas.max({p=>p.altura()}).altura()}
	
	method cantidadDePlantas() {return plantas.size()}
	
	method seAsociaBien(unaPlanta)
	
	method porcentajeBienAsociadas() {
		return (plantas.count({p => self.seAsociaBien(p)}) * 100) / self.cantidadDePlantas()
	}
	
}

class ParcelaEcologica inherits Parcela {
	
	override method seAsociaBien(unaPlanta) {return not self.tieneComplicaciones() and
		unaPlanta.parcelaIdeal(self)
	}
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(unaPlanta) {return self.cantidadDePlantas() <= 2 and unaPlanta.esFuerte()}
}

object inta {
	var parcelas = []
	
	method agregarParcela(parcela) {parcelas.addAll(parcela)}
	method parcelas() {return parcelas}
	
	method promedioPlantas() {
		return parcelas.sum({p => p.cantidadDePlantas()}) / parcelas.size()
	}
	
	method masAutosustentable() {
		var superanLaCantidad = parcelas.filter({p=> p.cantidadDePlantas() > 4})
		return superanLaCantidad.max()
	}
}