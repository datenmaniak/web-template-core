#!/bin/bash

# Uso: ./monitor-css.sh <directorio> <palabra_clave> <num_lineas>
# Ejemplo: ./monitor-css.sh dist/css ".products__container .card" 20

ARCHIVO=$1
CLAVE=$2
NUM_LINEAS=$3

# ARCHIVO="$DIRECTORIO/bundle.css"

if [ ! -f "$ARCHIVO" ]; then
  echo "❌ No se encontró el archivo $ARCHIVO"
  exit 1
fi

echo "📡 Monitoreando $ARCHIVO..."
echo "🔎 Buscando la clave: $CLAVE"
echo "📄 Mostrando $NUM_LINEAS líneas a partir de la coincidencia"

# Ciclo infinito hasta que canceles con Ctrl+C
inotifywait -m -e modify "$ARCHIVO" | while read; do
  clear
  # Buscar la línea donde aparece la clave
  LINE=$(grep -n "$CLAVE" "$ARCHIVO" | cut -d: -f1 | head -n 1)
  
  if [ -n "$LINE" ]; then
    sed -n "${LINE},$((LINE+NUM_LINEAS))p" "$ARCHIVO"
  else
    echo "⚠️ No se encontró la clave '$CLAVE' en el archivo."
  fi
done
