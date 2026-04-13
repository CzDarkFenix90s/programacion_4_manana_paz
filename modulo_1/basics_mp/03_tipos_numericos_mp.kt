fun main() {
    val numero1: Byte = 127
    println("Calorias minimas $numero1")

    val numero2: Short = 32_765 
    println("Calorias recomendadas $numero2")

    val numero3: Int = 12 
    println("Numero de comidas $numero3")

    val numero4: Long = 12_122_122_123_123_987L 
    println("Registro historico $numero4")

    val numero5: Float = 3.14f 
    println("Litros de agua $numero5")

    val numero6: Double = 3.1415926535
    println("IMC calculado $numero6")
    
   //inferido
   val nombre="Paciente Juana"
   val edad=56
   println("Consulta dietetica de $nombre")
   val nombreTipo=nombre::class.simpleName
   println("tipo inferido nombre : ${nombreTipo}")
   println("tipo inferido nombre : ${nombre::class.simpleName}")
   println("edad: $edad")
   val edadTipo=edad::class.simpleName
   println("tipo inferido edad : ${edadTipo}")
   println("tipo inferido edad : ${edad::class.simpleName}")
}