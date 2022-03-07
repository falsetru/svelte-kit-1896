https://github.com/sveltejs/kit/issues/1896


## How to reproduce

- ~Install wasm-pack: https://rustwasm.github.io/wasm-pack/installer/~
- Install packages

        npm install --no-save

- build; This will fail.

        ./build.sh

- Try build with work around; This will succeed.

        ./build-with-workaround.sh
