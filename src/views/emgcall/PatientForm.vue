<template>
    <div id="patient-form">





        <div class="next-btn">
      <van-button size="large" color="#00c792" round @click="next">提交</van-button>
      </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {

            }
        },
        methods: {
            next(){
                this.$router.push('/symptom/sections')
            }
        }
    }
</script>

<style scoped>


#patient-form .next-btn {
    background-color: #fff;
    box-sizing: border-box;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 10px 16px;
}
</style>