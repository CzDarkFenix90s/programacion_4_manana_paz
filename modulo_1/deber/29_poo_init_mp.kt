object ConfiguracionDieta {

    var caloriasDiarias: Int = 2000
    var preferencia: String = "balanceada"
}

class Paciente private constructor(val nombre: String) {
    companion object {
        fun crear(nombre: String): Paciente {
            require(nombre.isNotBlank()) { "Nombre requerido" }
            return Paciente(nombre)
        }
    }
}

class UsuarioDieta(
    nombre: String,
    email: String,
    edad: Int,
    peso: Double
) {
    val nombre: String
    val email: String
    val edad: Int
    val peso: Double

    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(email.contains("@")) { "El email debe ser válido" }
        require(edad in 1..120) { "La edad debe estar entre 1 y 120" }
        require(peso > 0) { "El peso debe ser positivo" }

        this.nombre = nombre
        this.email = email
        this.edad = edad
        this.peso = peso
    }

    val imc: Double
        get() = peso / (altura * altura) // Asumiendo altura, pero simplificado

    // Propiedad calculada que requiere altura — se debe agregar al constructor
}

class IndiceGlucosa(private var valor: Double) {

    var glucosa: Double
        get() = valor
        set(nuevoValor) {
            require(nuevoValor >= 0) { "La glucosa no puede ser negativa" }
            valor = nuevoValor
        }

    val nivel: String
        get() = when {
            valor < 70 -> "Hipoglucemia"
            valor <= 140 -> "Normal"
            else -> "Hiperglucemia"
        }

    val recomendacion: String
        get() = when (nivel) {
            "Hipoglucemia" -> "Consumir carbohidratos simples"
            "Normal" -> "Mantener dieta balanceada"
            "Hiperglucemia" -> "Reducir azúcares y consultar médico"
            else -> "Consultar especialista"
        }
}

class PlanDieta(ancho: Double, alto: Double) {
    var ancho: Double = ancho
    var alto: Double = alto

    // Constructor secundario para dieta cuadrada
    constructor(lado: Double) : this(lado, lado)

    // Constructor secundario con conversión
    constructor(ancho: Int, alto: Int) : this(ancho.toDouble(), alto.toDouble())

    val area: Double
        get() = ancho * alto

    val descripcion: String
        get() = "Plan de dieta ${ancho}x${alto} = ${area} unidades"
}

data class Alimento(val id: Int, val nombre: String, val calorias: Double, val categoriaId: Int)

enum class EstadoDieta {
    INICIO {
        override fun descripcion() = "Comenzando dieta"
        override fun esTerminal() = false
    },
    MANTENIMIENTO {
        override fun descripcion() = "Manteniendo peso"
        override fun esTerminal() = false
    },
    FINALIZADO {
        override fun descripcion() = "Dieta completada"
        override fun esTerminal() = true
    };

    abstract fun descripcion(): String
    abstract fun esTerminal(): Boolean
}

data class Categoria(val id: Int, val nombre: String)

object CatalogoAlimentos {
    private val categorias = mutableListOf(
        Categoria(1, "Frutas"),
        Categoria(2, "Proteínas"),
        Categoria(3, "Granos")
    )
    private val alimentos = mutableListOf<Alimento>()

    fun agregarAlimento(id: Int, nombre: String, calorias: Double, categoriaId: Int) {
        alimentos.add(Alimento(id, nombre, calorias, categoriaId))
    }

    fun listar(): List<Alimento> = alimentos

    fun porCategoria(id: Int): List<Alimento> = alimentos.filter { it.categoriaId == id }

    fun disponibles(): List<Alimento> = alimentos.filter { it.calorias > 0 }

    fun buscar(nombre: String): List<Alimento> = alimentos.filter { it.nombre.contains(nombre, ignoreCase = true) }
}

open class Dieta(val nombre: String) {
    open fun descripcion() = "Dieta base: $nombre"
    fun calcularCaloriasBase() = 2000
}

class DietaKeto(nombre: String) : Dieta(nombre) {
    override fun descripcion() = "Dieta keto: $nombre - baja en carbohidratos"
    fun validarCarbohidratos() = "Carbohidratos limitados"
}

class DietaMediterranea(nombre: String) : Dieta(nombre) {
    override fun descripcion() = "Dieta mediterránea: $nombre - rica en aceite de oliva"
    fun beneficiosCardiovasculares() = "Mejora la salud del corazón"
}

interface ConsultaProvider {
    fun proporcionarConsulta(paciente: String): String
}

class MedicoNutricionista : ConsultaProvider {
    override fun proporcionarConsulta(paciente: String) = "Consulta médica para $paciente"
}

class AplicacionDieta : ConsultaProvider {
    override fun proporcionarConsulta(paciente: String) = "Recomendación app para $paciente"
}

class CoachPersonal : ConsultaProvider {
    override fun proporcionarConsulta(paciente: String) = "Entrenamiento personalizado para $paciente"
}

fun realizarConsulta(provider: ConsultaProvider, paciente: String) {
    println(provider.proporcionarConsulta(paciente))
}

fun main() {
    val usuario = UsuarioDieta("Ana", "ana@email.com", 30, 65.0)
    println("${usuario.nombre} - IMC: ${usuario.imc}")

    val indice = IndiceGlucosa(120.0)
    println("Glucosa: ${indice.glucosa} - Nivel: ${indice.nivel}")
    println("Recomendación: ${indice.recomendacion}")

    indice.glucosa = 60.0
    println("Nuevo nivel: ${indice.nivel}")

    val plan1 = PlanDieta(10.0, 5.0)
    println(plan1.descripcion) // Plan de dieta 10.0x5.0 = 50.0 unidades

    val plan2 = PlanDieta(8.0) // Cuadrado
    println(plan2.descripcion) // Plan de dieta 8.0x8.0 = 64.0 unidades

    val plan3 = PlanDieta(12, 8) // Enteros convertidos
    println(plan3.descripcion) // Plan de dieta 12.0x8.0 = 96.0 unidades

    val manzana = Alimento("Manzana", 95, 0.5)
    val pollo = Alimento("Pollo", 165, 31.0)

    println(manzana) // Alimento(nombre=Manzana, calorias=95, proteinas=0.5)
    println(pollo)   // Alimento(nombre=Pollo, calorias=165, proteinas=31.0)

    // equals por valor
    println(manzana == Alimento("Manzana", 95, 0.5)) // true

    // copy para modificaciones inmutables
    val manzanaGrande = manzana.copy(calorias = 120)
    println(manzanaGrande) // Alimento(nombre=Manzana, calorias=120, proteinas=0.5)

    // Destructuring
    val (nombre, cal, prot) = pollo
    println("$nombre tiene $cal kcal y $prot g de proteína")

    ConfiguracionDieta.caloriasDiarias = 1800
    println("Calorías diarias: ${ConfiguracionDieta.caloriasDiarias}")

    val paciente = Paciente.crear("Ana")
    println("Paciente: ${paciente.nombre}")

    val estado = EstadoDieta.MANTENIMIENTO
    println(estado.descripcion()) // Manteniendo peso
    println(estado.esTerminal())  // false

    // When exhaustivo
    when (estado) {
        EstadoDieta.INICIO -> println("Plan inicial")
        EstadoDieta.MANTENIMIENTO -> println("Seguimiento")
        EstadoDieta.FINALIZADO -> println("Evaluación final")
    }

    CatalogoAlimentos.agregarAlimento(1, "Manzana", 95.0, 1)
    CatalogoAlimentos.agregarAlimento(2, "Pollo", 165.0, 2)

    println("Todos los alimentos:")
    CatalogoAlimentos.listar().forEach { println(it) }

    println("Frutas:")
    CatalogoAlimentos.porCategoria(1).forEach { println(it) }

    val keto = DietaKeto("Personalizada")
    println(keto.descripcion()) // Dieta keto: Personalizada - baja en carbohidratos
    println(keto.validarCarbohidratos()) // Carbohidratos limitados

    val med = DietaMediterranea("Tradicional")
    println(med.descripcion()) // Dieta mediterránea: Tradicional - rica en aceite de oliva
    println(med.beneficiosCardiovasculares()) // Mejora la salud del corazón

    val providers = listOf(
        MedicoNutricionista(),
        AplicacionDieta(),
        CoachPersonal()
    )

    providers.forEach { realizarConsulta(it, "Ana") }
}