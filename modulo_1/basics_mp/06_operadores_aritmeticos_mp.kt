fun main() {
    
    //readline
    println("Calculos en consulta dietetica ")
	val numero1=10
	val numero2=2
    
    println("Suma de calorias")
    println("$numero1 + $numero2 : ${numero1+numero2}")
    println("Resta de calorias")
    println("$numero1 - $numero2 : ${numero1-numero2}")
    println("Multiplicacion de porciones")
    println("$numero1 * $numero2 : ${numero1*numero2}")
    println("Division de dieta")
    println("$numero1 / $numero2 : ${numero1/numero2}")
    println("Modulo de calorias")
    println("$numero1 % $numero2 : ${numero1%numero2}")
    
    println("Ajustes en plan alimenticio")
    var x=10
    
    x+=5
    println("Aumento de calorias $x")
    x-=3
    println("Reduccion de calorias $x")
    x*=6
    println("Multiplicacion de porciones $x")
    x/=2
    println("Division de dieta $x")
    x%=2
    println("Modulo aplicado $x")
    
    //Incremento o Decremento
    x++
    println("Incremento en dieta $x")
    x--
    println("Decremento en dieta $x")
    
}