fun main () {
    println("Operadores logicos en consulta dietetica")
    val esMayor = true
    val tienePermiso = false
    val estaActivo = true
    println ("&& - And Logico ")
    println("Paciente adulto y con dieta aprobada = ${esMayor && tienePermiso}")
    println("Consulta activa y paciente adulto = ${estaActivo && esMayor}")
    println("|| - Or Logico")
    println("Paciente adulto o con dieta aprobada = ${esMayor || tienePermiso}")
    println("Consulta activa o paciente adulto = ${estaActivo || esMayor}")
    println("! - Not Logico")
    println("No es adulto = ${!esMayor}")
    println("No tiene dieta aprobada = ${!tienePermiso}")
    println("Consulta no activa = ${!estaActivo}")
    
}