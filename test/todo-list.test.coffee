chai = require 'chai'  
chai.should()

Todo = require '../src/todo'
TodoList = require '../src/todo-list'

describe 'todo list', ->
  todoList = null

  it 'should initially contain zero items', ->
    todoList = new TodoList()
    todoList.todos.length.should.equal 0
    todoList.length.should.equal 0

  it 'should accept new todo as todo object', ->
    todo = new Todo 'wash the dishes'
    todoList.add todo
    todoList.todos[0].name.should.equal 'wash the dishes'
    todoList.length.should.equal 1

  it 'should accept new todo as a string', ->
    todoList.add 'walk the dog'
    todoList.todos[1].name.should.equal 'walk the dog'
    todoList.length.should.equal 2

  it 'should throw an error if a new todo is passed that isnt a string or a Todo', ->
    (->todoList.add(1235)).should.throw 'Can only add a Todo or a string, got 1235'

  it 'should remove all todos', ->
    todoList.clear()
    todoList.length.should.equal 0

  it 'should mark all todos complete', ->
    todoList.add 'walk the dog'
    todoList.add 'open the walk'
    todoList.completeAll()

    for todo in todoList.todos
      todo.status.should.equal 'complete'
