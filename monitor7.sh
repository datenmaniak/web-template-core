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

TMP_OLD="./tmp_old_block.css"

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
  TMP_NEW="./tmp_new_block.css"
  extract_block > "$TMP_NEW"

  cat "$TMP_NEW"
  echo "──────────────────────────────"
  echo "📌 Cambios en el bloque:"
  if ! diff "$TMP_OLD" "$TMP_NEW" | ccze -A; then
    echo "Sin cambios en el bloque"
  fi

  cp "$TMP_NEW" "$TMP_OLD"
  rm "$TMP_NEW"
done
