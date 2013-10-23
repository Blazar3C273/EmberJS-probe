Todos.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      this.set('isEditing', true)

    acceptChanges: ->
      this.set('isEditing', false)
      this.get('model').save()

    removeTodo: ->
      todo = this.get('model')
      todo.deleteRecord()
      todo.save()

  isEditing: false,

  isCompleted:(  (key, value)->
    model = this.get('model')
    if (value is undefined)
      # property being used as a getter
      return model.get('isCompleted')
    else
      # property being used as  setter
      model.set('isCompleted', value)
      model.save()
      return value

  ).property('model.isCompleted')

