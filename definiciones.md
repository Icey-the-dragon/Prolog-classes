# Definiciones
## Término
El elemento más genérico

## Término simple
Número, Carácter, Variable O Cadena.

### Variable
Un Término sin inicializar

## Argumento
Otro término

## Clausula
Cabeza = 1 término
Cuerpo = 1 o más términos
cumple esta sintaxis: "miembro(A,B,C,...) :- miembro2(A,_,C,D,...),..."
                        Cabeza               Cuerpo

## Arbol
Represéntación en arbol de la pila / stack
Juntor == Raíz. Hojas = Términos.

## Aridad
Número de argumentos

## Función
Término sin valor lógico

## Predicado
Término con valor lógico

## Sentencia
Linea de código prolog  que tiene cabeza y cuerpo

## Unificar
Igualar dos términos
(0 o más sustituciones)

### Transitividad
Es transitiva ya que si A unifica con B & B con C. Entonces A unifica con C.

## Firma
Forma abreviada de escribir un término, pred(_,_,_), pred/3.

## Pregunta
Clausula sin cabeza

# Operadores
Una conveniencia notacional.
Tipos:
- Infijos - Medio
- Sufijos - Despues
- Prefjos - Antes
## Corte
Un predicado extralógico que elimina el resto de las ramas al nivel de su entrada, osea sus ramas hermanas. Siempre se evalua a cierto.

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

SON PUNTEROS X-Y -> Y será un puntéro al final de la lista, si haces Car|Y
El Car lo metes antes que Y por lo que Car será el último elemento.
