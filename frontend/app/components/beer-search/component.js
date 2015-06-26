import Ember from 'ember';
import request from 'ic-ajax';

const get = Ember.get;
const set = Ember.set;

export default Ember.Component.extend({
  query: null,
  select: null,

  actions: {
    search() {
      const query = get(this, 'query');
      this.getAttr('search')(query);
    },

    select(beer) {
      this.getAttr('select')(beer);
      set(this, 'query', null);
    }
  }
});
