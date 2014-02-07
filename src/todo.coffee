class Todo
  constructor : (@name = "new task") ->
    @status = 'incomplete'

  dependsOn : (parent) => 
    if @child? and @child is parent
      throw "Trying to create circular dependence between '#{@name}' already depends on '#{@child.name}'"
    @parent = parent
    @parent.child = this
    @status = 'dependent'

  complete : () ->
    if @parent? and @parent.status isnt 'completed'
      throw "Dependent task '#{@parent.name}' is not completed"
    @status = 'complete'

module.exports = Todo