import Ember from 'ember';

const {
  run: { debounce },
  get,
  set
} = Ember;

export default Ember.Component.extend({
  query: null,
  select: null,

  actions: {
    search() {
      const query = get(this, 'query');
      debounce(this, this.getAttr('search'), query, 200);
    },

    select(beer) {
      this.getAttr('select')(beer);
      set(this, 'query', null);
    }
  }
});
