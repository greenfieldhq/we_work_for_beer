import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router.map(function() {
  this.route('locations', { path: '/' }, function() {
    this.route('location', { path: 'locations/:location_id' });
  });
});
