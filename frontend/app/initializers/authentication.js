import CustomAuthenticator from '../authenticators/custom';

export function initialize(container, application) {
  application.register('authenticator:custom', CustomAuthenticator);
}

export default {
  name: 'authentication',
  before: 'simple-auth',
  initialize: initialize
};
