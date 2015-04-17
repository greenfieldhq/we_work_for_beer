import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('beer', {
  // Specify the other units that are required for this test.
  needs: ['model:floor', 'model:location']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
