import paciente.*

class Aparato{
 var color = blanco

 method color() = color

 method cambiarColor(c) {color = c}

 method necesitaMantenimiento() 
 

}

// COLORES
object rojo{}
object blanco{}
object verde{}
///// 
class Magneto inherits Aparato{

  var imantacion = 800
  method sumarImantacion(c) {imantacion += c}
  method restaraImantacion(c) {imantacion -= c}
  method efecto(paciente){paciente.modificarDolor(paciente.nivelDolor() * 0.1)
                             self.restaraImantacion(1)}

  method loPuedeUsar(p) = true
  override method necesitaMantenimiento() = imantacion < 100
  method hacerleMantenimiento(){self.sumarImantacion(500)}

}

class Bicicleta inherits Aparato{

 var desajusteDeTornillos = 0
 var cantVecesPierdeAceite = 0

 method efecto(paciente){if (self.loPuedeUsar(paciente)){paciente.modificarDolor(4) paciente.modificarFuerzaMuscular(3)}
                         if(paciente.nivelDolor() > 30){desajusteDeTornillos += 1}{if (paciente.edad().between(30, 50)){cantVecesPierdeAceite += 1}}                                                                                          }


 method loPuedeUsar(p) = p.edad() > 8
 override method necesitaMantenimiento() = desajusteDeTornillos >= 10 or cantVecesPierdeAceite >= 5
 method hacerleMantenimiento(){desajusteDeTornillos = 0
                               cantVecesPierdeAceite = 0}
 

}
class Minitramp inherits Aparato{
  method efecto(paciente){if(self.loPuedeUsar(paciente)){paciente.modificarFuerzaMuscular(paciente.edad()*0.1)}}
  method loPuedeUsar(p) = p.nivelDolor() < 20 

override method necesitaMantenimiento() = false
method hacerleMantenimiento(){} 

}

