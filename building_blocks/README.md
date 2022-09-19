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
| li \> a[href*="en-US"] \> .inline-warning |       0     |        0      |     2    |     2    |       0022     |
| #identifier                             |       0     |        0      |     0    |     0    |       0100     |
| etiqueta \<style\> (inline)               |       0     |        0      |     0    |     0    |       1000     |

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

elementos como \<h1\> y \<p\> usan block como outer display type por defecto

**cuando la caja tiene outer display de inline**

- la caja no genera un salto de linea, el siguiente elemento inicia en la misma linea (si no es block)
- width y height no aplican
- vertical padding, margins y borders no causan que otras cajas inline se alejen
- horizontal padding, margins y borders causan que otras cajas inline se alejen

elementos como \<a\>, \<span\> y \<em\> usan inline como outer display type por defecto

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

## backgrounds y borders

la propiedad **background** es un shorthand de un numero considerable de propiedades que modifican el comportamiento
del fondo, por lo que en ocasiones las reglas que la usan son complejas ya que modifican muchas propiedades al mismo tiempo
por ejemplo:

.box {
  background: linear-gradient(
        105deg,
        rgba(255, 255, 255, 0.2) 39%,
        rgba(51, 56, 57, 1) 96%
      ) center center / 400px 200px no-repeat, url(big-star.png) center
      no-repeat, rebeccapurple;
}

### background color
para modificar el color del fondo de un elemento se usa la propiedad **background-color**

### background images
para mostrar una imagen como fondo de un elemento se usa la propiedad **background-image**
y el valor que recibe es url('[ruta de la imagen]')

de manera predeterminada, si la imagen es mas grande que el elemento al que se le aplica como fondo
solo se mostrara una porcion de la imagen

por el contrario si la imagen es mas pequeña se repetira la imagen hasta que se llene el fondo del elemento

### background repeat

cuando la imagen es mas pequeña que el elemento, la propiedad background-repeat controla el comportamiento de
la imagen para llenar el espacio que la imagen no cubre

valores:
- repeat - valor por defecto, se repite la imagen horizontal y vertical
- repeat-x - se repite la imagen horizontalmente
- repeat-y - se repite la imagen verticalmente
- no-repeat - no se repite la imagen

### background size
permite modificar el tamaño de la imagen que se aplicara de fondo, se pueden pasar medidas de ancho y alto
ademas permite que se use alguno de los siguientes valores:
- cover - el navegador hace que la imagen tenga las dimensiones para cubrir el fondo, el ratio de la imagen
            se mantiene, por lo que podria haber areas que no sean visibles

- contain - el navegador hace que el tamaño de la imagen coincida con las dimesiones del fondo donde se aplicara,
            es posible que existan espacios rellenados por el navegador si el ratio de la imagen y el del fondo son distintos

- dimensiones concretas - en un escenario ideal donde las medidas corresponden con las dimensiones de content y padding, se mostrara
            la imagen cubriendo todo el contenedor, si las medidas son mas pequeñas que la caja, se comenzaran a posicionar
            copias de la imagen para cubir el espacio o no (dependiendo el valor de background repeat)

### background position
permite indicar la posicion de la imagen de fondo, esta propiedad usa un sistema de cordenadas que inicia en la esquina superior izquierda,
ese punto es considerado la cordenada (0,0) y es el valor por defecto, la propiedad admite los siguientes valores:

- palabras clave como top, right o center
- medidas y porcentaces como 20px y 10%
- combinaciones de palabras clave y medidas

La forma basica de usar la propiedad es pasar 2 valores donde el primero indica la posicion horizontal y el segundo la posicion vertical

.box {
    background-position: 20px top;
}

Alternativamente se puede usar con 4 valores, util para indicar distancia desde ciertos lados a manera de offset
en el siguiente ejemplo el bakcground se posiciona a 20px del lado superior y a 10px del lado derecho

.box {
    background-position: top 20px right 10px;
}

cuando se usan 2 keywords de posicion no importa el orden, en el caso de usar porcentajes y medidas si es importante el orden ya que el primer valor
siempre correspondera al eje x y el segundo al eje y

### background gradients

permite usan fondos con gradientes, estos actuan como imagenes, precisamente se asignan por medio de la propiedad background-image y las funciones
de gradiente de CSS

### multiple background images

se pueden usar multiples background.image e igualmente aplicar las propiedades background-* de forma independiente a cada imagen
separando los valores con coma

.box {
    background-image: url('img1.png'), url('img2.png'), url('img3.png');
    background-repeat: no-repeat, repeat-x;
}

hay que tener las siguientes consideraciones

- cada uno de los valores aplican a la imagen segun el orden
- cuando el numero de valores para los atributos es menor al numero de imagenes, se ciclan esas propiedades
    de manera que en ejemplo anterior img3 tendria el valor de no repeat y si existiera un cuarto elemento
    este tendria el valor de repeat-x
- el orden de declaracion va de mayor a menor relevancia, la primera imagen es la capa superior, por lo que en caso
    de que se sobrepongan las imagenes, las partes que se veran visibles iran en funcion del orden en que fueron declaradas

### background attachment
propiedad que define como se va a comportar el fondo cuando se hace scroll en el contenido, tiene 3 posibles valores:

- scroll - el fondo esta en una posicion fija, tanto cuando se hace scroll en el contenido como en la pagina
- fixed - el fondo se mueve cuando se hace scroll en la pagina, pero no cuando se hace scroll en su contenido
- local - el fondo no se mueve cuando se hace scroll en la pagina, pero si se mueve cuando se hace scroll en su contenido

esta propiedad solo tiene efecto cuando hay contenido sobre el cual hacer scroll.

### background shorthand
el uso de background permite que se asignen todas las propiedades de backgroun en una sola regla,
es importante tener en cuenta las siguientes consideraciones:

- el valor de background-color siempre va despues de la ultima coma
- el valor de background-size debe de ir despues de background-position separado con el caracter /

en caso de que se usen **multiples** fondos usando el **shorthand background** se deben de separar las declaraciones de cada uno con coma

### borders
las propiedades de border puede ser aplicado a cada lado de un elemento de manera independiente o utilizando el shorthand border
que aplica las propiedades a todos los bordes

h2 {
    border: 1px solid black;
}

### rounded corners
mediante la propiedad shorthand border-radius se pueden redondear todas las esquinas de un elemento, esta propiedad puede recibir:

- 2 valores: corresponden a radius horizontal y radius vertical (se declaran en ese orden)
- 1 valor: el mismo valor se aplica a radius horizontal y radius vertical

alternativamente se pueden usar las propiedades longhand que permiten redondear esquinas especificas como border-top-right-radius 
que recibe el valor del radius de la esquina superior derecha y puede ser uno o dos valores, cada esquina tiene su propiedad longhand

## usando diferentes direcciones de texto

generalmente usamos una orientacion de izquierda a derecha horizontal en css y de arriba hacia abajo, esa es la forma por defecto de CSS,
pero tambien tiene soporte para renderizar los elementos en distintas direcciones (como en el caso de las escrituras arabiga y japonesa),
a la forma en que el contenido y especificamente el texto se comporta, donde se posiciona y en que direccion va se le conoce como writing modes
y esta propiedad nos permite cambiar el comportamiento predeterminado

la propiedad writing-mode permite indicar si el texto es horizontal o vertical y recibe los siguientes valores:
- horizontal-tb - direccion del flujo de bloque de top-to-bottom, el texto es horizontal (modo predeterminado)
- vertical-lr - direccion del flujo de bloque de left-to-right, el texto es vertical
- vertical-rl - direccion del flujo de bloque de right-to-left, el texto es vertical

### writing modes y layout (block o inline)
como ya vimos anteriormente hay elementos que se muestran como block o inline, el texto es uno de ellos y la forma en que se muestra (inline y block)
esta relacionada con el writting mode y no con la pantalla fisica

en el modo horizontal lo bloques se muestran de arriba hacia el fondo (top-to-bottom) y la direccion del texto es inline hacia la izquierda o derecha,
en contraste en los modos verticales los bloques se muestran horizontalmente hacia la izquierda o derecha y el texto es inline de arriba hacia el fondo

cuando cambiamos el writing mode, estamos cambiando que direccion es bloque y que direccion es inline, la **dimension bloque** es la direccion en que se
muestran los bloques dependiendo el writing mode que se este usando y la **dimension inline** es siempre la direccion del texto

### propiedades logicas vs fisicas
aun cuando cambiamos el writing mode y por ende las dimensiones block e inline, podemos ver que las propiedades de width y height se aplican a los elementos
de la misma manera, sin importar la direccion del contenido.

en escenarios donde necesitamos que las medidas se adapten a la nueva direccion del contenido es util usar las propiedades logicas que son flow relative.

- inline-size - el tamaño de la dimension inline (en horizontal es width y en vertical height)
- block-size - el tamaño de la dimesion block (en horizontal es height y en vertical es width)

de esta manera el tamaño de las dimensiones se adapta en funcion del flujo del contenido

### propiedades logicas para border, padding y margin

las propiedades de border, padding y margin son todas propiedades fisicas, por lo que
al definirlas su efecto no considera el writing mode, afortunadamente tenemos propiedades alternativas

antes de mostrar las propiedades alternativas es importante tener en cuenta que **todas estas propiedades flow relative usan los terminos start y end**
en lugar de top-bottom y left-right (ya que end y start son mas claros para el concepto de dimesiones block e inline),

- border - border-block y border-inline como shorthands, border-block-start y border-block-end como longhands
- padding - padding-block y padding-inline como shorthands, padding-block-start y padding-block-end como longhands
- margin - margin-block y margin-inline como shorthands, margin-block-start y margin-block-end como longhands

border-block afecta en inicio y el final de la dimension block y border-inline afecta el inicio y final de la dimension inline
cuando la dimension block es vertical, la dimension inline es horizontal
cuando la dimension block es horizontal, la dimension inline es vertical

### valores logicos

de la misma forma que usamos valores fisicos como top, bottom, left y right, podemos usar valores logicos que corresponden a esos valores:

- block-start
- block-end
- inline-start
- inline-end

estos valores logicos son relativos al flujo y se adaptan en funcion del writing mode (de la misma manera que las propiedades) y uno de sus usos mas comunes
es cuando se usa float sobre un elemento para posicionarlo

hay que tener cuidado con el uso de float y valores logicos, ya que es experimental y de momento solo firefox lo soporta

### recomendaciones con el uso de propiedades logicas

siempre que se usen las propiedades y valores logicos se recomienda revisar el soporte que brindan los navegadores ya que son propiedades recientes,
si no se hace uso de valores distintos al predefinido de la propiedad writing-mode se puede seguir usando las versiones fisicas, aunque se espera
una transicion completa hacia los valores y propiedades logicas