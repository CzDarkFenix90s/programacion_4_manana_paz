fun main() {
  println("Controles de Flujo")
  println("Condicional If - else")
  println("Tiene seguro medico s/n: ")
  val tieneSeguro =readLine()?.trim()?.lowercase()=="ss"
  println("Costo Base: ")
  val costoBase =readLine()?.toDoubleOrNull()?:0.0
  if(tieneSeguro){
      val cobertura = costoBase*0.80
      println("Seguro cubre: $${"%.2f".format(cobertura)}")
  } else{
      println("Pago Particular: $${"%.2f".format(CostoBase)"})
  }
}

//ejercicio en clase:
fun main() {
  println("Controles de Flujo")
  println("Condicional If - else")
  println("Su examen es de laboratorio o imagen l/i")
  val examenLaboratorio =readLine()?.trim()?.lowercase()=="l"
  if(examenLaboratorio){
      println("Debe estar en ayunas")
  } else{
      println("No debe ir en ayunas")
  }
}