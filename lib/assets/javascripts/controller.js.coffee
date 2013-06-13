Magic.EditableTableController = Ember.Table.TableController.extend Ember.Evented,
  hasHeader: yes
  hasFooter: no
  # numFixedColumns: 0
  numRows: 5
  rowHeight: 30

  cellEditors:
    string: "Magic.EditableTableCell"
    date: "Magic.DateEditableTableCell"
    number: "Magic.EditableTableCell"

  columns: Ember.computed ->
    columns= []
    return unless @get("content")
    cellEditors = @cellEditors
    for attrName, meta of @get("contentType").metaData()
      do (attrName) ->
        columns.push Ember.Table.ColumnDefinition.create
          headerCellName: attrName.capitalize()
          contentPath: attrName
          tableCellViewClass: cellEditors[meta.type]
          setCellContent: (row, value) -> row.set(attrName, value)
    columns
  .property("content")

  contentType: Ember.computed ->
    @get("actualContent.type")
  .property("actualContent")

  actualContent: Ember.computed ->
    content = @get("content")
    while Ember.ArrayProxy.detectInstance(content) and !DS.RecordArray.detectInstance(content)
      content = content.get "content"
    content
  .property("content")

  add: ->
    model = @get("contentType").createRecord()
    @get("actualContent").addReference(model.get("_reference"))
    Ember.run.schedule "afterRender", => @trigger("edit", model)

  finishedEditing: ->
    DS.get("defaultStore").commit()
