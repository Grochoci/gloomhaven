<template>
    <div>
      <img v-bind:src="monster.portrait" class='monster-portrait' />
      <p class='monster-name'> {{monster.name}} </p>
      <p>
        <div v-for="stats in monster.monster_stats"
          :class="{
            'normal-stats': !stats.is_elite,
            'elite-stats': stats.is_elite,
          }">
            <p> Level: {{ stats.level }} </p>
            <p> Health: {{ stats.health }} </p>
            <p> Attack: {{ stats.attack }} </p>
            <p> Movement: {{ stats.movement }} </p>
            <p> Range: {{ stats.range || '-' }} </p>
        </div>
      </p>
      <img v-bind:src="monster.ability_deck.back_image" class='ability-deck-back' />
    </div>
</template>

<script>
import graphqlAjaxCaller from '../../helpers/graphql-ajax-caller';

export default {
  data() {
    return {
    };
  },
  props: {
    monster: Object,
  },
  methods: {
  },
};
</script>

<style scoped>
  .monster-portrait {
    height:200px;
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
  .monster-name {
    font-size: 20px;
    font-weight: 800;
  }
</style>
