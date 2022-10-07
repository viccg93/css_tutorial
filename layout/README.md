# introduccion

diversas tecnicas nos permiten controlar como se posicionan los elementos de una pagina web en funcion de los siguientes factores:
- su posicion y flujo en el layout de forma predeterminada
- los elementos que rodean al elemento
- el contenedor parent
- la ventana/viewport

cada una de las siguientes tecnicas tiene sus ventajas y desventajas, es importante entender como funcionan para saber cuando
usar una u otra tiene mayores beneficios

1. normal flow
2. display
3. flexbox
4. grid
5. floats
6. positioning
7. table layout
8. multiple column layout

## normal flow

es la forma en que los navegadores muestran los elementos de manera predeterminada, segun el orden en que los elementos aparecen en el codigo
notese que es ente caso la disposicion depende completamente si se trata de elementos block o inline y que estos estan sujetos al
writing mode

los metodos para modificar este comportamiento son

- propiedad display: los valores estandard son  block, inline o inline-block, los valores flexbox y CSS grid proveen de metodos de layout completos
- floats: valores como left hacen que los elementos block-level se agrupen a un lado del elemento, algo similar a las imagenes y el texto en articulos
- propiedad pisition: permite el control preciso de la posicion de cajas dentro de otras cajas, el valor predeterminado es static en el flujo normal
- table layout: caracteristicas diseñadas para dar estilo a los elementos table pueden ser usados en elementos que no son table, usando display: table
- multi-column layout: estas propiedades permiten que el contenido de un bloque se posicione en columnas de forma similar a un periodico

## display

es la propiedad que permite cambiar como se comporta un elemento, si como block o inline, teniendo la capacidad de cambiar el comportamiento predeterminado
de elemenentos como p que son block a inline o elementos a que son inline a block, alternativamente tenemos los valores de flex y grid que brindan todo
un nuevo metodo de layout

## flexbox

es un shortname del modulo css flexible box layout, permite posicionar de manera sencilla los elementos de acuerdo a una dimension, sea una fila o columna
para usar flexbox es necesario usar display: flex en el elemento parent y los hijos se convertiran en flex items

cuando se declara un contenedor como flex adquiere propiedades de manera predeterminada y son las siguientes

- flex-direction: valor inicial de row
- align-items: valor inicial de stretch en el parent y los hijos toman el mismo valor, por eso su altura luce stretch lo que implica que toman la altura 
                que tiene el contenedor, que en este caso es la altura del elemento mas alto, se alinean al inicio del contenedor y dejan un espacio
                extra al final del row

la propiedad flex se puede aplicar a los flex items y permite evitar el espacio extra, haciendo que los flex items cubran todo el espacio del row

## grid

para usar el layout de grid se debe indicar con la regla display: grid, ademas en el contenedor podemos usar las propiedades
- grid-template-columns
- grid-template-rows
- gap

estas propiedades nos permiten definir las filas, columnas y el gap, los elementos child se van a ir acomodadndo en las celdas disponibles de acuerdo
a las filas y columnas definidas, llenando primero las filas.

cuando se usa el layout definido por el parent no se requiere que se use alguna reglas especifica a los elementos child

cuando es necesario que un elemento use mas de una fila o columna, se usan las propiedades

- grid-column
- grid-row

estas propiedades reciben el inicio y final del elemento en cuanto a filas y columnas, geenrando spans o elementos multi fila y multi columna

## floats

esta propiedad permite retirar un elemento del flujo normal y posicionarlo a la izquierda o derecha, haciendo que los elementos block level que estan
que estan a su alrededor tambien cambien su comportamiento, ya que estos se van a flotar a su alrededor

en el diseño web moderno la unica practica relevante de esta propiedad es lograr el efecto de texto que envuelve a un elemento, que esta flotado y
tiene un margin para generar espacio entre el elemento y el texto

los valores que puede recibir la propiedad son:
- right
- left
- none (valor por defecto)
- inherit (hereda el mismo float que su parent)

## positioning

las tecnicas de posicionamiento permiten que un elemento sea desplazado de su posicion dentro del flujo normal, sin embargo el posicionamiento
es una tecnica que no se usa para generar los layouts principales de una pagina, se usa para posicionar con mayor detalle elementos especificos

hay 5 tipos de posicionamiento

- statico: posicionamiento por defecto
- relativo: permite posicionar en funcion de la posicion del elemento en el flujo normal
- absoluto: permite posicionar un elemento, pero fuera del flujo normal, se posiciona en base al parent root (como si fuera una capa nueva)
- fixed: similar a absoluto, pero el posicionamiento se hace en funcion del viewport, no a otro elemento, por lo que el elemento es siempre visible
- sticky: similar a relative hasta que el elemento golpea cierto offset en el viewport, entonces se comporta como fixed

## table layout

es un tipo de layout arcaico en el que se usan propiedades css de tablas a elementos que no son tablas o elementos de las mismas, tiende
a ser problematico debido a que se usa una estructura inflexible, que es semanticamente incorrecta y pesada en terminos de markup
ademas de dificil de depurar, su uso solo se recomienda en navegadores antiguos que no tienen soporte para flexbox o grid

## multiple column layout

tecnica en la que un contenedor puede dividir su contenido en columnas, mediante el uso de column-count o column-width

# normal flow

es la forma en que se posicionan los elementos de manera predeterminada, es recomendable incluso tener una estructura
legible que es facil de leer, ya que permite el acceso desde navegadores muy limitados y es la mejor forma de iniciar
una pagina web

## puntos importantes en el normal flow

- el proceso inicia con las boxes de los elementos que se prosicionan agregando las propiedades margin, padding y border 
    definiendo asi el espacio donde va el content, esta estructura es el box model
- por defecto el contenido de un elemento block ocupa todo el espacio inline disponible de su parent y crece en la dimension
    block para abarcar todo su contenido
- los elementos inline tienen el tamaño de su contenido, no se pueden dimensionar y se encuentran contenidos en elementos block
- para controlar las dimensiones de un elemento intrinsecamente inline, se debe de usar display: block o display: inline-block
- los elementos block estan sujetos a la direccion de flujo de block, la cual esta sujeta al writing mode y se cada elemento
    block se posiciona en una nueva linea
- los elementos inline se posicionan en la misma linea con elementos adyacentes o wrapped, siempre que el espacio disponible
    sea suficiente en la dimension inline del elemento block parent, en caso contrario el contenido que hace overflow se
    va a mover a una nueva linea
- si 2 margenes veticales colapsan, siempre se mantiene el mayor y el menor no se considera, no se realiza una suma de margenes
    el margin collapsing solo es relevante en la direccion vertical