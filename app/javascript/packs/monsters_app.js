import Vue from 'vue';
import App from '../apps/monsters/index.vue';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#monsters-index',
    render(createElement) {
      return createElement(App);
    },
  });
})
