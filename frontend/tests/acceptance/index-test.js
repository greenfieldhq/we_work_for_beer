import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'we-work-for-beer/tests/helpers/start-app';

let application;

module('Acceptance: Index', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /index', function(assert) {
  const locations = server.createList('location', 3);

  visit('/');

  andThen(function() {
    assert.equal(currentRouteName(), 'index');

    const $locationsList = find('.locations-list li');

    assert.equal($locationsList.length, 3);
  });
});
