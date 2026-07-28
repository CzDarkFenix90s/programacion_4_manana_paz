fun main() {
    print("Ingrese el tipo de consulta (Control / Evaluacion): ")
    val tipoExamen = readLine()?.trim()
    if (tipoExamen?.equals("Control", ignoreCase = true) == true) {
        println("Indicacion: Seguimiento del plan alimenticio.")
    } else if (tipoExamen?.equals("Evaluacion", ignoreCase = true) == true) {
        println("Indicacion: Analisis completo de habitos alimenticios.")
    } else {
        println("Tipo de consulta no reconocido.")
    }
}