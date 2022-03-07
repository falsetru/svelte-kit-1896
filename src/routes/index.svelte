<script context="module">
	import init, { byte_count } from "dummy-wasm";

	export async function load() {	
		await init();
		return {};
	}
</script>

<script>
	let s = "❤️";
	$: bytes = byte_count(s);
</script>

<input type="text" bind:value={s}>
{bytes} bytes
