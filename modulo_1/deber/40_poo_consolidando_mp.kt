// ABSTRACCIÓN: sealed class define los tipos posibles de notificación
sealed class Notificacion(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String  // cada tipo formatea de forma distinta

    data class Email(
        val destinatario: String,
        val asunto:       String,
        val cuerpo:       String
    ) : Notificacion(asunto, cuerpo) {
        override fun formatear() =
            "📧 Email → $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Push(val dispositivo: String, val icono: String = "🔔")
        : Notificacion("Push", "") {
        override fun formatear() = "$icono Push → $dispositivo: $titulo"
    }

    data class Sms(val telefono: String, val texto: String)
        : Notificacion("SMS", texto) {
        override fun formatear() = "📱 SMS → $telefono: ${texto.take(160)}"
    }

    object Silenciosa : Notificacion("", "") {
        override fun formatear() = "🔕 Notificación silenciosa"
    }
}

// ABSTRACCIÓN + POLIMORFISMO: interfaz con contrato genérico
interface EnviadorNotificacion {
    val nombre: String
    fun enviar(notificacion: Notificacion): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class ServicioEmail : EnviadorNotificacion {
    override val nombre = "Email"
    override fun enviar(n: Notificacion): Boolean {
        if (n !is Notificacion.Email) return false
        println("  [EMAIL] → ${n.destinatario}")
        return true
    }
}

class ServicioPush : EnviadorNotificacion {
    override val nombre = "Push"
    override fun enviar(n: Notificacion): Boolean {
        if (n !is Notificacion.Push) return false
        println("  [PUSH] → ${n.dispositivo}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de servicios es privada
class Dispatcher(private val servicios: List<EnviadorNotificacion>) {

    fun enviar(notificacion: Notificacion) {
        println(notificacion.formatear())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = servicios.any { it.enviar(notificacion) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    val dispatcher = Dispatcher(listOf(ServicioEmail(), ServicioPush()))

    listOf(
        Notificacion.Email("ana@test.com", "Bienvenida", "Gracias por registrarte."),
        Notificacion.Push("iPhone-Ana"),
        Notificacion.Sms("+34600000000", "Tu código es 1234"),
        Notificacion.Silenciosa
    ).forEach { dispatcher.enviar(it) }
}

// ABSTRACCIÓN: sealed class define los tipos posibles de reporte
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
    val reportes = listOf(
        ReporteConsulta.ReporteDieta("Ana", "Baja en carbohidratos"),
        ReporteConsulta.ReporteProgreso("Luis", -2.5),
        ReporteConsulta.AlertaAlergia("Maria", "mani")
    )

    reportes.forEach { procesarReporte(it) }
}

// PuntoInmutable — propiedades de solo lectura (val)
class PuntoInmutable(val x: Double, val y: Double) {
    fun distancia(origen: PuntoInmutable) = Math.sqrt((x - origen.x) * (x - origen.x) + (y - origen.y) * (y - origen.y))
}

// Contador — propiedades mutables (var)
class ContadorDieta(var caloriasConsumidas: Int = 0) {
    fun agregarComida(calorias: Int) {
        caloriasConsumidas += calorias
    }
}

// Constructor sin val/var — parámetros sin propiedades
class RegistroComida(nombre: String, calorias: Int) {
    val descripcion = "$nombre: $calorias kcal"
}

fun main() {
    val punto = PuntoInmutable(3.0, 4.0)
    println(punto.distancia(PuntoInmutable(0.0, 0.0))) // 5.0

    val contador = ContadorDieta()
    contador.agregarComida(500)
    println(contador.caloriasConsumidas) // 500

    val registro = RegistroComida("Manzana", 95)
    println(registro.descripcion) // Manzana: 95 kcal
}