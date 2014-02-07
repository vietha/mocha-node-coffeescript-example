chai = require 'chai'  
chai.should()

Todo = require '../src/todo'

describe 'Todo item', ->

  task1 = null
  task2 = null

  beforeEach ->
    task1 = null
    task2 = null

  it 'should exist', ->
    Todo.should.be.ok

  it 'should have a default name', ->
    task1 = new Todo
    task1.name.should.equal 'new task'

  it 'should have a name set through the constructor', -> 
    task1 = new Todo 'save the world'
    task1.name.should.equal 'save the world'

  it 'should initially be incomplete', ->
    task1 = new Todo
    task1.status.should.equal 'incomplete'
  it 'should have status of complete when completed', ->
    task1 = new Todo
    task1.complete()
    task1.status.should.equal 'complete'

  it 'should be able to be dependent on another task', ->
    task1 = new Todo 'wash the dishes'
    task2 = new Todo 'dry the dishes'

    task2.dependsOn task1

    task2.status.should.equal 'dependent'
    task2.parent.should.equal task1
    task1.child.should.equal task2

  it 'should refuse to complete a task if it is dependent on an incomplete task', ->
    task1 = new Todo 'wash the dishes'
    task2 = new Todo 'dry the dishes'

    task2.dependsOn task1
    (-> task2.complete()).should.throw "Dependent task 'wash the dishes' is not completed"

  it 'should refuse to create circular dependencies', ->
    task1 = new Todo 'wash the dishes'
    task2 = new Todo 'dry the dishes'

    task2.dependsOn task1
    (->task1.dependsOn task2).should.throw "Trying to create circular dependence between 'wash the dishes' already depends on 'dry the dishes'"
