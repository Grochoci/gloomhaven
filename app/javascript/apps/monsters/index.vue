<template>
  <div id="monsters-index-vue">
    <div v-for="monster in monsters">
      <p> Name: {{monster.name}} </p>
      <p> Boss: {{monster.is_boss}} </p>
      <p> Portrait: <img v-bind:src="monster.portrait" class='monster-portrait' /> </p>
      <p> Stats:
        <div v-for="stats in monster.monster_stats"
          :class="{
            'normal-stats': !stats.is_elite,
            'elite-stats': stats.is_elite,
          }">
            <p> Level: {{stats.level}} </p>
            <p> Health: {{stats.health}} </p>
            <p> Attack: {{stats.attack}} </p>
            <p> Movement: {{stats.movement}} </p>
            <p> Range: {{stats.range}} </p>
        </div>
      </p>
      <p> Ability Deck: <img v-bind:src="monster.ability_deck.back_image" class='ability-deck-back' /> </p>
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
  .monster-portrait {
    height:100px;
  }
  .ability-deck-back {
    height: 100px;
  }
  .normal-stats {
    background-color: lightgrey;
  }
  .elite-stats {
    background-color: gold;
  }
</style>
