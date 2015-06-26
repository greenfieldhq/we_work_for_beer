import DS from 'ember-data';

const { attr, belongsTo, hasMany } = DS;

export default DS.Model.extend({
  location: belongsTo('location', { async: true }),
  beers: hasMany('beer', { async: true }),

  name: attr('string')
});
