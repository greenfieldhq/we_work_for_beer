import DS from 'ember-data';

export default DS.Model.extend({
  floors: DS.hasMany('floor', { async: true }),

  name: DS.attr('string')
});
