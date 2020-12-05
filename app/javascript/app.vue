<template>
	<div>
		<CommonHeader/>
		<router-view></router-view>
	</div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import TuserIndexPage from 'TuserIndexPage.vue'
import TuserDetailPage from 'TuserDetailPage.vue'
import TuserNewPage from 'TuserNewPage.vue'
import TuserEditPage from 'TuserEditPage.vue'
import CommonHeader from 'CommonHeader.vue'

const router = new VueRouter({
	routes:[
		{ path: '/',
		component: TuserIndexPage },
		{ path: '/tusers/:id(\\d+)',
		name: 'TuserDetailPage',
		component: TuserDetailPage },
		{ path: '/tusers/new',
		name: 'TuserNewPage',
		component: TuserNewPage },
		{ path: '/tusers/:id(\\d+)/edit',
		name: 'TuserEditPage',
		component: TuserEditPage },
		{ path: '*',
		component: TuserIndexPage },
	]
})

Vue.use(VueRouter)

export default{
	router,
	components:{
		CommonHeader
	}
}
</script>

<style scoped>
</style>
