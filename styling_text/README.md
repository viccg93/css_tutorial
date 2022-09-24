# fundamentos de estilo en texto y fuentes

las propiedades de CSS que nos permiten dar estilo al texto y fuentes generalmente caen en 2 categorias

- Font styles: propiedades que afectan la fuente del texto como la fuente especifica, el tamaño o el tipo
- text layout styles: propiedades que afectan el espaciado, interlineado y como se alinea el texto

## fuentes

- color: cambia el color del texto (incluye elementos como el underline u overline del texto controlados con text-decoration)
- font families: la propiedad font-family permite cambiar la fuente de los elementos, aunque es requisito que la fuente
                    se encuentre en el host, en caso contrario se usa una fuente default

### web safe fonts

aunque no se puede tener un control total sobre las fuentes en los hosts, existe un conjunto de fuentes que se encuentran
en la mayoria de sistemas operativos y por lo tanto pueden ser utilizadas son seguridad, este grupo se conoce como web safe fonts

|nombre             | 	tipo generico   | notas |
|Arial              | 	sans-serif      | se considera buena practica añadir Helvetica como fuente alterna, Helvetica tiene mejor aspecto y Arial mayor disp  |
|Courier New        | 	monospace 	    | algunos navegadores usan courrier (que es posiblemente anterior), es buena practica usarla como fuente alternativa  |
|Georgia            | 	serif 	        |       |
|Times New Roman    | 	serif           | al igual que en los casos anteriores Times es una fuente vieja que se recomienda usar como fuente alternativa       |
|Trebuchet MS       | 	sans-serif      | uar con cautela por que no esta disponible en la mayoria de dispositivos moviles                                    |
|Verdana            | 	sans-serif      |       |

### fuentes default

CSS define 5 nombres genericos para las fuentes, representan la ultima instancia donde el navegador intenta proveer una fuente que sea apropiada

- serif
- sans-serif
- monospace
- cursive
- fantasy

### font stacks

mediante la propiedad font-family se puede proveer una lista de fuentes o stack, en donde el navegador ira buscando en el orden de declaracion
una fuente disponible, es una buena practica poner una fuente generica al final, que seria el caso donde ninguna de las fuentes anteriores
estuvo disponible

p {
  font-family: "Trebuchet MS", Verdana, sans-serif;
}

las fuentes que tienen espacios en su nombre se deben colocar con comillas

### font size

entre las distintas opciones de length types, las mas comunes son

- pixeles (px): el numero de pixeles de altura de la fuente, el valor cumputado final es generalmente el mismo en la mayoria de situaciones
- em: unidad relativa al font-size del parent (especificamente el ancho de la letra M mayuscula contenida en el parent), puede ser confuso
        en situaciones donde hay multiples elementos nested y se cambia el valor del font-size
- rem: similar a em, pero siempre es relativa al font-size del elemento root, por lo que simplifica escenarios donde hay elementos nested

se recomienda en la mayoria de los casos usar rem y evitar cambiar el valor del font-size de contenedores donde sea posible

### font style, font weight, text transform y text decoration

- font-style: activa o desactiva el uso de texto en cursiva, sus valores son normal, italic y oblique (version de fuente cursiva simulada)
- font-weight: indica la intensidad de la fuente, sus valores mas comunes son normal, bold, lighter, bolder, 100-900
- text-transform: permite modificar el texto, sus valores son none, uppercase, lowercase, capitalize y full-width
- text-decoration: permite agregar decoraciones al texto, sus valores son none, underline, overline y over-through

### text drop shadows

se pueden agregar sombreados al texto mediante la propiedad text-shadow que recibe 4 valores en el siguiente orden:

1. x-offset: desplazamiento horizontal
2. y-offset: desplazamiento vertical
3. blur: dispersion de la sombra, predeterminado es 0, entre mas grande sea el valor, mayor la dispersion
4. color: el color de la sombra, si no se indica toma el mismo que el color del elemento

se pueden agregar multiples shadows separando los conjuntos de valores con coma

## text layout

### text alignment

permite especificar la posicion del texto dentro de su content box, los valores que admite son:

- left
- right
- center
- justify (usar con cautela sobre todo si el texto incluye cadenas largas, en ese escenario es recomendable usar en conjunto con hypens)

### line height

es el height de cada linea de texto, puede recibir la mayoria de unidades length y size, pero ademas puede recibir numeros sin unidad
que funcionan como multiplicadores en funcion del font-size del elemento funcionando como interlineado.

el valor recomendado es entre 1.5 y 2.0 (interlineado doble)

### letter and word spacing

las propiedades letter-spacing y word-spacing nos permiten indicar el espacio entre letras y palabras respectivamente, la propiedad admite
la mayoria de las unidades length y sizing

### propiedades utiles

**font styles**

- font-variant: cambia entre las alternativas small caps font y normal font
- font-kerning: activa o desactiva las opciones de kerning
- font-feature-settings: activa o desactiva las caracteristicas OpenType font
- font-variant-alternates: controla el uso  de alternate glyphs
- font-variant-caps: controla el uso de alternate capital glyphs.
- font-variant-east-asian: controla el uso de alternate glyphs para East Asian scripts, como japones y chino
- font-variant-ligatures: controla cuales ligatures and contextual forms son usadas en el texto
- font-variant-numeric: controla el uso de alternate glyphs en numeros, fracciones y cardinal markers
- font-variant-position: controla el uso de alternate glyphs pequeños posicionados como superscript o subscript
- font-size-adjust: ajusta el tamaño visual de la font independientemente del valor actual de su font size
- font-stretch: cambia la fuente a su version stretched, si esta disponible
- text-underline-position: especifica la posicion del underline
- text-rendering: intenta realizar una optimizacion del texto

**text layout styles**

- text-indent: especifica el espacio horizontal izquierdo que deb ser dejado antes de inciar la primera linea de texto
- text-overflow: define como sera señalizado el texto que hace overflow.
- white-space: define el comportamiento de los espacios y saltos de linea.
- word-break: especifica en que situaciones dar un salto de linea si el texto hace overflow
- direction: define la direccion del texto (la direccion del texto es dependiente del lenguaje y es mejor dejar esa tarea a HTML)
- hyphens: activa o desactiva el uso de hypens para los lenguajes soportados
- line-break: relaja o endurece el line break para os lenguajes asiaticos
- text-align-last: define como la ultima linea de un bloque o linea de texto se alinea antes de forzar el salto de linea
- text-orientation: define la orientacion del texto de una linea
- overflow-wrap: especifica si el navegador deberia de generar saltos de linea dentro de las palabras para evitar que el texto haga overflow
- writing-mode: define el flujo del texto, horizontal o vertical

### propiedad font como shorthand

la propiedad font es un shorthand para muchas propiedades de font y su estructura es la siguiente

font: font-style font-variant font-weight font-stretch font-size / line-height font-family

cabe destacar que las unicas propiedades mandatorias son font-size y font-family y se debe de usar forward slash entre font-size y line-height

# styling lists

## defaults

las propiedades predeterminadas de las listas y sus elementos son los siguientes:
- los elementos ul y ol tienen margins top y bottom de 16px (1em) y padding left de 40px (2.5em)
- los elementos li no tienen espaciados (margin y padding)
- los elementos dl tienen margin top y bottom de 16px (1em) sin padding
- los elementos dd tienen margin left de 40px (2.5em)
- los elementos p tienen margin top y bottom de 16px (1em)

## espaciado en las listas

cuando se esta dando estilo a una lista se necesita ajustar el espacio vertical entre ella y los elementos de alrededor, lo cual se conoce como vertical rhythm
ademas del mismo espaciado horizontal para lograr uniformidad

el espaciado vertical se logra agregando reglas para font-size y line-height a la pagina y a los elementos de las listas respectivamente

## estilos especificos de las listas
existen tres propiedades principales que permiten cambiar el comportamiento de las listas y aplican a los elementos ul y ol

- list-style-type: permite modificar los bullets de la lista
- list-style-position: indica la posicion de los bullets (inicio, dentro o fuera de la lista)
- list-style-image: permite usar una imagen como bullet

ademas de que existe la propiedad shorthand list-style que permite asignar las propiedades anteriores

algo que se debe tener en cuenta cuando se usa list-style-position, es que en el valor inside los bullets se encuentran el el content box, por lo tanto alineados
a la izquierda y cuando se usa el valor outside los bullets pasan a estar en el padding-box por lo que se encuentra alineado a la derecha o lo que realmente se
encuentra alineado es el texto de los elementos de la lista y no los bullets

la propiedad list-style-image recibe el url de la imagen, tal como cuando se usa background-image, aunque su uso es muy limitado en comparacion background
se recomienda usar background debido a que permite dimensionar y posicionar la imagen, entre otras posibilidades

## controlando el conteo de las listas
para controlar el valor de los bullets y la forma en que se comportan tenemos tres atributos que generalmente se agregan en el html

- start: con esta propiedad se indica el valor numerico en el cual iniciara el conteo (ascendente de manera predeterminada), se usa start="1" en ul/ol
- reversed: este atributo indica que el conteo sera descendiente, basta con agregar el atributo a la etiqueta en ul/ol
- value: permite establecer cual sera el valor del elemento de forma especifica, se usa value="2" y va en la etiqueta li