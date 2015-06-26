import DS from 'ember-data';

const { attr, hasMany } = DS;

export default DS.Model.extend({
  floors: hasMany('floor', { async: true }),

  name: attr('string')
});
