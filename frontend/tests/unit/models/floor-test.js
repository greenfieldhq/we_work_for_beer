import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('floor', {
  // Specify the other units that are required for this test.
  needs: ['model:location', 'model:beer']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
