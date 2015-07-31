import DS from 'ember-data';

const { attr, hasMany } = DS;

export default DS.Model.extend({
  floors: hasMany('floor', { async: true }),

  name: attr('string'),
  breweryName: attr('string'),
  style: attr('string'),
  iconSmall: attr('string'),
  iconMedium: attr('string'),
  iconLarge: attr('string')
});
