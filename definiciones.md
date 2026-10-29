# Definiciones
## Término
El elemento más genérico

## Argumento
Otro término

## Clausula
cumple esta sintaxis: "miembro(A,B,C,...) :- miembro2(A,_,C,D,...),..."
                        Cabeza               Cuerpo

## Arbol
Represéntación en rabol de la pila / stack

## Sentencia
Linea de código prolog  que tiene cabeza y cuerpo

## Unificar
Igualar dos términos

# Operadores
## Corte
Un predicado extralógico que elimina el resto de las ramas al nivel de su entrada, osea sus ramas hermanas

### Corte Verde
Un corte cuya elminación no afecta la valided de el resultado

### Corte Rojo
Uno cuya eliminación sí afecta al resultado

## Variable anónima
Una cuyo valor no importa

## Fail
Operador extralógico que se evalua siempre a true y resuelve una rama a false

## Operadors Lógicos

= \== <= >= \= == > < 

## Diferencia de listas
\ es un operador que se evalua a [1,2]\2 => [1] == [1,X]\X