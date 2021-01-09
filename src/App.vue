<template>
  <div id="app">
    
    <router-view/>
  </div>
</template>

<style>
body,
html {
	width: 100%;
    height: 100%;
    overflow: scroll;
}

html::-webkit-scrollbar,
body::-webkit-scrollbar {
	width: 0px;
	height: 0px;
}
</style>
