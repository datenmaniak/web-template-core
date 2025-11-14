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

TMP_OLD="./tmp_block.css"

# Función para extraer bloque
extract_block() {
  LINE=$(grep -n "$CLAVE" "$ARCHIVO" | cut -d: -f1 | head -n 1)
  if [ -n "$LINE" ]; then
    sed -n "${LINE},$((LINE+NUM_LINEAS))p" "$ARCHIVO"
  fi
}

# Guardar bloque inicial
extract_block > "$TMP_OLD"

echo "📡 Monitoreando $ARCHIVO..."
echo "🔎 Buscando la clave: $CLAVE"
echo "📄 Mostrando $NUM_LINEAS líneas a partir de la coincidencia"
echo "📝 Además se mostrarán los cambios detectados en ese bloque"

inotifywait -m -e modify "$ARCHIVO" | while read; do
  clear
  NEW_BLOCK=$(mktemp)
  extract_block > "$NEW_BLOCK"

  cat "$NEW_BLOCK"
  echo "──────────────────────────────"
  echo "📌 Cambios en el bloque:"
  diff "$TMP_OLD" "$NEW_BLOCK" | ccze -A || echo "Sin cambios relevantes"

  # Actualizar copia
  cp "$NEW_BLOCK" "$TMP_OLD"
  rm "$NEW_BLOCK"
done
