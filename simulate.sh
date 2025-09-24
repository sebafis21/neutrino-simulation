#!/bin/bash
# Script: simulate.sh

# tiempo del proceso
tiempo_inicio=$(date +%s)

# para generar los 1000 archivos
for i in $(seq -w 0001 1000); do
    archivo="${i}.txt"
    marca_tiempo=$(date +"%Y-%m-%d %H:%M:%S")
    neutrinos=$((RANDOM % 11))
    echo "Tiempo: $marca_tiempo" > "$archivo"
    echo "Neutrinos detectados: $neutrinos" >> "$archivo"
done

# juntar archivos en uno
cat *.txt > results.txt

# tiempo que se demora en ejecutar
tiempo_fin=$(date +%s)
tiempo_total=$((tiempo_fin - tiempo_inicio))

# cálculos de promedios seg y milisegundos
promedio_seg=$(awk "BEGIN { printf \"%.6f\", $tiempo_total/999 }")
promedio_ms=$(awk "BEGIN { printf \"%.3f\", ($tiempo_total*1000)/999 }")

# Guardado de la informacion del tiempo y promedio
{
    echo "Tiempo total de ejecución: ${tiempo_total} segundos"
    echo "Promedio por evento: ${promedio_seg} segundos"
    echo "Promedio por evento: ${promedio_ms} milisegundos"
} > performance.txt

