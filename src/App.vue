<template>
	<div id="app">
		<transition name="fade" mode="in-out">
			<router-view />
		</transition>
	</div>
</template>

<script>

</script>

<style>
.loading {
	height: 100% !important;
	width: 100% !important;
	background-color: #fff !important;
	max-width: 100% !important;
}
/* body,
html {
	width: 100%;
    height: 100%;
    overflow: scroll;
}

html::-webkit-scrollbar,
body::-webkit-scrollbar {
	width: 0px;
	height: 0px;
} */

</style>
