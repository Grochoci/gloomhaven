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
          :class="[
            stats.is_elite ? 'elite-stats' : 'normal-stats'
          ]">
            <p> Level: {{ stats.level }} </p>
            <p> Health: {{ stats.health }} </p>
            <p> Attack: {{ stats.attack }} </p>
            <p> Movement: {{ stats.movement }} </p>
            <p> Range: {{ stats.range || '-' }} </p>
        </div>
      </div>
      <div class="monster-deck">
        <transition-group name="ability-card" tag="div" class="grid">
          <img :src="monster.ability_deck.back_image"
               class='ability-deck-back ability-card decked'
               @click="toggleAbilities"
               key='back-ability'/>
          <img v-for="ability in monster.abilities" :key="'ability-' + ability.id"
                :src="ability.ability_image"
                :class="[
                  'ability-card',
                  showAbilities ? '' : 'ability-card-decked decked'
                ]"/>
        </transition-group>
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
    z-index: 50;
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
    transition: all 1s ease-out;
  }
  .ability-card-decked {
    z-index: 1;
  }
  .decked {
    grid-column: 1 / -1;
    grid-row: 1;
    max-width: 400px;
    justify-self: center;
  }
</style>
