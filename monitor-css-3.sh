#!/bin/bash

# Uso: ./monitor-css.sh <ruta/archivo.css> <palabra_clave> <num_lineas>
# Ejemplo: ./monitor-css.sh dist/css/bundle.css ".products__container .card" 20

ARCHIVO=$1
CLAVE=$2
NUM_LINEAS=$3

if [ ! -f "$ARCHIVO" ]; then
  echo "❌ No se encontró el archivo $ARCHIVO"
  exit 1
fi

TMP_OLD=$(mktemp)
cp "$ARCHIVO" "$TMP_OLD"

echo "📡 Monitoreando $ARCHIVO..."
echo "🔎 Buscando la clave: $CLAVE"
echo "📄 Mostrando $NUM_LINEAS líneas a partir de la coincidencia"
echo "📝 Además se mostrarán los cambios detectados"

inotifywait -m -e modify "$ARCHIVO" | while read; do
  clear
  LINE=$(grep -n "$CLAVE" "$ARCHIVO" | cut -d: -f1 | head -n 1)
  
  if [ -n "$LINE" ]; then
    sed -n "${LINE},$((LINE+NUM_LINEAS))p" "$ARCHIVO"
    echo "──────────────────────────────"
    echo "📌 Cambios detectados desde la última versión:"
    diff --color=always "$TMP_OLD" "$ARCHIVO" || echo "Sin cambios relevantes"
  else
    echo "⚠️ No se encontró la clave '$CLAVE' en el archivo."
  fi

  # ⚠️ Importante: actualizar la copia SOLO después de mostrar el diff
  cp "$ARCHIVO" "$TMP_OLD"
done
