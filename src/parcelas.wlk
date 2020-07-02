import plantas.*

class Parcela {
	var property ancho 
	var property largo
	var property horasDeSolRecibidas
	var plantas = []
	
	method agregarPlanta(planta) {plantas.addAll(planta)}
	method plantas() {return plantas}
	
	method superficie() {return}
}