export default [
    {
        path: "/setting",
        name: "Setting",
        component: () =>
            import(/* webpackChunkName: "setting" */ "@/views/mine/Setting"),
    },
    {
        path: "/mine/modifynickname",
        name: "ModifyNickName",
        component: () =>
            import(/* webpackChunkName: "modifynickname" */ "@/views/mine/ModifyNickName"),
    },
    {
        path: "/login",
        name: "Login",
        component: () =>
            import(/* webpackChunkName: "login" */ "@/views/mine/Login"),
    },
      {
        path: "/register",
        name: "Register",
        component: () =>
            import(/* webpackChunkName: "register" */ "@/views/mine/Register"),
    },
];