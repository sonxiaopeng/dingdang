<template>
  <div id="no-data">
      <img src="@/assets/images/mine/nodata.png" alt="">
      <p>{{msg}}</p>
  </div>
</template>

<script>
export default {
    props: ['msg']
}
</script>

<style scoped>
    #no-data {
        padding: 100px 0;
        display: flex;
        justify-content: space-around;
        flex-flow: column nowrap;
        align-items: center;
    }
    #no-data img {
        width: 250px;
    }
    #no-data p {
        margin-top: 20px;
        text-align: center;
        color: #666;
        font-size: 14px;
    }
</style>