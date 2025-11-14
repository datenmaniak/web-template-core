#!/usr/bin/bash

TMP_OLD="tmp_old_block.css"
TMP_NEW="tmp_block.css"

 if ! diff "$TMP_OLD" "$TMP_NEW" | ccze -A; then
      echo "Sin cambios en el bloque"
fi