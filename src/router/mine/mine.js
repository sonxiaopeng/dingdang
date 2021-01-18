export default [
    {
        path: "/setting",
        name: "Setting",
        component: () =>
            import(/* webpackChunkName: "setting" */ "@/views/Setting"),
    },
    {
        path: "/mine/modifynickname",
        name: "ModifyNickName",
        component: () =>
            import(/* webpackChunkName: "modifynickname" */ "@/views/ModifyNickName"),
    },
];