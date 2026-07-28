fun main() {
    println("Controles de Flujo When")
    println("Escriba codigo")
    val codigo = readLine()?.toIntOrNull() ?: 0
    
    val especialidad = when(codigo) {
        1 -> "Consulta general nutricional"
        2 -> "Control de peso"
        3 -> "Plan alimenticio personalizado"
        4 -> "Evaluacion nutricional"
        5 -> "Asesoria deportiva"
        6 -> "Dieta especializada"
        else -> "Consulta no registrada en el sistema"
    }
    
    println("Tipo de consulta: $especialidad")
}