abstract class Figura(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val area: Double
    abstract val perimetro: Double
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilización)
    fun comparar(otra: Figura): String = when {
        area > otra.area -> "$nombre es más grande que ${otra.nombre}"
        area < otra.area -> "$nombre es más pequeña que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} tienen la misma área"
    }

    // Polimorfismo: toString usa area y descripcion que son polimórficas
    override fun toString() = "${descripcion()} | Área: ${"%.2f".format(area)}"
}

class Circulo(val radio: Double) : Figura("Círculo") {
    override val area:       Double get() = Math.PI * radio * radio
    override val perimetro:  Double get() = 2 * Math.PI * radio
    override fun descripcion() = "Círculo de radio $radio"
}

class Rectangulo(val ancho: Double, val alto: Double) : Figura("Rectángulo") {
    override val area:       Double get() = ancho * alto
    override val perimetro:  Double get() = 2 * (ancho + alto)
    override fun descripcion() = "Rectángulo de ${ancho}x${alto}"
}

class TrianguloEquilatero(val lado: Double) : Figura("Triángulo") {
    override val area:       Double get() = (Math.sqrt(3.0) / 4) * lado * lado
    override val perimetro:  Double get() = 3 * lado
    override fun descripcion() = "Triángulo equilátero de lado $lado"
}

abstract class TipoRecomendacion(val nombre: String) {
    abstract val caloriasRecomendadas: Int
    abstract fun descripcion(): String

    fun esAdecuadoPara(edad: Int) = edad >= 18
}

class CaloriasAltas(nombre: String) : TipoRecomendacion(nombre) {
    override val caloriasRecomendadas = 2500
    override fun descripcion() = "Recomendación alta en calorías: $nombre"
}

class ProteinaAlta(nombre: String) : TipoRecomendacion(nombre) {
    override val caloriasRecomendadas = 2000
    override fun descripcion() = "Recomendación alta en proteínas: $nombre"
}

class Vegana(nombre: String) : TipoRecomendacion(nombre) {
    override val caloriasRecomendadas = 1800
    override fun descripcion() = "Recomendación vegana: $nombre"
}

interface Serializable {
    fun serializar(): String = "Datos serializados"
}

interface Validable {
    fun validar(): Boolean = true
    fun mensajeValidacion(): String = "Válido"
}

class PedidoDieta(
    val paciente: String,
    val alimentos: List<String>
) : Serializable, Validable {

    override fun validar(): Boolean = alimentos.isNotEmpty()

    override fun mensajeValidacion(): String {
        return if (validar()) "Pedido válido" else "Pedido sin alimentos"
    }

    override fun serializar(): String = "Pedido de $paciente: $alimentos"
}

sealed class ReporteConsulta(val titulo: String, val fecha: String) {
    abstract fun formatear(): String

    data class ReporteDieta(val paciente: String, val plan: String) : ReporteConsulta("Plan Dietético", "2024-01-01") {
        override fun formatear() = "🥗 Dieta para $paciente: $plan"
    }

    data class ReporteLaboratorios(val paciente: String, val resultados: String) : ReporteConsulta("Laboratorios", "2024-01-01") {
        override fun formatear() = "🧪 Resultados de $paciente: $resultados"
    }

    data class ReporteProgreso(val paciente: String, val cambioPeso: Double) : ReporteConsulta("Progreso", "2024-01-01") {
        override fun formatear() = "📈 Progreso de $paciente: $cambioPeso kg"
    }

    data class AlertaAlergia(val paciente: String, val alergeno: String) : ReporteConsulta("Alerta", "2024-01-01") {
        override fun formatear() = "⚠️ Alerta para $paciente: alergia a $alergeno"
    }
}

fun procesarReporte(reporte: ReporteConsulta) {
    println(reporte.formatear())
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier Figura
    val figuras: List<Figura> = listOf(
        Circulo(5.0),
        Rectangulo(4.0, 6.0),
        TrianguloEquilatero(8.0)
    )

    figuras.forEach { println(it) }  // toString polimórfico

    val mayor = figuras.maxByOrNull { it.area }
    println("\nFigura más grande: ${mayor?.nombre}")

    println(figuras[0].comparar(figuras[1]))

    val recomendaciones = listOf(
        CaloriasAltas("Deportista"),
        ProteinaAlta("Fitness"),
        Vegana("Saludable")
    )

    recomendaciones.forEach {
        println("${it.descripcion()} - ${it.caloriasRecomendadas} kcal")
        println("Adecuado para adultos: ${it.esAdecuadoPara(25)}")
    }

    val pedido = PedidoDieta("Ana", listOf("Manzana", "Pollo"))
    println(pedido.serializar())
    println(pedido.validar())
    println(pedido.mensajeValidacion())

    val reportes = listOf(
        ReporteConsulta.ReporteDieta("Ana", "Baja en carbohidratos"),
        ReporteConsulta.ReporteProgreso("Luis", -2.5),
        ReporteConsulta.AlertaAlergia("Maria", "mani")
    )

    reportes.forEach { procesarReporte(it) }
}