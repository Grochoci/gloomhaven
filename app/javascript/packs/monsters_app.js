import Vue from 'vue';
import App from '../apps/monsters/index.vue';
import BootstrapVue from 'bootstrap-vue';

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

Vue.use(BootstrapVue);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#monsters-index',
    render(createElement) {
      return createElement(App);
    },
  });
})
