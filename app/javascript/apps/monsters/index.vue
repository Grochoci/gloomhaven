<template>
  <div id="monsters-index-vue">
    <div v-for="monster in monsters">
      <p> Name: {{monster.name}} </p>
      <p> Boss: {{monster.is_boss}} </p>
      <p> Portrait: <img v-bind:src="monster.portrait" style='height:100px;' /> </p>
      <p> Ability Deck: <img v-bind:src="monster.ability_deck.back_image" style='height:100px;' /> </p>
    </div>
  </div>
</template>

<script>
import graphqlAjaxCaller from '../../helpers/graphql-ajax-caller';

export default {
  data() {
    return {
      monsters: [],
    };
  },
  beforeMount() {
    this.getMonsters();
  },
  methods: {
    getMonsters() {
      const self = this;

      const successCallback = (res) => {
        self.monsters = res.data.allMonsters;
      };

      const errorCallback = (res) => {
        console.error(res);
      };

      const query = `{
        allMonsters {
          id,
          name,
          portrait,
          is_boss,
          ability_deck {
            id,
            name,
            back_image,
          }
        }
      }`;

      graphqlAjaxCaller(query, successCallback, errorCallback);
    },
  },
};
</script>

<style scoped>

</style>
