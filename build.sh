#!/bin/bash
set -euo pipefail

WASM_MODULES=(dummy-wasm)
for MOD_NAME in ${WASM_MODULES[@]}; do
    FN_NAME=${MOD_NAME//-/_}
    WASM_FILENAME=${FN_NAME}_bg.wasm
    JS_FILENAME=${FN_NAME}.js

    # wasm-pack build --target web $MOD_NAME
    cp $MOD_NAME/pkg/${WASM_FILENAME} static/
done
npm run build
