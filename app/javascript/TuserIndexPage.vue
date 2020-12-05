<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
        </tr>
        <tr v-for="e in tusers" :key="e.id">
	  <td><router-link :to="{ name: 'TuserDetailPage', params: { id: e.id } }">{{ e.id }}</router-link></td>
          <td>{{ e.id }}</td>
          <td>{{ e.name }}</td>
	  <td>
		<button @click="deleteTarget = e.id; showModal = true">Delete</button>
	  </td>
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal=false" @ok="deleteTuser(); shoModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';
import Modal from 'Modal.vue';

export default {
  components:{
	Modal,
  },
  data: function () {
    return {
      tusers: [],
      showModal:false,
      deleteTarget: -1,
      errors:''
    }
  },
  mounted(){
    this.updateTuser();
  },
  methods: {
    deleteTuser: function(){
      if(this.deleteTarget <= 0){
        console.warn('deleteTarget should be grater than zero.');
        return;
      }
    axios
      .delete(`/api/v1/tusers/${this.deleteTarget}`)
      .then(response =>{
        this.deleteTarget = -1;
        this.updateTuser();
      })
      .catch(error => {
        console.error(error);
        if(error.response.data && error.response.data.errors) {
           this.errors = error.response.data.errors;
         }
      });
    },
    updateTuser:function(){
    axios
      .get('/api/v1/tusers.json')
      .then(response => (this.tusers = response.data))
    }
  }
}
</script>

<style scoped>
</style>
