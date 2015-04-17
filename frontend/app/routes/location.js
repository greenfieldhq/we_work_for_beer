import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    return this.store.find('location', params.location_id);
  }
});
