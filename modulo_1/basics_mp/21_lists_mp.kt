fun main() {
    println("Listas")
    val alimentos = listOf("manzana", "pollo", "arroz", "pollo", "leche")

    println("Size: ${alimentos.size}")
    println("Mostrar el elemento indice 0: ${alimentos[0]}")
    println("Mostrar el primer elemento: ${alimentos.first()}")
    println("Mostrar el ultimo elemento: ${alimentos.last()}")

    println("Mostrar el elemento indice 2: ${alimentos.get(2)}")
    println("Mostrar indice contenido elemento: ${alimentos.indexOf("pollo")}")
    println("Verificar existencia de elemento: ${alimentos.contains("arroz")}")
    println("Verificar existencia de un elemento: ${"pollo" in alimentos}")

    println("sublista: ${alimentos.subList(1, 3)}")
    println("tomar primero 2 elementos: ${alimentos.take(2)}")
    println("suprimir tres primeros elementos: ${alimentos.drop(3)}")
    println("tomar los ultimos dos elementos: ${alimentos.takeLast(2)}")

    for (alimento in alimentos) {
        println(alimento)
    }

    println("Listas - Mutable")
    val categoriasAlimentos = mutableListOf("frutas", "proteinas", "granos", "lacteos")
    println(categoriasAlimentos)
    categoriasAlimentos.add("vegetales")
    println(categoriasAlimentos)
    categoriasAlimentos.add(0, "bebidas")
    println(categoriasAlimentos)
    categoriasAlimentos.remove("vegetales")
    println(categoriasAlimentos)
    categoriasAlimentos[1] = "carnes"
    println(categoriasAlimentos)

    println("Array deque - Cola de pedidos")
    val colaPedidos = ArrayDeque<String>()
    println(colaPedidos)
    colaPedidos.addFirst("Pedido 1")
    println(colaPedidos)
    colaPedidos.addLast("Pedido 2")
    println(colaPedidos)
    colaPedidos.addLast("Pedido 3")
    println(colaPedidos)
    colaPedidos.removeFirst()
    println(colaPedidos)
    colaPedidos.removeLast()
    println(colaPedidos)
}