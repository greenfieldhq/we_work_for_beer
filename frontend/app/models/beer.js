import DS from 'ember-data';

const attr = DS.attr;
const hasMany = DS.hasMany;

export default DS.Model.extend({
  floors: hasMany('floor', { async: true }),

  name: attr('string')
});
