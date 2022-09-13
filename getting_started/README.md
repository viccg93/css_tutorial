## Formas de usar CSS
- importando un archivo externo <link rel="stylesheet" href="styles.css">
- mediante la etiqueta <style>
- en la etiqueta de los elementos html

## arbol de renderizacion

es la representacion de los nodos y que reglas CSS se les deben aplicar, este arbol presenta
la estructura en que los nodos deben de aparecer despues de aplicar los estilos.

posteriormente se muestra el aspecto visual de la pagina, a dicha etapa se le conoce como pintura

## caracteristicas incompatibles y typos

cuando una propiedad aun no es implementada por el navegador o se ha escrito incorrectamente (typo)
el navegador va a ignorar esa regla y no todo el bloque.

cuando el navegador encuentra una regla cuya propiedad no conoce, simplemente la ignora, lo que
tambien nos permite agregar reglas previas en caso de que el navegador no incluya una propiedad muy reciente

´´´
.box {
  width: 500px;
  width: calc(100% - 50px);
}
´´´