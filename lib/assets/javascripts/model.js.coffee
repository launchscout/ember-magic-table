DS.Model.reopenClass
  metaData: ->
    metaData = {}
    @eachComputedProperty (attrName, meta) ->
      metaData[attrName] = meta if meta.isAttribute
    metaData