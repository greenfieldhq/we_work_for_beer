import Ember from 'ember';
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

const get = Ember.get;

export default Ember.Route.extend(
  ApplicationRouteMixin, {

  actions: {
    sessionRequiresAuthentication() {
      const session = get(this, 'session');
      const torii = get(this, 'torii');

      session.authenticate('authenticator:custom', {
        torii: torii
      });
    }
  }
});
