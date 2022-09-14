## cascada

cuando 2 o mas reglas tienen la misma especificidad, se aplica siempre la ultima

## especificidad

mide cuan especifica es la seleccion de un selector, por ejemplo un selector de
elemento es menos especifico, ya que aplica a todos los elementos de ese tipo
y un selector de clase es mas especifico, ya que solo aplica a los elementos
que se han marcado explicitamente con esa clase

## herencia

existen propiedades CSS que de ser aplicadas a un elemento padre tambien
se aplican a los elementos hijos, a menos que se defina un valor especifico
para esos elementos.

un ejemplo de ello es color y font-family.

no todas las propiedades tienen ese comportamiento de herencia, por ejemplo
width solo aplica al elemento padre.

## control de la herencia

todas la propiedades aceptan estos cuatros valores que indican como se va a
comportar dicha propiedad frente a la herencia 

- inherit: el valor de esa propiedad sera el mismo que el del elemento padre (activa la herencia)
- initial: el valor de esa propiedad sera el de la hoja por defecto del navegador (desactiva la herencia)
- unset: restablece la propiedad a su valor natural, es decir la propiedad va a heredar o no en funcion del estandar
- revert: valor admitido por pocos navegadores

## prioridad al aplicar una regla CSS

cada uno de los siguientes factores define que reglas se aplicaran a cada elemento, cada una invalida la anterior

1. orden del codigo
2. especificidad
3. importancia

es recomendable inciar con los selectores mas generales (elementos) y posteriormente escribir los casos mas especificos (clases)
aprovechando las reglas generales y enfocandonos en las particularidades

## cantidad de especificidad

la especificidad esta dada por la cantidad y tipo de selectores que conforman el selector del bloque css, estos selectores
se ponderan de acuerdo a los siguientes grupos, se suman y el valor resultante es la cantidad de especificidad

1. millares - suman un punto las declaraciones inline (sin selector)
2. centenas - se suma un punto cor cada selector de ID contenido en el selector general
3. decenas - se suma un punto por cada selector de clase, de atributo o pseudoclase contenido en el selector general
4. unidades - se suma un punto por cada selector o pseudoelemento que se encuentra contenido en el selector general

| selector                                | millares    | centenas      | decenas  | unidades | especificidad  |
|              :----:                     |    :----:   |    :----:     |  :----:  |  :----:  |     :----:     |
| h1                                      |       0     |        0      |     0    |     1    |       0001     |
| h1 + p::first-letter                    |       0     |        0      |     0    |     3    |       0003     |
| li > a[href*="en-US"] > .inline-warning |       0     |        0      |     2    |     2    |       0022     |
| #identifier                             |       0     |        0      |     0    |     0    |       0100     |
| etiqueta <style> (inline)               |       0     |        0      |     0    |     0    |       1000     |

Aunque esta forma de calculo de la especificidad es aproximada y esta orientada a entender el concepto, en realidad
cada tipo de selector tiene su propio nivel de especificidad.

si se diera el caso, un millar de selectores de clase no serian capaces de sobreescribir un selector de id

una forma mas precisa de evaluar la especificidad es anotar los niveles de especificidad de mayor a menor y
solo cuando hay empate de puntuaciones se tendra que evaluar el nivel inferior, de lo contrario se puede
prescindir de los niveles inferiores

## uso de !important

este valor se utiliza para convertir una propiedad y un valor particular en el elemento mas especifico, invalidando
las reglas normales de cascada

## layers

los layers se declaran con @layer, son conjuntos que permiten agrupar bloques y reglas de manera que podemos
dar prioridad a ciertas layers sobre de otras, entre mas al final este declarada una layer tendra mas prioridad
que una que se declaro antes.

el uso de !important tiene un efecto inverso, ya que la prioridad la tienen las reglas que aparecen en capas inferiores
ya que se entiende que se leen primero y las reglas marcadas con !important que colisionen en capas superiores no tendran efecto


las reglas que no se encuentran en un layer se agrupan en una layer sin nombre y se consideran como la ultima
layer declarada (con mayor prioridad), las declaraciones inline tambien tienen mayor precesencia que cualquier estilo
definido por el autor (sobre todas las layers y bloques sin layer)