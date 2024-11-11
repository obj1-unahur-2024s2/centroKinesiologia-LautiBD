import paciente.*
import aparatos.*

object kinesiologia{

 const property aparatos = []
 const property clientes  = []

 method agregarAparato(a){aparatos.add(a)}
 method agregarCliente(c){clientes.add(c)}

 
 method coloresDeAparatos() = aparatos.map({a => a.color()}).asSet()
 method pacientesMenoresAOcho() = clientes.filter({c => c.edad() < 8})
 method cantidadPacientesQueNoPuedenHacerRutina() = clientes.count({c => not c.puedoHacerRutina()})

 method estaEnOptimasCondiciones() = aparatos.all({a => not a.necesitaMantenimiento()})
 method cantidadDeAparatos() = aparatos.size()
 method estaComplicado() = aparatos.count({a => a.necesitaMantenimiento()}) >= self.cantidadDeAparatos() / 2
 method visitaDelTecnico() = aparatos.forEach({a => a.hacerleMantenimiento()})

}