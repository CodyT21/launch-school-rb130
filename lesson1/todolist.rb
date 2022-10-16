# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    @todos << todo
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    tasks = []
    @todos.each { |todo| tasks << todo.title }
    tasks
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    raise IndexError if index >= @todos.length
    @todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index >= @todos.length
    @todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index >= @todos.length
    @todos[index].undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    raise IndexError if index >= @todos.length
    @todos.delete_at(index)
  end

  def to_s
    output = []
    output << "---- #{title} ----"
    @todos.each { |todo| output << todo.to_s }
    output.join("\n")
  end

  def each
    @todos.each { |todo| yield(todo) }
  end

  def select
    results = []
    each { |todo| results << todo if yield(todo) }
    results
  end
end



todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# puts list

# list.pop

# puts list

# list.mark_done_at(1)

# puts list

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect