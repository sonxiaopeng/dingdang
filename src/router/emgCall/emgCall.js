export default [
	{
		path: "/emgcall/symptom",
		name: "Symptom",
		// route level code-splitting
		// this generates a separate chunk (about.[hash].js) for this route
		// which is lazy-loaded when the route is visited.
		component: () =>
            import(/* webpackChunkName: "symptom" */ "@/views/emgcall/Symptom"),
            meta:{index:1}
	},
	{
		path: "/emgcall/patient-list",
		name: "PatientList",
		component: () =>
            import(/* webpackChunkName: "patientList" */ "@/views/emgcall/PatientList"),
            meta:{index:2}
	},
	{
		path: "/emgcall/sections",
		name: "Sections",
		component: () =>
            import(/* webpackChunkName: "sections" */ "@/views/emgcall/Sections"),
            meta:{index:4}
	},
	{
		path: "/emgcall/patient-form",
		name: "PatientForm",
		component: () =>
            import(/* webpackChunkName: "patientform" */ "@/views/emgcall/PatientForm"),
            meta:{index:3}
	},
	{
		path: "/emgcall/order",
		name: "Order",
		component: () =>
            import(/* webpackChunkName: "order" */ "@/views/emgcall/Order"),
            meta:{index:5}
	},
];
