<template>
	<div id="hospital-location">
        <my-navbar title="医院位置"></my-navbar>
		<div ref="mapbox" class="mapbox" :style="{ height: fullScreenH }"></div>
		<div class="hospital-name">
			<h3>{{ hospitalname }}</h3>
			<p>{{ address }}</p>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			address: "",
			hospitalname: "",
			fullScreenH: "",
		};
	},
	mounted() {
		this.fullScreenH = document.documentElement.clientHeight + "px";

		this.axios
			.get("/getlocation", {
				params: {
					hospitalid: this.$route.query.hospitalid,
				},
			})
			.then(res => {
				this.hospitalname = res.data.data.hospitalname;
				this.address = res.data.data.address;
				if (res.data.code == 0) {
					let mapEle = this.$refs.mapbox;
					let map = new BMap.Map(mapEle);
					let longitude = Number(res.data.data.longitude);
					let latitude = Number(res.data.data.latitude);

					let point = new BMap.Point(longitude, latitude);
					map.centerAndZoom(point, 15);
					let marker = new BMap.Marker(point);
					marker.getIcon().setSize({
						width: 50,
						height: 50,
					});
					map.addOverlay(marker);
					map.enableScrollWheelZoom();
					let nc = new BMap.NavigationControl({
						anchor: BMAP_ANCHOR_BOTTOM_LEFT,
						offset: new BMap.Size(20, 120),
					});
					map.addControl(nc);
					// map.addControl(
					// 	new BMap.ScaleControl({
					// 		anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
					// 		offset: new BMap.Size(0, 0),
					// 	})
					// );
				}
			})
			.catch(reason => console.log(reason));
	},
};
</script>

<style scoped>
.hospital-name p {
    font-size: 14px;
    color: #999;
}

.hospital-name {
	height: 50px;
	background-color: #fff;
	position: fixed;
    padding: 10px 0 0 20px;
	bottom: 0;
	left: 0;
	width: 100%;
    font-size: 18px;
	line-height: 25px;
}

#hospital-location .mapbox {
	width: 100%;
	height: 100%;
}
</style>
