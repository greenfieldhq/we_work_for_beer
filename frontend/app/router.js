import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('locations', { path: '/' }, function() {
    this.route('location', { path: 'locations/:location_id' });
  });
});

export default Router;
