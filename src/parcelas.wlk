import plantas.*

class Parcela {
	var property ancho 
	var property largo
	var property horasDeSolRecibidas
	var plantas = []
	
	method plantarPlanta(planta) {
		if(plantas.size() < self.cantidadDePlantasToleradas() 
			and (self.horasDeSolRecibidas() - planta.horasDeSolToleradas()) >= 2) 
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
}