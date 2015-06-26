import Ember from 'ember';

const get = Ember.get;
const set = Ember.set;

export default Ember.Component.extend({
  store: Ember.inject.service(),

  isAddingBeer: false,

  init() {
    this._super(...arguments);

    this.searchResults = Ember.A();
  },

  actions: {
    addBeer(beer) {
      const store = get(this, 'store');
      const floor = this.getAttr('floor');

      const floorBeer = store.createRecord('floor-beer', {
        beer: beer,
        floor: floor
      });

      floorBeer.save().then((floorBeer) => {
        get(floor, 'beers').pushObject(beer);
        set(this, 'searchResults', Ember.A());
        set(this, 'isAddingBeer', false);
      }, (errors) => {
        // TODO: handle error
      });
    },

    search(query) {
      const store = get(this, 'store');
      const results = store.query('beer', { query: query });

      set(this, 'searchResults', results);
    },

    toggleIsAddingBeer() {
      this.toggleProperty('isAddingBeer');
    }
  }
});
