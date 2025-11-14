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

# Vigilar el directorio porque gulp elimina y recrea el archivo
inotifywait -m -e create -e modify "$(dirname "$ARCHIVO")" | while read; do
  if [ -f "$ARCHIVO" ]; then
    clear
    TMP_NEW="./tmp_new_block.css"
    extract_block > "$TMP_NEW"

    echo "📄 Bloque actual:"
    cat "$TMP_NEW"
    echo "──────────────────────────────"
    echo "📌 Cambios en el bloque:"
    DIFF_OUTPUT=$(diff "$TMP_OLD" "$TMP_NEW")
    if [ -n "$DIFF_OUTPUT" ]; then
      echo "$DIFF_OUTPUT" | ccze -A
    else
      echo "Sin cambios en el bloque"
    fi

    # if ! diff "$TMP_OLD" "$TMP_NEW" | ccze -A; then
    #   echo "Sin cambios en el bloque"
    # fi

    cp "$TMP_NEW" "$TMP_OLD"
    rm "$TMP_NEW"
  fi
done
