// El constructor primario integra la declaración de propiedades
class PacienteDieta(val nombre: String, val edad: Int)

// Con cuerpo adicional
class PacienteDieta2(val nombre: String, val edad: Int, val condicionesSalud: List<String>) {
    fun presentarse() = "Soy $nombre, tengo $edad años y mis condiciones son $condicionesSalud"
    fun necesitaDietaEspecial() = condicionesSalud.isNotEmpty()
}

fun main() {
    val p = PacienteDieta("Ana", 28)
    println(p.nombre) // Ana
    println(p.edad) // 28

    val p2 = PacienteDieta2("Luis", 17, listOf("diabetes", "obesidad"))
    println(p2.presentarse()) // Soy Luis...
    println(p2.necesitaDietaEspecial()) // true
}