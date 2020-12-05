<template>
	<tuser-form-pane :errors="errors" :tuser="tuser" @submit="updateTuser"></tuser-form-pane>
</template>

<script>
import axios from 'axios';
import TuserFormPane from 'TuserFormPane.vue';

export default {
	components: {
		TuserFormPane
	},
	data(){
		return {
			tuser:{},
				errors:''
		}
	},
	mounted(){
		axios
		.get(`/api/v1/tusers/${this.$route.params.id}.json`)
		.then(response => (this.tuser = response.data))
	},
	methods:{
		updateTuser:function(){
			axios
			.patch(`/api/v1/tusers/${this.tuser.id}`,this.tuser)
			.then(response => {
				this.$router.push({name: 'TuserDetailPage', params:{id:this.tuser.id}});
			})
			.catch(error => {
				console.error(error);
				if(error.response.data && error.response.data.errors){
					this.errors = error.response.data.errors;
				}
			});
		}
	}
}
</script>

<style scoped>
</style>
