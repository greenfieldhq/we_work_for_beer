import DS from 'ember-data';

const belongsTo = DS.belongsTo;

export default DS.Model.extend({
  beer: belongsTo('beer'),
  floor: belongsTo('floor')
});
