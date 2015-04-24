import DS from 'ember-data';

const attr = DS.attr;
const belongsTo = DS.belongsTo;
const hasMany = DS.hasMany;

export default DS.Model.extend({
  location: belongsTo('location', { async: true }),
  beers: hasMany('beer', { async: true }),

  name: attr('string')
});
