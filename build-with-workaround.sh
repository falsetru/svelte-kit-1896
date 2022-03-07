#!/bin/bash
set -euo pipefail

WASM_MODULES=(dummy-wasm)
for MOD_NAME in ${WASM_MODULES[@]}; do
    FN_NAME=${MOD_NAME//-/_}
    WASM_FILENAME=${FN_NAME}_bg.wasm
    JS_FILENAME=${FN_NAME}.js

    # wasm-pack build --target web $MOD_NAME
    cp $MOD_NAME/pkg/${WASM_FILENAME} static/

    ###################
    # workaround
    #
    # Replace
    #   new URL('dummy_wasm_bg.wasm', import.meta.url)
    # with
    #   '/dummy_wasm_bg.wasm?ae8fc474876cda3b4c990747ba7b92003c7c0cfe'
    #
    CHECKSUM=$(sha1sum --binary static/${WASM_FILENAME} | cut -d' ' -f 1)
    sed -i "s/new URL('\(.*\)',.*/'\/\1?${CHECKSUM}';/" $MOD_NAME/pkg/${JS_FILENAME}
done
npm run build
