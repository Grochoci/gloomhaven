<template>
  <section id="monsters-index-vue">
    <div v-show="!showMonsterList" class="monster-content">
      <monster v-if="selectedMonster"
               :monster='selectedMonster'>
      </monster>
    </div>
    <div v-show="showMonsterList" class="monster-list">
      <b-card-group v-for="rowNumber in rowCount">
        <b-card v-for="monster in monsterList.slice((rowNumber - 1) * itemsPerRow, rowNumber * itemsPerRow)"
                :title="monster.name"
                :img-src="monster.portrait"
                img-fluid
                :img-alt="monster.name"
                img-top
                @click="selectMonster(monster)"
                class="monster-card">
        </b-card>
      </b-card-group>
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
        // TODO: Remove once lots of monsters are added
        self.monsterList = self.monsterList.concat(self.monsterList);
        self.monsterList = self.monsterList.concat(self.monsterList);
        // TODO: Remove once selection is possible
        self.selectedMonster = self.monsterList[0];

        // Make Empty objects to fill a row when displaying
        const emptyMonsterCount = 5 - self.monsterList.length % 5;
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
        }
      }`;

      graphqlAjaxCaller(query, successCallback, errorCallback);
    },
    selectMonster(monster) {
      this.selectedMonster = monster;
      this.showMonsterList = false;
    },
  },
};
</script>

<style scoped>
  #monsters-index-vue {
    text-align: center;
  }
  .monster-content {
    padding-bottom:40px;   /* Height of the footer */
  }
  .monster-list {
  }
  .monster-footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:40px;   /* Height of the footer */
  }
  .monster-show-button {
    width: 100%;
    height:40px;
  }
  .monster-card {
    cursor: pointer;
  }
</style>
