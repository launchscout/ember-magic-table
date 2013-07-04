Ember Magic Table
====================

Ember Magic Table, like the name implies, will magically build you a table from a collection of Ember Data models. It uses ember-table to do the heavy lifting. You can click to edit any cell, and it will commit to the data store on enter. You can also add rows (and probably remove them in the near future).

How to use it
-------------

If you're in a rails project, add ember-magic-table to your Gemfile. Then, you'll need to require it, ember, and ember data in your application.js.coffee

````coffeescript
#= require handlebars
#= require ember
#= require ember-data
#= require ember-magic-table
````

Now, let's say you have a ember data model like so:

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
{{ magicEditableTable }}
````

Poof, you have table of people. You can add people, edit them, yay!

Prove it
--------

Fully working example app: https://github.com/gaslight/ember-magic-table_example

What next?
----------

So this started as a spike to see if we could do it. It could be we incorporate into a larger ember_admin kind of project. Not sure just yet. There are some features that would be handy tho:

* Destroy
* Relationships
* Other types of editors?

How does it work
----------------

TBD: Blarg post explaining the codez

Authors
-------

* Chris Nelson
* Wesley Workman


