<template>
  <section id="monsters-index-vue" class="monster-index">
    <div class="monster-content">
      <div v-show="!showMonsterList">
        <monster v-if="selectedMonster"
                 :monster='selectedMonster'>
        </monster>
      </div>
      <div v-show="showMonsterList" class="grid">
        <div v-for="monster in monsterList" :key="'monster-' + monster.id" @click="selectMonster(monster)" class="monster-card">
          <img :src="monster.portrait" class="monster-image"/>
          <span> {{ monster.name }} </span>
        </div>
      </div>
    </div>
    <div class="monster-footer">
      <b-button :pressed.sync="showMonsterList"
                :variant="showMonsterListButton.variant"
                class="monster-show-button">
        {{ showMonsterListButton.text }}
      </b-button>
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
      monsterList: [],
      selectedMonster: null,
      showMonsterList: false,
      itemsPerRow: 5,
    };
  },
  computed: {
    showMonsterListButton() {
      const text = !this.showMonsterList ? "Show All Monsters" : "Hide All Monsters";
      const variant = !this.showMonsterList ? "primary" : "danger";

      return {
        variant: variant,
        text: text,
      }
    },

    rowCount() {
      return Math.ceil(this.monsterList.length / this.itemsPerRow);
    },
  },
  mounted() {
    this.getMonsterList();
  },
  methods: {
    getMonsterList() {
      const self = this;

      const successCallback = (res) => {
        self.monsterList = res.data.allMonsters;

        // Make Empty objects to fill a row when displaying
        const emptyMonsterCount = this.itemsPerRow - self.monsterList.length % this.itemsPerRow;
        for(let i=0; i < emptyMonsterCount; i++){
          self.monsterList = self.monsterList.concat([
            {id: null, name: "", portrait: "", is_boss: false}
          ])
        }
      };

      const errorCallback = (res) => {
        console.error(res);
      };

      // const query = `{
      //   allMonsters {
      //     id,
      //     name,
      //     portrait,
      //     is_boss,
      //   }
      // }`;

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
          abilities {
            id,
            reshuffle,
            ability_image,
          }
        }
      }`;

      graphqlAjaxCaller(query, successCallback, errorCallback);
    },
    selectMonster(monster) {
      this.selectedMonster = monster;
      this.fixMonsterAbilityCount(); // Move to the fetch when that is done
      this.showMonsterList = false;
    },
    fixMonsterAbilityCount() {
      // Make Empty objects to fill a row when displaying
      const emptyAbilityCount = this.itemsPerRow - this.selectedMonster.abilities.length % this.itemsPerRow;
      for(let i=0; i < emptyAbilityCount; i++){
        this.selectedMonster.abilities = this.selectedMonster.abilities.concat([
          { id: i * -1, reshuffle: false, ability_image: "" }
        ])
      }
    },
  },
};
</script>

<style scoped>
  .monster-index {
    text-align: center;
  }
  .monster-content {
    padding-bottom: 40px;
  }
  .monster-footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40px;
  }
  .monster-show-button {
    width: 100%;
    height: 40px;
  }
  .monster-image {
    height: auto;
    width: 100%;
  }
  .monster-card {
    opacity: 0.8;
    padding: 2px;
    transition: all 0.2s;
  }
  .monster-card:hover {
    cursor: pointer;
    opacity: 1;
    background-color: black;
    color: white;
  }
  .grid {
    display: grid;
    grid-gap: 0em;
    grid-template-columns: repeat( auto-fit, minmax(250px, 1fr) );
  }
</style>
