<template>
  <div class="navbar-z">
      <van-nav-bar
			fixed
			placeholder
			:title="title"
			left-arrow
			@click-left="onClickLeft"
		    ></van-nav-bar>
  </div>
</template>

<script>
export default {
    props:['title'],
    methods: {
        onClickLeft(){
            this.$router.go(-1)
        }
    }
}
</script>

<style scoped>
.navbar-z {
    position: relative;
    z-index: 998;
}

</style>