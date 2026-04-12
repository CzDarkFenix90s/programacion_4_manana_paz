fun main() {
    val nombre = "Juana"
    val apellido = "Perez"
    val edad = 28

    // Variable simple
    println("Consulta dietetica de $nombre")

    // Expresión
    println("Paciente ${nombre.uppercase()} ${apellido.uppercase()}")

    val nombreCompleto = "Paciente ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)

    println("Edad del paciente : ${edad + 6} años")

    // String Multilínea
    val tarjeta = """
        |Paciente: $nombre $apellido
        |Edad: $edad
        |Consulta: ${if (edad >= 18) "Adulto" else "Menor"}
    """.trimMargin()

    println(tarjeta)
}