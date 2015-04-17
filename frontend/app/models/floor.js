import DS from 'ember-data';

export default DS.Model.extend({
  location: DS.belongsTo('location'),

  name: DS.attr('string')
});
