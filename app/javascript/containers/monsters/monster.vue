<template>
    <div>
      <img v-bind:src="monster.portrait" class='monster-portrait' />
      <p class='monster-name'> {{monster.name}} </p>
      <div class="monster-stats">
        <b-button :pressed.sync="showMonsterStats"
                  :variant="showMonsterStatsButton.variant"
                  class="monster-stat-button">
          {{ showMonsterStatsButton.text }}
        </b-button>
        <div v-if="showMonsterStats" v-for="stats in monster.monster_stats" :key="'stats-' + stats.id"
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
      </div>
      <div class="monster-deck">
        <img :src="monster.ability_deck.back_image"
             class='ability-deck-back'
             @click="toggleAbilities"/>
        <div v-show="showAbilities" class="grid">
          <img v-for="ability in monster.abilities" :key="'ability-' + ability.id"
                :src="ability.ability_image"
                class="ability-card"/>
        </div>
      </div>
    </div>
</template>

<script>
import graphqlAjaxCaller from '../../helpers/graphql-ajax-caller';

export default {
  data() {
    return {
      showMonsterStats: true,
      showAbilities: true,
    };
  },
  props: {
    monster: Object,
  },
  computed: {
    showMonsterStatsButton() {
      const text = !this.showMonsterStats ? "Show Stats" : "Hide Stats";
      const variant = !this.showMonsterStats ? "primary" : "danger";

      return {
        variant: variant,
        text: text,
      }
    },
  },
  methods: {
    toggleAbilities() {
      this.showAbilities = !this.showAbilities;
    },
  },
};
</script>

<style scoped>
  .monster-portrait {
    height:400px;
  }
  .ability-deck-back {
    cursor: pointer;
    height: 200px;
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
  .grid {
    display: grid;
    grid-gap: 0.7em;
    grid-template-columns: repeat( auto-fit, minmax(250px, 1fr) );
  }
  .ability-card {
    height: auto;
    width: 100%;
  }
</style>
