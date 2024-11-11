import aparatos.*

class Paciente{

  var edad 
  var fuerzaMuscular
  var nivelDolor
  const rutina = []


  method edad() = edad
  method nivelDolor() = nivelDolor
  method fuerzaMuscular() = fuerzaMuscular
  method usarAparato(aparato) = aparato.efecto(self)
  
  // MODIFICACIONES
  method modificarDolor(c){nivelDolor -= c}
  method modificarFuerzaMuscular(c){fuerzaMuscular += c}
  method puedoUsar(aparato) = aparato.loPuedeUsar(self)


  method agregarALaRutina(aparato){rutina.add(aparato)}

  method puedoHacerRutina() = rutina.all({a => a.loPuedeUsar(self)})

  method hacerRutina(){
        if(self.puedoHacerRutina()){rutina.forEach({a => a.efecto(self)})}
  }
  method cantidadDeAparatos() = rutina.size()



}

class Resistente inherits Paciente{

  override method hacerRutina(){
    super()
    self.modificarFuerzaMuscular(1 * self.cantidadDeAparatos())
  }
}

class Caprichoso inherits Paciente{

  method algunAparatoEsColor(color) = rutina.any({a => a.color() == color})
  override method puedoHacerRutina() =  super() and  self.algunAparatoEsColor(rojo)
  override method hacerRutina(){ super()
 if(self.puedoHacerRutina()){rutina.forEach({a => a.efecto(self)})}
 }

}
class RapidaRecuperacion inherits Paciente{

 var valorConfigurable = 3
 method cambiarValorConfig(v) { valorConfigurable = v}

 override method hacerRutina(){super() self.modificarDolor(valorConfigurable)}


}


