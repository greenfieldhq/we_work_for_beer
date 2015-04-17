import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'we-work-for-beer/tests/helpers/start-app';

let application;

module('Acceptance: Viewing a Location', {
  beforeEach() {
    application = startApp();
  },

  afterEach() {
    Ember.run(application, 'destroy');
  }
});

test('all the floors are displayed', function(assert) {
  assert.expect(2);

  const location = server.create('location');
  const floors = server.createList('floor', 3, { location_id: location.id });

  visit(`/locations/${location.id}`);

  andThen(() => {
    assert.equal(currentRouteName(), 'location');

    const $floorsList = find('.floors-list li');

    assert.equal($floorsList.length, 3);
  });
});
