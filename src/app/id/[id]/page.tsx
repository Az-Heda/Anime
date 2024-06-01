export async function generateStaticParams() {
	return [
		'a',
		'b',
		'c',
	].map(i => ({ id: i }))
}


export default function Page({params}: any) {
	return (
		<>
			<h1>Title</h1>
			<p>{params.id}</p>
		</>
	)
}