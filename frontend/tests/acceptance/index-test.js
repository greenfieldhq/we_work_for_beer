import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'we-work-for-beer/tests/helpers/start-app';

let application;

module('Acceptance: Locations', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /', function(assert) {
  const locations = server.createList('location', 3);

  visit('/');

  andThen(() => {
    assert.equal(currentRouteName(), 'locations.index');

    const $locationsList = find('.locations-list .location');

    assert.equal($locationsList.length, 3);
  });
});
