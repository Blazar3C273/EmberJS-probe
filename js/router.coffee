Todos.Router.map( ->
    this.resource('todos',  path: '/' , ->
        # additional child routes
        this.route('active')
        this.route('completed')
        return
    )
    return)

Todos.TodosRoute = Ember.Route.extend
  model: ->
    this.store.find('todo')

Todos.TodosIndexRoute = Ember.Route.extend
  model: ->
    this.modelFor('todos')

Todos.TodosActiveRoute = Ember.Route.extend
  model: ->
    this.store.filter('todo', (todo) ->
      !todo.get('isCompleted'))
  renderTemplate: (controller) ->
    this.render('todos/index', controller: controller)
    return



Todos.TodosCompletedRoute = Ember.Route.extend
  model: ->
     this.store.filter('todo',  (todo) ->
       todo.get('isCompleted'))

  renderTemplate: (controller) ->
     this.render('todos/index', controller: controller)


