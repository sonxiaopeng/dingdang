module.exports = {
	chainWebpack: (config) => {
		//删除编译后的独立js文件上的预获取操作
		config.plugins.delete("prefetch");
		config.plugin("html").tap((args) => {
			args[0].title = "叮当医生";
			return args;
		});
	},
	devServer: {
		proxy: {
			//为所有的服务器接口起一个别名前缀，为了和vue脚手架中其他页面的路由地址区分
			"/api": {
				target: "http://localhost:3000/", //自己的服务器端口
				changeOrigin: true, //打开跨域
				pathRewrite: {
					"^/api": "", //因为真实的服务器端的地址中不包含/api ，所以应该将程序中的、api删除（替换空字符串），再和target中的基础路径拼接起来作为发送到服务器端的最终请求地址
				},
				"": {
					target: "https://ncovdata.market.alicloudapi.com", //自己的服务器端口
					changeOrigin: true, //打开跨域
					pathRewrite: {
						"": "", //因为真实的服务器端的地址中不包含/api ，所以应该将程序中的、api删除（替换空字符串），再和target中的基础路径拼接起来作为发送到服务器端的最终请求地址
					},
				},
			},
		},
	},
	css: {
		loaderOptions: {
			less: {
				// 若 less-loader 版本小于 6.0，请移除 lessOptions 这一级，直接配置选项。
				lessOptions: {
					modifyVars: {
						// 直接覆盖变量
						"tabbar-item-active-color": "#00c792",
						"field-text-area-min-height": "120px",
						"field-word-limit-color": "#ccc",
						"uploader-upload-background-color": "#fafafa",
						"nav-bar-icon-color": "black",
						"nav-bar-text-color": "black",
						// 或者可以通过 less 文件覆盖（文件路径为绝对路径）
						// hack: `true; @import "your-less-file-path.less";`,
					},
				},
			},
		},
	},
	// pluginOptions: {
	//     'style-resources-loader': {
	//         preProcessor: 'less',
	//         patterns: [path.resolve(__dirname, 'vant/lib/index.less')]
	//     }
	// }
};
