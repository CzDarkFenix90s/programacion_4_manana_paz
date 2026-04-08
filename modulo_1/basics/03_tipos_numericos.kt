fun main() {
    val numero1: Byte = 127
    println("Numero Byte $numero1")

    val numero2: Short = 32_765 
    println("Numero Short $numero2")

    val numero3: Int = 12 
    println("Numero Int $numero3")

    val numero4: Long = 12_122_122_123_123_987L 
    println("Numero Long $numero4")

    val numero5: Float = 3.14f 
    println("Numero Float $numero5")

    val numero6: Double = 3.1415926535
    println("Numero Double $numero6")
    
   //inferido
   val nombres="juana"
   val edad=56
   println("nombre $nombre")
   val nombreTipo=nombre: :class.simpleName
   println("tipo inferido nombre : ${nombretipo}")
   println("tipo inferido nombre : ${nombre: :class.simpleName}")
   println("edad: $edad")
   val edadTipo=edad: : class.simpleName
   println("tipo inferido edad : ${edadtipo}")
   println("tipo inferido edad : ${edad: :class.simpleName}")
}