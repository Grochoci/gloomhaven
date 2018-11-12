<template>
  <section id="monsters-index-vue">
    <div v-for="monster in monsters">
      <monster :monster='monster'></monster>
    </div>
  </section>
</template>

<script>
import graphqlAjaxCaller from '../../helpers/graphql-ajax-caller';
import Monster from '../../containers/monsters/monster.vue';

export default {
  components: {
    Monster,
  },
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
          monster_stats {
            id,
            level,
            is_elite,
            health,
            attack,
            movement,
            range,
          },
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
  #monsters-index-vue {
    text-align: center;
  }
</style>
