Ember Magic Table
====================

Ember Magic Table, like the name implies, will magically build you a table from a collection of Ember Data models. It uses ember-table to do the heavy lifting. You can click to edit any cell, and it will commit to the data store on enter. You can also add rows (and probably remove them in the near future).

How to use it
-------------

Let's say you have a model like so:

````coffeescript
App.Person = DS.Model.extend
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  birthDate: DS.attr('date')
  age: DS.attr('number')
````

Then imagine you have a route like so:

````coffeescript
App.Router.map ->
  @resource "persons"

App.PersonsRoute = Ember.Route.extend
  model: -> App.Person.find()
````

Then in your persons template, all you need to do is:

````handlebars
{{ magic_editable_table }}
````

Poof, you have table of people. You can add people, edit them, yay!

How does it work
----------------

TBD: Blarg post explaining the codez

