Magic.EditableTableCell = Ember.Table.TableCell.extend
  classNames: 'editable-table-cell'
  templateName: 'editable_table_cell'
  isEditing:  no
  type:       'text'

  startEditing: (model) ->
    @set 'isEditing', yes if model == @get("rowContent")

  didInsertElement: ->
    @get("controller").on "edit", @, @startEditing

  willDestroyElement: ->
    @get("controller").off "edit", @, @startEditing

  innerTextField: Ember.TextField.extend
    typeBinding:  'parentView.type'
    valueBinding: 'parentView.cellContent'
    didInsertElement: -> @$().focus()
    focusOut: (event) ->
      @set 'parentView.isEditing', no

  onRowContentDidChange: Ember.observer ->
    @set 'isEditing', no
  , 'rowContent'

  click: (event) ->
    @set 'isEditing', yes
    event.stopPropagation()

  keyDown: (event) ->
    if event.keyCode == 13
      @set 'isEditing', no
      @get("controller").finishedEditing()

Magic.DateEditableTableCell = Magic.EditableTableCell.extend
  type: "date"

Magic.EditableTableContainer = Ember.Table.TablesContainer.extend Ember.Table.RowSelectionMixin,
  selectionBinding: 'controller.selection'

Magic.EditableTable = Ember.View.extend
  classNames: "presentation-container"
  template: Ember.Handlebars.compile ( '{{view Magic.EditableTableContainer}}\n<button class="button" {{action add}}>Add</button>')

Ember.Handlebars.registerHelper 'magicEditableTable', (path, options) ->
  unless options
    options = path
    path = "controller"
  content = Ember.Handlebars.get(@, path, options)
  if Magic.EditableTableController.detectInstance content
    controller = content
  else
    controller = Magic.EditableTableController.create content: content
  options.hash.controller = controller
  Ember.Handlebars.helpers.view.call(@, Magic.EditableTable, options)