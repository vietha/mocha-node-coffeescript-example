Todo = require './todo'

class TodoList
  constructor : () ->
    @todos = []
    @length = 0

  add : (todo_id) ->
    if typeof todo_id is 'string'
      @todos.push new Todo todo_id
    else if todo_id instanceof Todo
      @todos.push todo_id
    else 
      throw "Can only add a Todo or a string, got #{todo_id}"
    @length++

  remove : (todo_id) ->
    todo = null
    if typeof todo_id is 'string'
      todo = (i for i in data when i.name is todo_id)[0]
    else
      todo = todo_id
    index = @todos.indexOf todo
    @todos.splice index, 1
    @length--

  clear : () ->
    @todos = []
    @length = 0

  completeAll : () ->
    todo.complete() for todo in @todos

module.exports = TodoList