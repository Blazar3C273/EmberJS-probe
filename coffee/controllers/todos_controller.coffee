Todos.TodosController = Ember.ArrayController.extend
  actions:
      createTodo: ->
        # Get the todo title set by the "New Todo" text field
        title = this.get('newTitle')
        if (not title.trim())
          return
        # Create the new Todo model
        todo = this.store.createRecord('todo',title: title,isCompleted: false)
        # Clear the "New Todo" text field
        this.set('newTitle', '')
        # Save the new model
        todo.save()
      clearCompleted: ->
        completed = @filterProperty('isCompleted', true)
        completed.invoke('deleteRecord')
        completed.invoke('save')

  remaining: (()->
    this.filterProperty('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  inflection: (->
      remaining = this.get('remaining')
      return  if remaining is 1 then 'item' else 'items'
  ).property('remaining')

  hasCompleted: ( ->
    this.get('completed') > 0
  ).property('completed')

  completed: (->
    this.filterProperty('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  allAreDone: ((key, value)->
      if (value == undefined)
        return !!this.get('length') && this.everyProperty('isCompleted', true)
      else
        this.setEach('isCompleted', value)
        this.invoke('save')
        return value

  ).property('@each.isCompleted')

