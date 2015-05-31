import Ember from 'ember';
import OAuth2 from 'simple-auth-oauth2/authenticators/oauth2';

const Promise = Ember.RSVP.Promise;
const get = Ember.get;
const run = Ember.run;

export default OAuth2.extend({
  provider: 'facebook-oauth2',

  authenticate(options) {
    return this.fetchOauthData(options).then((data) => {
      return this.fetchAccessToken(data);
    });
  },

  fetchOauthData(options) {
    const torii = options.torii;
    const provider = get(this, 'provider');

    return new Promise((resolve, reject) => {
      torii.open(provider).then((data) => {
        resolve(data);
      }, (error) => {
        reject(error);
      });
    });
  },

  fetchAccessToken(data) {
    const serverTokenEndpoint = get(this, 'serverTokenEndpoint');

    return new Promise((resolve, reject) => {
      this.makeRequest(serverTokenEndpoint, data).then((response) => {
        resolve(response);
      }, (xhr) => {
        run(() => {
          reject(xhr.responseJSON || xhr.responseText);
        });
      });
    });
  }
});
