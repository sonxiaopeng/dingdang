export default [
	{
		path: "/epidemic",
		name: "Epidemic",
		component: () =>
			import(
				/* webpackChunkName: "epidemic" */ "@/views/epidemic/Epidemic"
			),
		meta: { index: 1 },
	},
];
