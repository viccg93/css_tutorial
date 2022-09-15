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

## selectores

un selector es un patron que indica el conjunto de elementos al que se aplicara el bloque de estilo
al elemento o elementos que son seleccionados por el selector se les conoce como sujeto del selector

los selectores se encuentran definidos en la especificacion de selectores CSS, la mayoria de estos selectores
se encuentran definidos en la especificacion de selectores de nivel 3, una especificacion maduray con excelente soporte

## modelo de caja

en css todos los elementos tienen una caja a su alrededor, entender esas cajas es fundamental para crear layouts mas complejos

## cajas block e inline

existen 2 tipos de cajas en funcion de como se comportan en el flujo de la pagina y con relacion a otras cajas, ademas
estas cajas tienen un outer display type y un inner display type

se puede modificar el valor del display type mediante la propiedad display

### outer display type

**cuando la caja tiene outer display de block**

- la caja se posiciona en una nueva linea, el siguiente elemento inicia en otra linea (no importa si es block o inline)
- width y height se respetan
- padding, margin y border causan que los elementos cercanos se alejen de la caja
- la caja se extendera en la direccion inline hasta llenar el espacio disponible en su contenedor, incluso ocupando el 100% del contenedor

elementos como <h1> y <p> usan block como outer display type por defecto

**cuando la caja tiene outer display de inline**

- la caja no genera un salto de linea, el siguiente elemento inicia en la misma linea (si no es block)
- width y height no aplican
- vertical padding, margins y borders no causan que otras cajas inline se alejen
- horizontal padding, margins y borders causan que otras cajas inline se alejen

elementos como <a>, <span> y <em> usan inline como outer display type por defecto

### inner display type

el inner display type indica como se dispondran los elementos dentro de la caja

block e inline son las formas predeterminadas de comportamiento en la web
por defecto los elementos dentro de la caja son dispuestos en normal flow y se comportan como cajas block o inline.

una forma de cambiar el inner display type es mediante display: flex, el elemento aun usara block como outer display
pero el inner display pasara a ser flex, lo que indica que cualquier descendiente disrecto de esta caja sera flex
y se comportara de acuerdo a la especificacion flexbox, otro ejemplo es display:grid

## CSS box model

el box model define como las distintas partes de una caja (margin, border, padding y content) trabajan en conjunto,
aplica totalmente a block box y parcialmente a inline box

exite el modelo estandar y un modelo alternativo

### partes de una caja

- content box - el area donde se muestra el contenido, se dimensiona usando las propiedades width, height, inline-size y block-size
- padding box - el area entre el contenido y el borde en forma de espacio en blaco (contiene el content y el espacio en blanco), se dimensiona con padding
- border box - envuelve el content y el padding, se dimesiona con border
- margin boz - es la capa superior, envuelve el conten, el padding, el border y espacio en blanco entre esta caja y otros elementos, se dimesiona con margin

### modelo estandar

cuando se usa el box model estandar, las propiedades de witdh y height aplican solo al content box, por lo que el tamaño real involucra sumar
el espacio añadido del padding y del border, no se considera margin por que este es el espacio fuera del border

### modelo alternativo

cuando se usa el modelo alternativo, las propiedades de tamaño no son las de content, si no las del border, por lo que el area del content
seran esas dimensiones menos el padding y el border, de la misma manera que el modelo estandar no se considera a margin

para indicar que se usara el modelo alternativo de usa la regla box-sizing: border-box;

### margin

es un espacio invisible que rodea a una caja, es usado para establecer un espacio entre un elemento y los elementos adyacentes
se pueden establecer o modificar todos los margenes mediante margin o individualmente mediante margin-top, margin-right, margin-bottom o margin-left

cuando margin tiene valores negativos, lo elementos se sobreponen

cuando los margenes de carios elementos colapsan se aplican las siguientes reglas dependiendo si son positivos o negativos

- cuando ambos margenes son positivos, se toma el superior
- cuando ambos son negativos, se toma el mas lejano a 0
- cuando uno es negativo, se resta del total

### border

el border es dibujado entre el padding y el margin, cuando se usa el modelo estandar, el tamaño del border se agrega al width y height del box,
cuando se usa el modelo alternativo, el tamaño del border se toma del content , dejando las medidas del box intactas

es comun usar border como shorthand para afectar varias propiedades de todos los bordes al mismo tiempo

div {
    border: 1px solid rebeccapurple;
}

tambien se puede modificar cada borde de forma independiente

- border-top
- border-right
- border-bottom
- border-left

alternativamente se puede modificar cada propiedad para todos los bordes

- border-width
- border-style
- border-color

si se desea ser mas especifico, se puede usar una propiedad concreta en un borde especifico

- border-top-width
- border-top-style
- border-top-color

y asi sucesivamente para todos los bordes


### padding

es el area entre el area del contenido y el borde, se usa para alejar el contenido del borde
a diferencia de margin, padding no puede tener valores negativos

cualquier fondo aplicado al elemento, se mostrara en el padding

el shorthand padding permite modificar el padding de todos los lados de un elemento

se puede indicar una medida para todos los lados

div {
    padding: 10px;
}

o medidas distintas

div {
    padding: 10px 15px 20px 25px;
}

tambien se pueden utilizar los propiedades independientes por lado

- padding-top
- padding-right
- padding-bottom
- padding-left

### box model para inline boxes

solo algunas reglas aplican a los elementos inline, en un ejemplo con span, podemos ver que:
- propiedades como height y width son ignoradas
- margin, border y padding verticales son respetadas pero no afectan la relacion de otro contenido con respecto al inline box
- padding y border llegan a colapsar con otras palabras en el parrafo 
- el margin, border y padding horizontales afectan la relacion con otro contenido (lo desplazan)

### display inline-block

inline-block es un valor especial de la propiedad display, es un punto medio entre inline y block,
permite que se apliquen las propiedades width y height a un elemento inline, ademas de que y evitar transposiciones
ademas de que no realiza un salto de linea como lo haria un elemento block

un elemento con esta regla adquiere el siguiente subconjunto de caracteristicas de los elementos block:

- las propiedades width y height son respetadas
- margin, padding y border causan que los elementos se desplacen

el tamaño del contenedor sera mayor al contenido si asi se indica con las propiedades width y height, ademas
de que a diferencia de los elementos block, el elemento no se posiciona en una nueva linea