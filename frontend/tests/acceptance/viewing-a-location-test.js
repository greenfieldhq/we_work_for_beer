import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'we-work-for-beer/tests/helpers/start-app';

const set = Ember.set;

let application;

module('Acceptance: Viewing a Location', {
  beforeEach() {
    application = startApp();
  },

  afterEach() {
    Ember.run(application, 'destroy');
  }
});

test('all the floors and their beer are displayed', function(assert) {
  assert.expect(3);

  const location = server.create('location');
  const floors = server.createList('floor', 3, { location_id: location.id });

  floors.forEach((floor) => {
    const beers = server.createList('beer', 3, { floor_id: floor.id });
    const beerIds = beers.map(beer => beer.id);
    set(floor, 'beer_ids', beerIds);
  });

  visit(`/locations/${location.id}`);

  andThen(() => {
    assert.equal(currentRouteName(), 'locations.location');

    const $floors = find('.floors .floor');
    assert.equal($floors.length, 3, 'all the floors are displayed');

    const $beers = find('.beers .beer');
    assert.equal($beers.length, 9, 'all beers are displayed');
  });
});
