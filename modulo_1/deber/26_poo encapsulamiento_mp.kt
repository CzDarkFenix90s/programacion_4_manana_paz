class PacienteConsulta(nombre: String, consultaInicial: String) {

    val nombre: String = nombre // público — cualquiera puede leer

    private var historiaConsultas: MutableList<String> = mutableListOf(consultaInicial) // privado — solo esta clase lo modifica

    internal val idPaciente: String = // internal — visible en el mismo módulo
        "PAC${(100000..999999).random()}"

    protected open fun calcularProgreso(): Int = historiaConsultas.size * 10 // protected — visible en subclases

    // La historia solo cambia a través de estos métodos — NUNCA directamente
    fun registrarConsulta(consulta: String) {
        require(consulta.isNotBlank()) { "La consulta no puede estar vacía" }
        historiaConsultas.add(consulta)
        println("Consulta registrada: $consulta | Total consultas: ${historiaConsultas.size}")
    }

    fun obtenerDieta(): String {
        return "Dieta recomendada basada en ${historiaConsultas.lastOrNull() ?: "ninguna consulta"}"
    }

    fun consultarHistoria(): List<String> = historiaConsultas.toList()
}

fun main() {
    val paciente = PacienteConsulta("Ana García", "Consulta inicial: dieta baja en carbohidratos")

    paciente.registrarConsulta("Seguimiento: pérdida de 2kg") // Consulta registrada...
    paciente.registrarConsulta("Ajuste: aumentar proteínas")

    println(paciente.nombre) // Ana García — acceso público permitido
    println(paciente.obtenerDieta()) // Dieta recomendada...
    // paciente.historiaConsultas.add("hack") // ERROR — historiaConsultas es privado
}