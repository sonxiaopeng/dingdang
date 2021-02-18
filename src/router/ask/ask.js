export default [
	
	{
		path: "/ask/patient-list",
		name: "askPatientList",
		component: () =>
            import(/* webpackChunkName: "askPatientList" */ "@/views/ask/PatientList"),
            meta:{index:2}
	},
	{
		path: "/ask/sections",
		name: "askSections",
		component: () =>
            import(/* webpackChunkName: "askSections" */ "@/views/ask/Sections"),
            meta:{index:4}
	},
	{
		path: "/ask/patient-form",
		name: "askPatientForm",
		component: () =>
            import(/* webpackChunkName: "askPatientForm" */ "@/views/ask/PatientForm"),
            meta:{index:3}
	},
	{
		path: "/ask/order",
		name: "askOrder",
		component: () =>
            import(/* webpackChunkName: "askOrder" */ "@/views/ask/Order"),
            meta:{index:5}
	},
];
