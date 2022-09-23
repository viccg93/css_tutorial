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

## overflow

cuando el contenido excede el area de un elemento (que tiene dimensiones fijas y no puede ampliarse) css siempre va a evitar la perdida de datos,
por lo que va a mostrar el contenido sobrepuesto.

este comportamiento se puede cambiar mediante las siguientes propiedades

- overflow - permite controlar el comportamiento del contenido cuando hace overflow en ambos ejes
- overflow-x - permite controlar el comportamiento del contenido cuando hace overflow en el eje x
- overflow-y - permite controlar el comportamiento del contenido cuando hace overflow en el eje y

a cada una de estas propiedades se les pueden asignar los siguientes valores

- hidden - oculta la porcion de informacion que hace overflow
- scroll - la informacion es contenida, pero es visible mediante el scroll
- auto - muestra el scroll solo cuando la informacion hace overflow, en caso contrario el elemento oculta el scroll

hay que tener cautela al examinar el caso de uso adecuado, ya que puede haber perdida de informacion, ademas de que
en muchos casos (como el texto que hace overflow por sus dimensiones) son casos con otras soluciones mas adecuadas

ya que el sobreuso de scroll puede afectar de manera negativa la experiencia de usuario

### block formatting context

cuando se usan los valores de scroll o auto, se esta creando un BFC, lo que significa que el contenido del elemento
tiene su propio layout contenido, en terminos practicos esto implica que ningun elemento externo puede sobreponerse
sobre el contenido interno del elemento y tampoco el contenido externo puede sobreponerse con el layout externo,
la razon de este comportamiento es brindar una experiencia consistente de scroll

### overflow en el diseño web

las tecnicas de layout modernas consideran el overflow, trabajan sin consideraciones o dependencias a la cantidad de contenido
que se mostrara en los elementos de la pagina web

pero eso no siempre fue el estandar, por lo que es comun encontrar sitios legacy que usan contenedores con height fijas para alinear
los bottom de las cajas, algo que tiene como consecuencia un diseño fragil en el que es comun que el contenido se sobreponga

siempre hay que tener en cuenta que el uso de los valores de hidden y overflow esta reservado para casos especificos como por ejemplo
donde de manera intencionada se ha diseñado tener un scroll, abusar de estas caracteristicas impacta negativamente en la experiencia
de usuario

## valores y unidades

### valores clasificados como numericos

tambien conocidos como numbers, son todos los siguientes data types (value types)

| data type           | descripcion                                                             |
|        :----:       |                           :----:                                        |
| \<integer\>         |       numeros enteros como 255 o -55                                    |
| \<number\>          |       numeros decimales con como 0.255, 128 o -1.2                      |
| \<dimension\>       |    numeros con una unidad concreta como 45deg o 10px                    |
| \<percentage\>      |   un porcentaje representa una porcion de algun otro valor como 50%     |

el data type \<dimension\> es una sombrilla para los tipos \<length\>, \<angle\>, \<time\> y \<resolution\>

### length
uno de los tipos numericos mas comun es \<length\> que son valores con una unidad concreta como 10px o 30em, las unidades de
este tipo pueden ser absolutas o relativas

#### length unidades absolutas
son unidades concretas que no estan en funcion de otros elementos y generalmente siempre tienen la misma medida

|unidad	|nombre                 | unidad equivalente a           |
|:----:	|:----:                 |              :----:            |
|cm 	|centimetros 	        |1cm = 37.8px = 25.2/64in        |
|mm 	|milimetros 	        |1mm = 1/10th de 1cm             |
|Q 	    |cuartos de milimetros 	|1Q = 1/40th de 1cm              |
|in 	|pulgadas 	            |1in = 2.54cm = 96px             |
|pc 	|Picas 	                |1pc = 1/6th de 1in              |
|pt 	|puntos 	            |1pt = 1/72nd de 1in             |
|px 	|pixeles 	            |1px = 1/96th de 1in             |

la unidad mas utilizada son los pixeles (px) ya que la mayoria de las otras unidades son de mayor utilidad
para medios impresos que pantallas, normarmente no se usan centimetros en pantallas

#### length unidades absolutas
son unidades son relativas a las medidas de otros elementos como puede ser el font size del elemento parent
o el tamaño del viewport

la ventaja de usar unidades relativas es que con una planeacion cuidadosa se puede lograr que los elementos
escalen con relacion a todo lo demas que se encuentra en la pagina web

|unidad	    |relativa a |
|:----:	    |:----:     |
|em 	    |font-size del parent en caso de propiedades tipograficas como font-size, font-size del propio elemento en caso del resto de propiedades (como width) |
|ex 	    |x-height de la fuente del elemento |
|ch 	    |el ancho del grafo "0" de la fuente del elemento |
|rem 	    |tamaño de la fuente del elemento root |
|lh 	    |Line height del elemento |
|rlh 	    |Line height del elemento root, cuando se usa en font-size o line-height del elemento root, es relativa a los valores initial |
|vw 	    |1% del viewport's width |
|vmin 	    |1% de la dimension mas pequeña del viewport |
|vmax 	    |1% de la dimension mas larga del viewport |
|vb 	    |1% del tamaño del bloque contenedor inicial en la direccion de la dimension block del elemento root |
|vi 	    |1% del tamaño del bloque contenedor inicial en la direccion de la dimension inline del elemento root |
|svw, svh 	|1% del width y height del small viewport, respectivamente |
|lvw, lvh 	|1% del width y height del large viewport, respectivamente |
|dvw, dvh 	|1% del width y height del dynamic viewport, respectivamente |
|vh 	    |1% del height del viewport |

cabe destacar que el viewport es la region que esta siendo visualizada en un instante dado, dicho de otra forma es la porcion del documento
que se esta visualizando en un momento dado, aquello que no se ve en la pantalla, pero es parte del documento se puede considerar
fuera del viewport

el viewport de diseño (layout viewport) es el viewport inicial y la porcion de viewport visible se considera visual viewport
el visual viewport es el que se ve afectado cuando se hace zoom

#### ems y rems
un em es una unidad cuyo valor depende del valor del font-size del parent, por lo que a medida que se van generando jerarquias este valor
va a ir cambiando por ejemplo

-|html - font size = 16px, para todos los descendientes directos 1em = 16px
--|body - font size = 1.5em (16px * 1.5 = 24px), para todos los descendientes directos 1em = 24px
---|div - font size = 1.5em (24px * 1.5 = 36px), para todos los descendientes directos 1em = 36px

aunque body y div tienen un font-size = 1.5em, el valor de em cambia en funcion del parent de cada elemento

un rem es similar a em, solo que este no depende del valor del font-size del parent, depende del valor del font-size del elemento root (el mayor parent)
por lo que no importa el nivel en que se encuentre en la jerarquia un elemento, 1 rem siempre esta en funcion del font-size del elemento root (generalmente html)

-|html - font size = 16px, para todos los descendientes directos 1em = 16px
--|body - font size = 1.5rem (16px * 1.5 = 24px)
---|div - font size = 1.5rem (16px * 1.5 = 24px)

el valor de rem siempre es el mismo por que hace referencia exclusivamente al font-size del elemento root, solo cambiaria si se cambia root

### porcentajes
los porcentajes son porciones del elemento parent, por ejemplo cuando se establece que width es 50% de un elemento, significa que este elemento tendra
un width del 50% del width su parent, si indica que su font-size es 80%, lo es con respecto al font-size de su parent y asi para todas las propiedades
que aceptan valores de porcentajes (\<length-percentage\>)

### numeros
finalmente se pueden usar numeros que no tengan unidad de medida, un ejemplo del uso de numeros es la propiedad opacity que recibe un valor decimal entre 0 y 1
si el valor de opacity es mas cercano a 1, la caja y sus elementos son mas opacos y entre mas cercano a 0, la caja y sus elementos seran mas transparentes

### color
existen multiples valores para especificar el color, los metodos mas comunes y con mayor soporte son los siguientes:

- color keywords (valores de tipo \<color\>) como *rebeccapurple, blue, red*
- valores rgb hexadecimales como *#02798b, #128a7d*
- valores rgb mediante la funcion rgb() como *rgb(255,255,255)*
- valores rgba mediante la funcion rgba() como *rgba(255,255,255,0.3)*, similar a rgb pero con el componente alpha para la transparencia

la principal diferencia entre usar el valor rgba() y la propiedad opacity es que alpha aplica al color que se esta especificando mientras opacity aplica
al elemento y todo su contenido

los navegadores que implementan el standard CSS de nivel 4 aceptan que la funcion rgb() tenga el parametro de alpha como si fuera rgba(), por lo que
ambas funciones se comportan igual, usar rgb() o rgba() queda a preferencia del programador, pero usar las funciones de forma separada generalmente
brinda un mejor soporte y permite identificar de una manera mas rapida donde se esta usando transparencia en el codigo

alternativamente podemos especificar los valores de color con las funciones 
- hsl mediante la funcion hsl() como *hsl(188, 97%, 28%)*
- hsla mediante la duncion hsla() *hsla(188, 97%, 28%,0.3)*

hsl es un modelo de color que usa **hue, saturation y lightness** de manera alternativa a rgb y que esta basado en la rueda de color

- hue es la sombra base del color, representa los angulos de la rueda (0-360)
- saturation indica que tan saturado es el color (0% - 100%) donde 0% es auscencia de color
- lightness indica que tan brillante es el color (0% - 100%) donde 0% es sin luz y 100% completamente lleno de luz

se pueden usar ambos modelos, pero se recomienda usar solo uno por proyecto para brindar uniformidad

### imagenes
el data type \<image\> representa que una imagen es valor valido, puede ser un archivo al que se apunta mediante url() o un gradiente

- url()
- linear-gradient() o cualquier otra funcion de gradiente

existen otras formas de apuntar a imagenes como element(), image(), cross-fade() y algunas mas pero debido a que no tienen un soporte
generalizado, las mas convenientes son url() y gradientes

### position
el data type \<position\> representa un set de coordenadas 2D, una propiedad que admite valores de este tipo es background-position
esta compuesta por 2 valores donde el primero es la posicion horizontal y el segundo la vertical, admite:
- keywords como top, bottom, left, right y center
- valores de tipo lenght que indican offsets (primer valor es con respecto al left y el segundo al top)
- combinacion de keyword y lenght

### identificadores y strings

cuando usamos keywords como rebeccapurple o center no necesitamos usar comillas por que son identificadores que CSS entiende, pero
para especificar contenido que generamos, se usan strings y estas deben de ir en comillas, para indicar que es un texto y no
un identificador que se debe de interpretar

### funciones
son un grupo de data types que realizan una funcion repetitiva, ejemplo de estos types son calc() y url()

## sizing items

existen distintas formas de especificar el tamaño de los distintos elementos, es importante entender como funcionan y en que casos
es preferible usar una u otra

### tamaño natural o intrinseco

el tamaño natural se puede definir como las medidas que tiene un elemento sin que se le apliquen reglas CSS y aun sin estas reglas
pueden tener un tamaño dado por caracteristicas intrinsecas al elemento o su contenido, es decir que no definimos nosotros
sino son parte del elemento, entre estas caracteristicas intrinsecas se puede encontrar el tamaño.

dos ejemplo pueden ser una imagen que ya tiene un tamaño propio y al agregarla a nuestra pagina se mostrara con dicho tamaño
que no definimos nosotros, es intrinseco a la imagen

lo mismo pasa con un div, al declararlo tiene un valor de height (dimension block) igual a 0 y conforme la cantidad de contenido
que tenga ese elemento vaya cambiando su dimension tambien lo hara, es decir su medida es intrinseca a su contenido

### tamaño especifico

cuando se establece un valor expecifico al tamaño de un elemento, este queda limitado a ese tamaño sin importar el contenido
o las dimensiones intrinsecas, a estas medidas definidas se les conoce como medidas extrinsecas

se debe de tener cuidado al fijar las dimensiones de los elementos (en especial el height) por que es posible que el contenido
sea mayor que las dimensiones declaradas y nos enfrentemos a contenido que hace overflow

### uso de porcentajes
cuando se usan porcentajes para definir las medidas extrinsecas de un elemento, lo mas importante que debemos de considerar
es **en relacion a que elemento esta funcionando ese porcentaje**, normalmente es el elemento parent, si tenemos un div
wrapper que tiene un inline-size de 100% intrinsecamente y contiene un elemento div que tiene un inline-size de 50% extrinseco,
este porcentaje funciona en base a su parent, si la propiedad del parent cambia a 50px, la del div contenido sera de 25px (50%)

siempre hay que tener cuidado al definir un valor en porcentaje, de cual es la medida a la que se esta refiriendo ese porcentaje

### uso de porcentajes en margin y padding
cuando definimos el padding o el margin con porcentajes, su comportamiento es distinto, ya que el porcentaje que se aplica
a todos los lados siempre esta en relacion la dimension inline

se podria pensar que para los lados top y bottom el porcentaje esta en funcion de la dimension block, pero no es asi, siempre
que se usan porcentajes en margin y padding el porcentaje esta en funcion solo de la dimension inline para todas las dimensiones

debido a ese comportamiento, usar porcentajes en esas propiedades es de gran utilidad para tener margins y padding uniformes
a un porcentaje de la dimension inline

### max y min sizes

son propiedades que definen el tamaño minimo o maximo que puede tener una dimension, lo que es util cuando queremos que una caja
pueda crecer o reducirse si su tamaño aumenta o disminuye pero solo hasta ciertos limites

las propiedades de dimensiones minimas
- min-width - establece la dimension minima de width, el ancho menor maximo que un elemento tendra
- min-height - establece la dimension minima de height, por ejemplo un div tendra como limite este height pese a que no tenga contenido

las propiedades de dimensiones maximas
- max-width - establece la dimension maxima de width
- max-height - establece la dimension maxima de height

un uso comun de estas propiedades es en imagenes que pueden ser mas grandes o mas pequeñas que el elemento que las contendra,
obligando a que estas escalen sus dimensiones

si la imagen tiene una dimensiones intrinsecas menores a max-height y max-width, estas se respetaran, solo en el caso de que la imagen
supere los valores de estas propiedades se hara un escalado, tal como lo hace height y width

el mismo comportamiento sucede si las dimensiones son mayores a min-height y min-width, al ser mayores se mantendran sus dimensiones
intrinsecas, solo cuando estas dimensiones sean menores se realizara un eslado como lo hace height y width

esta tecnica es usada para hacer imagenes responsivas, pero es importante que se evite usar con imagenes muy largas, ya que
en ese caso se deberian tener imagenes del tamaño adecuado y evitar la carga y escalado de una imagenes muy pesadas, algo
que puede generar costos y hacer el sitio web lento

### unidades viewport

el viewport es la unidad visible de una pagina web, es decir que esta sujeta a factores como el tamaño de la ventana
o el dispositivo donde se visita la pagina

las unidades del viewport son vw y vh que representan el 1% del tamaño del width y height del area visible respectivamente

cuando se indica que un elemento es 10vw se esta indicando que dicho elemento siempre tendra un width del 10% del arrea visible

## imagenes media y formularios

### replaced elements

las imagenes y videos son descritos como replaced imagenes, debido a que CSS no puede afectar su layout interno, solo su posicion
en conjunto con los demas elementos de la pagina, aunque hay multiples cosas que podemos hacer con estos elementos

algunos de estos replaced elements como las imagenes y videos tienen un aspect ratio definido por la relacion entre sus dimensiones
horizontal y vertical y son mostrados de manera predeterminada con estas dimensiones intrinsecas

### dimesionando imagenes

cuando posicionamos una imagen en un contenedor, esta se muestra con sus dimensiones intrinsecas, por lo que si es mas grande que el contenedor
en cualquiera de sus dimensiones lo desbordara

ese es el comportamiento predetermindo, algo que podemos cambiar la propiedad max-width: 100% que hara que el ancho de la imagen nunca sea
mayor al de su contenedor, por lo que una imagen mas grande se va a escalar para que ocupe el ancho del contenedor (esta tecnica tambien sirve
con video y iframe)

cuando usamos esa tecnica podemos encontrarnos que la imagen se hizo mas pequeña y ya no cubre todo el contenedor, esto es por que al hacerse
una dimension mas pequeña, la otra dimension tambien lo hace en razon del ratio, la propiedad que nos sirve en ese escenario es object-fit

object fit tiene los siguientes valores

- cover: hace que la imagen cubra todo el contenedor manteniendo el aspect ratio, por lo que recorta la imagen
- contain: escala la imagen hasta que entre en el contenedor, cuando el ratio es distinto entre la imagen y el contenedor se genera "letterboxing"
- fill: hace que la imagen cubra todo el contenedor sin respetar el aspect ratio

### replaced elements en el layout

los elementos replaced se comportan de manera ligeramente distinta cuando se usan tecnicas de layout, por ejemplo cuandos e usa flex o grid
los elementos se adaptan para cobrir el area completamente pero las imagenes no tendran este comportamiento, lo que van a hacer de manera
predeterminada es posicionarse al inicio del grid o flex y no adaptaran sus dimensiones

para forzar que la imagen se adapte para llemar las dimensiones de una celda de un grid por tomar un ejemplo, podemos especificar sus dimensiones
al 100%, aunque esta tecnica "estira" la imagen por lo que es poco probable que este sea el resultado deseado

### formularios

los elementos form pueden ser un reto cuando se trata de darles estilo con CSS, por lo que es recomendable ver la guia detallada del modulo,
ya que estos elementos tienen sets de elemenentos que pueden ser estiliados con pocos o ningun detalle como en el caso
de form, label o input text

hay algunos elementos que requieren tecnicas mas complejas como checkboxes o radio buttons y algunos como datetime picker
o color picker cuyo funcionamiento esta totalmente en manos del SO host, aun asi es importante verigficar el funcionamiento de los formularios
en varios navegadores o en los que sabemos que nuestro sitio web sera consultado

la mayoria de los elementos de un formulario son input, por lo que se debe incluir el tipo en el selector

input[type="text"]

al diseñar y dar estilo a un formulario siempre se debe tener en cuenta que sea facil de identificar como un elemento interactivo

### herencia en formularios

en algunos navegadores propiedades relacionadas a font no son heredadas de forma automatica por lo que es necesario crear
el bloque de manera explicita para tener certeza de que los formularios tienen las mismas propiedades de font que body o el parent

la regla debe de ser la siguiente:

button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
}

### elementos del formulario y box-sizing

los elementos del formulario usan distintas reglas box-sizing para diferentes widgets, por lo que para tener mayor consistencia a la hora de
dar estilo a los formularios y en la experiencia de uso es recomendable poner los margins y paddings en 0 y border-box antes de aplicar
el estilo

button,
input,
select,
textarea {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}


### otras configuraciones utiles

ademas de las reglas mencionadas, algo util es establecer el overflow en auto para los elementos textarea, lo cual previene
que ie muestre el scrollbar cuando no se requiere

textarea {
  overflow: auto;
}

### poniendo todas las propiedades en reset
las siguientes reglas agrupan las consideraciones anteriores y usarlas antes de dar el estilo a los elementos del formulario
ayuda a tener un resultado mas consistente en todos los navegadores

button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

textarea {
  overflow: auto;
}

## styling tables

### table layout
 esta propiedad permite especificar como se comportara el layout de la tabla, de manera predeterminada las columnas tienden a tener
 el tamaño del contenido que esta en ellas, para evitar este comportamiento y tener unos mas predecible es buena idea usar el valor
 de fixed

 fixed indica que todas las columnas van a tener el tamaño de su header, lo cual permite tener columnas uniformes, y ademas usamos
 porcentajes o unidades relativas, vamos a poder tener tablas responsivas

 ### border-collapse
 esta propiedad permite que se cambie el comportamiento de los bordes, de manera predeterminadad los border de las celdas tienen
 un espacio entre ellos, con el valor collapse hacemos que solo sea un borde entre ambas celdas retirando el espacio, el uso de
 collapse es una buena practica

 ## debugging css
 la principal herramienta para depurar css son las dev tools que incluyen los naegadores, aunque la premisa puede ser la misma
 todas tienen particularidades que pueden ser mas utiles en ciertos casos

 en el caso de firefox, es de gran utiidad poder visualizar el box model, modificar reglas en tiempo real y poder generar y guardar 
 nuevas reglas y hojas de estilo desde el propio devtools

## organising css

### recomendaciones
- usar comentarios para marcar secciones logicas
- usar comentarios que expliquen situaciones que no son claras solo con el codigo (justificar una desicion)
- evitar reglas excesivamente especificas, en favor de reglas que puedan ser utilizadas por multiples elementos
- dividir hojas de estilo grandes en hojas mas pequeñas, dividiendo las reglas que aplican a ciertos modulos es una opcion

### metodologias CSS

#### OOCSS

object oriented CSS es una metodologia que tiene como premisa separar las reglas CSS en objetos reutilizables, que se pueden
aplicar en todo el sitio.

un ejemplo claro de la ventaja de usar esta metodologia es cuando tenemos bloques CSS donde hay reglas en comun, lo cual podria ser
un indicativo de que exite una abstraccion que puede ser extraida

estas son 2 reglas muy similares

.comment {
  display: grid;
  grid-template-columns: 1fr 3fr;
}

.list-item {
  display: grid;
  grid-template-columns: 1fr 3fr;
  border-bottom: 1px solid grey;
}

la unica diferencia es que list-item usa la propiedad border-bottom, en caso de requerir una nueva variante, tendriamos que repetir
las propiedades en comun, alternativamente podemos hacer lo siguiente siguiendo OOCSS

.media {
  display: grid;
  grid-template-columns: 1fr 3fr;
}

.list-item {
  border-bottom: 1px solid grey;
}

se ha abstraido las caracteristicas en comun en un nuevo objeto media, ahora todos los objetos pueden ser media y de ser el caso
pueden implementar list-item, en caso de nuevas variantes basta declarar solo las propiedades concretas de la variante e implementar
esa clase en conjunto con media

#### BEM

BEM es una metodologia que tiene como premisa 3 elementos que conforman su nombre

1. Block - entidad independiente como un button, menu, logo
2. Element -es una entidad cuya existencia depende de otra, por ejemplo un elemento de una lista o un title en un contenedor
3. Modifier - una bandera en un Block o Element que cambia su estilo o comportamiento

BEM usa underscores y dashes para indicar Elements y Modifiers respectivamente

/* componente Block */
.btn {}

/* Element que depende de el Block .btn */ 
.btn__price {}

/* Modifiers que cambian el estilo del Block .btn */
.btn--orange {}
.btn--big {}

#### otros sistemas

existen otros sistemas populares como SMACSS, ITCSS y ACSS que pueden ser usados, aunque siempre implican una curva de aprendizaje

### build systems para CSS

existen 2 tipos de build systems que nos pueden ser de ayuda al generar hojas de estilo

1. pre-procesadores: son procesadores que toman codigo de acierdo a la sintaxis que define el lenguaje del procesador y que generalmente
                      permite escribir los estilos de forma mas programmatic y la compilacion de este codigo genera las hojas de estilo
                      resultantes, los mas famosos son SASS y LESS
2. post-procesadores: son procesadores que actuan sobre las hojas de estilo generalmente con propositos de minificacion y optimizacion,
                      uno de los mas famosos es nanocss

estas herramientas tienen sus propios CLI y herramientas como webpack permiten automatizar las rutinas pre y post procesado
