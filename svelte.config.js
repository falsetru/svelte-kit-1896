import adapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		prerender: {
			default: true
		},
		adapter: adapter(),
		trailingSlash: 'always',
		vite: {
			server: {
				fs: ["dummy-wasm"]
			}
		}
	}
};

export default config;
