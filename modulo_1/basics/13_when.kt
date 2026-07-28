fun main() {
println("Controles de Flujo When")
println("Escriba codigo")
val codigo =readLine()?.toIntOrNull()?:0
val especialidad = when(codigo){
    1->"Medicina General"
    2 ->"Pediatria"
    3->"Cardiologia"
    4->"Ginecologia"
    5->"Neurologia"
    6->"Dermatologia"
    else ->"Especialidad no registrada en el sistema"
}
println("Especialidad: $especialidad")

}

//ejemplo

fun main() {
println("Controles de Flujo When")
println("Ingrese el numero para seleccionar su tipo de muestra")
val codigo =readLine()?.toIntOrNull()?:0
val especialidad = when(codigo){
    1->"Sangre Venosa | 4h"
    2 ->"Orina | 2h"
    3->"Heces | 24h"
    4->"Hisopado nasofaringeo | 6h"
    5->"Biopsia | 72h"
    else ->"Especialidad no registrada en el sistema"
}
println("Especialidad: $especialidad")

}