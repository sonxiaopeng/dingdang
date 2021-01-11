export default [
	{
		path: "/emgcall/symptom",
		name: "Symptom",
		// route level code-splitting
		// this generates a separate chunk (about.[hash].js) for this route
		// which is lazy-loaded when the route is visited.
		component: () =>
			import(/* webpackChunkName: "symptom" */ "@/views/emgcall/Symptom"),
	},
	{
		path: "/emgcall/patient-list",
		name: "PatientList",
		component: () =>
			import(/* webpackChunkName: "patientList" */ "@/views/emgcall/PatientList"),
	},
	{
		path: "/emgcall/sections",
		name: "Sections",
		component: () =>
			import(/* webpackChunkName: "sections" */ "@/views/emgcall/Sections"),
	},
	{
		path: "/emgcall/patient-form",
		name: "PatientForm",
		component: () =>
			import(/* webpackChunkName: "patientform" */ "@/views/emgcall/PatientForm"),
	},
];
