#!/bin/sh
#author: Vic_cg

echo "obteniendo ruta para archivos iniciales"
script_path=$(readlink -f "$0")
root_path=$(dirname "$script_path")
echo "ruta: $root_path"

echo "generando directorios"

capitulos=("introduccion" "normal_flow" "flexbox" "grids" "floats" "positioning" "multiple_column-layout" "responsive_design" 
            "media_queries" "legacy_layout" "supporting_older_browsers" "assesments")

for capitulo in ${capitulos[@]}
do
    if [ ! -d "$root_path/$capitulo" ]; then
        mkdir "$root_path/$capitulo"
        touch "$root_path/$capitulo/$capitulo.html"
        touch  "$root_path/$capitulo/$capitulo.css"
        echo "$root_path/$capitulo generado"
    else
        echo "$root_path/$capitulo ya existe, no se generan archivos en esta ruta"
    fi
done

echo "generando README"
touch "$root_path/README.md"
echo "ejecucion finalizada"