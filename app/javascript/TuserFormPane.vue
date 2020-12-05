<template>
        <form @submit.prevent="$emit('submit')">
                <div v-if="errors.length != 0">
                        <ul v-for="e in errors" :key="e">
                                <li><font color="red">{{e}}</font></li>
                        </ul>
                </div>
                <div>
                        <label>Name</label>
                        <input v-model="tuser.name" type="text">
                </div>
                <div>
                        <label>Pass</label>
                        <input v-model="tuser.pass" type="text">
                </div>
                <div>
                        <label>JoinTime</label>
                        <input v-model="tuser.jointime" type="date">
                </div>
                <button type="submit">Commit</button>
        </form>
</template>

<script>
export default {
	props: {
		tuser: {},
		errors:''
	}
}
</script>

<style scoped>
</style>
