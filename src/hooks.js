export async function handle({ event, resolve }) {
	const ssr = false;
	const response = await resolve(event, { ssr });
	return response;
}
