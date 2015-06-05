/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'we-work-for-beer',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    torii: {
      providers: {
        'facebook-oauth2': {
          apiKey: process.env.FACEBOOK_CLIENT_ID,
          scope: 'email,public_profile',
          redirectUri: 'http://localhost:4200/'
        }
      }
    },

    'simple-auth': {
      authorizer: 'simple-auth-authorizer:oauth2-bearer',
      routeAfterAuthentication: 'locations'
    }
  };

  ENV.contentSecurityPolicy = {
    'img-src': "'self' data: *.googleapis.com *.gstatic.com *.google-analytics.com *.intercomcdn.com",
    'script-src': "'self' 'unsafe-inline' *.googleapis.com *.gstatic.com *.google-analytics.com *.intercomcdn.com",
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;

    ENV['simple-auth-oauth2'] = {
      serverTokenEndpoint: '/api/v1/token'
    };
  }

  if (environment === 'production') {
    ENV.googleAnalytics = {
      webPropertyId: process.env.GOOGLE_ANALYTICS_ID
    };
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
