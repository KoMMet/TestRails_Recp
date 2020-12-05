<template>
	<tuser-form-pane :errors="errors" :tuser="tuser" @submit="createTuser"></tuser-form-pane>
</template>

<script>
import axios from 'axios';
import TuserFormPane from 'TuserFormPane.vue';

export default {
	components:{
		TuserFormPane
	},
	data: function () {
		return {
			tuser:{
				name:'',
				pass:'',
				jointime:''
			},
			errors:''
		}
	},
	methods: {
		createTuser: function(){
			axios
				.post('/api/v1/tusers', this.tuser)
				.then(response => {
					let e = response.data;
					this.$router.push({ name:'TuserDetailPage', params:{id: e.id}});
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
