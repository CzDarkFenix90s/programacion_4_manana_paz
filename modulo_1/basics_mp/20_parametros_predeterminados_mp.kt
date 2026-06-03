
fun main() {
    println("Funciones - Parámetros por defecto")
    println(crearPlanDieta("Ana", 25, "vegetariana", true))
    println(crearPlanDieta("Luis"))
    println(crearPlanDieta("Maria", 30))
    println(crearPlanDieta("Juan", 30, "baja en carbohidratos"))

    //Argumentos nombrados
    println(crearPlanDieta(calorias = 1800, nombre = "Yamilet", activo = false))
}

fun crearPlanDieta(
    nombre: String,
    calorias: Int = 2000,
    preferencia: String = "balanceada",
    activo: Boolean = true
): String {
    return "Plan[$nombre, calorias=$calorias, preferencia=$preferencia, activo=$activo]"
}