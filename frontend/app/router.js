import Ember from 'ember';
import config from './config/environment';
import googlePageview from './mixins/google-pageview';

const Router = Ember.Router.extend(googlePageview, {
  location: config.locationType
});

Router.map(function() {
  this.route('locations', { path: '/' }, function() {
    this.route('location', { path: 'locations/:location_id' });
  });
});

export default Router;
